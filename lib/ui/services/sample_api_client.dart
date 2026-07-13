import 'package:flint_dart/flint_ui.dart';

class SampleApiClient {
  const SampleApiClient._();

  static Future<Map<String, dynamic>> dashboard() async {
    final response = await clientRouter.query<Map<String, dynamic>>(
      '/api/dashboard',
      body: {
        'include': ['metrics', 'activity'],
        'range': 'today',
      },
      query: {
        'source': 'flint-ui',
        'surface': 'dashboard',
      },
      headers: {
        'x-sample-client': 'flint-query',
      },
    );
    return _unwrap(response.data, response.error);
  }

  static Future<Map<String, dynamic>> submitAuth(
    String endpoint,
    Map<String, Object?> data,
  ) async {
    final response = await clientRouter.post<Map<String, dynamic>>(
      endpoint,
      body: data,
    );
    return _unwrap(response.data, response.error);
  }

  static Map<String, dynamic> _unwrap(Object? payload, Object? error) {
    if (error != null) {
      throw _errorPayload(error);
    }
    if (payload is Map<String, dynamic>) {
      if (payload['status'] == 'error') throw payload;
      final data = payload['data'];
      if (data is Map<String, dynamic>) return data;
      return payload;
    }
    return const {};
  }

  static Map<String, dynamic> _errorPayload(Object error) {
    if (error is Map<String, dynamic>) return error;

    try {
      final data = (error as dynamic).data;
      if (data is Map<String, dynamic>) return data;
      if (data is Map) {
        return data.map((key, value) => MapEntry(key.toString(), value));
      }
    } catch (_) {}

    try {
      final message = (error as dynamic).message?.toString();
      if (message != null && message.isNotEmpty) {
        return {'status': 'error', 'message': message};
      }
    } catch (_) {}

    return {'status': 'error', 'message': error.toString()};
  }
}
