# flint-dart-sample

This sample app uses Flint UI as the primary browser experience and includes
the recommended Flint seeder flow.

## Flint UI

The home route returns a Dart UI page with:

```dart
return ctx.res?.page('Welcome', props: data);
```

UI source lives in:

```text
lib/ui
```

Pages live in:

```text
lib/ui/pages
```

Reusable stateless/stateful components live in:

```text
lib/ui/components
```

Included pages:

- `/welcome`
- `/dashboard`
- `/login`
- `/register`

## HTTP QUERY Example

The dashboard API keeps the existing `GET /api/dashboard` route and also
registers `QUERY /api/dashboard` on the same path:

```dart
sample.query('/dashboard', (c) => c.dashboard());
```

The Flint UI client calls it with both a JSON body and query-string
parameters:

```dart
await clientRouter.query('/api/dashboard', body: {
  'include': ['metrics', 'activity'],
  'range': 'today',
}, query: {
  'source': 'flint-ui',
});
```

App-wide root styles and design tokens live in:

```text
lib/ui/styles/app_root_design.dart
```

Build the browser bundle before running the app:

```bash
dart run flint_dart:flint_dart web --build-only
```

Then start the sample:

```bash
dart lib/main.dart
```

## Seeders

Use the registry file as the single entry point:

```text
lib/config/seeder_registry.dart
```

That registry runs all seeders through:

```dart
await runSeeders([
  UserModelSeeder(),
]);
```

Recommended workflow:

1. Create seeders in `lib/seeders`
2. Register them in `lib/config/seeder_registry.dart`
3. Run them with:

```bash
flint --db-seed
```

Included in this sample:

- `lib/seeders/user_model_seeder.dart`
- `lib/config/seeder_registry.dart`
