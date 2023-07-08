import 'dart:convert';

import 'package:http/http.dart' as http;

/// This is the main object
class Connection {
  /// The http client
  late http.Client _client;

  /// The domain authority
  ///
  /// eg. www.domain.com
  /// eg. api.domain.com
  late final String authority;

  /// Default headers
  ///
  Map<String, String>? defaultHeaders;

  /// Initialize the connection
  Connection({required this.authority, this.defaultHeaders}) {
    _client = http.Client();
  }

  /// HTTPS GET with optional params
  Future<Response> get({
    /// The endpoint to call
    ///
    /// If the endpoint has path parameters, build the string first
    /// before sending it here.
    ///
    /// eg. /v1/some/endpoint/
    /// eg. v1/another/endpoint
    /// eg. v1/another/endpoint?filtered=true
    required String endpoint,

    /// A map of query params
    ///
    /// eg.
    /// ```dart
    /// {
    ///   "some": "thing",
    ///   "another": "thing,
    /// }
    /// ```
    Map<String, dynamic>? params,

    /// Headers for this particular call.
    ///
    /// If no headers are provided, will fall back to default headers.
    ///
    /// If no default headers are provided, will not send headers.
    Map<String, String>? headers,
  }) async {
    Map<String, String>? instanceHeaders = headers ?? defaultHeaders;
    try {
      final response = await _client.get(
        Uri.https(authority, endpoint, params),
        headers: instanceHeaders,
      );
      return Response(response.statusCode, response.body);
    } catch (e) {
      rethrow;
    }
  }

  /// HTTPS POST with optional params
  Future<Response> post({
    /// The endpoint to call
    ///
    /// If the endpoint has path parameters, build the string first
    /// before sending it here.
    ///
    /// eg. /v1/some/endpoint/
    /// eg. v1/another/endpoint
    /// eg. v1/another/endpoint?filtered=true
    required String endpoint,

    /// A map of payload
    ///
    /// eg.
    /// ```dart
    /// {
    ///   "some": "thing",
    ///   "another": "thing,
    /// }
    /// ```
    Map<String, dynamic>? payload,

    /// Headers for this particular call.
    ///
    /// If no headers are provided, will fall back to default headers.
    ///
    /// If no default headers are provided, will not send headers.
    Map<String, String>? headers,
  }) async {
    Map<String, String>? instanceHeaders = headers ?? defaultHeaders;
    try {
      final response = await _client.post(
        Uri.https(authority, endpoint),
        headers: instanceHeaders,
        body: json.encode(payload),
      );
      return Response(response.statusCode, response.body);
    } catch (e) {
      rethrow;
    }
  }

  /// Close the connection
  void close() {
    _client.close();
  }
}

/// Response from the API
class Response {
  /// The status code from the API call
  int statusCode;

  /// The body from the API response
  String body;

  Response(this.statusCode, this.body);
}
