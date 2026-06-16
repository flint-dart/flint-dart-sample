const FLINT_CACHE = 'flint-ui-1781618881505';
const FLINT_MANIFEST_URL = '/assets/js/flint-ui/manifest.json';

async function flintCacheUrls(urls) {
  const cache = await caches.open(FLINT_CACHE);
  for (const url of Array.from(new Set(urls)).filter(Boolean)) {
    try {
      if (await cache.match(url)) continue;
      const response = await fetch(url, { cache: 'reload' });
      if (response.ok) await cache.put(url, response);
      await new Promise(resolve => setTimeout(resolve, 1200));
    } catch (_) {}
  }
}

async function flintManifestAssets({ includeFallback = false } = {}) {
  try {
    const response = await fetch(FLINT_MANIFEST_URL, { cache: 'reload' });
    if (!response.ok) return [FLINT_MANIFEST_URL];
    const manifest = await response.json();
    const pages = manifest && manifest.pages && typeof manifest.pages === 'object'
      ? Object.values(manifest.pages)
      : [];
    const chunks = Array.isArray(manifest && manifest.chunks)
      ? manifest.chunks
      : [];
    return [
      FLINT_MANIFEST_URL,
      manifest.runtime,
      ...(includeFallback || pages.length === 0 ? [manifest.fallback] : []),
      ...pages,
      ...chunks
    ];
  } catch (_) {
    return [FLINT_MANIFEST_URL];
  }
}

self.addEventListener('install', event => {
  event.waitUntil((async () => {
    await flintCacheUrls([FLINT_MANIFEST_URL]);
    await self.skipWaiting();
  })());
});

self.addEventListener('activate', event => {
  event.waitUntil((async () => {
    const keys = await caches.keys();
    await Promise.all(
      keys
        .filter(key => key.startsWith('flint-ui-') && key !== FLINT_CACHE)
        .map(key => caches.delete(key))
    );
    await self.clients.claim();
  })());
});

self.addEventListener('message', event => {
  if (event.data && event.data.type === 'FLINT_PREFETCH') {
    event.waitUntil((async () => {
      await new Promise(resolve => setTimeout(resolve, 12000));
      await flintCacheUrls(await flintManifestAssets());
    })());
  }
});

self.addEventListener('fetch', event => {
  const url = new URL(event.request.url);
  if (event.request.method !== 'GET' || url.origin !== self.location.origin) {
    return;
  }

  const cacheFirst =
    url.pathname.startsWith('/assets/js/flint-ui/') ||
    url.pathname.startsWith('/assets/css/flint-ui/') ||
    url.pathname === FLINT_MANIFEST_URL;

  if (!cacheFirst) return;

  event.respondWith((async () => {
    const cached = await caches.match(event.request);
    if (cached) return cached;
    const response = await fetch(event.request);
    if (response.ok) {
      const cache = await caches.open(FLINT_CACHE);
      await cache.put(event.request, response.clone());
    }
    return response;
  })());
});
