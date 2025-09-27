import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class CurlLoggerInterceptor extends Interceptor {
  static int _requestCounter = 0;
  static final Map<int, String> _curlCommands = {};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final curl = _getCurlCommand(options);
    _requestCounter++;
    _curlCommands[_requestCounter] = curl;

    // Log with better formatting
    log('🚀 REQUEST #$_requestCounter\n$curl\n');

    handler.next(options);
  }

  /// Copy a specific curl command to clipboard by its number
  static Future<void> copyToCurl(int requestNumber) async {
    final curl = _curlCommands[requestNumber];
    if (curl != null) {
      try {
        await Clipboard.setData(ClipboardData(text: curl));
        log('✅ cURL #$requestNumber copied to clipboard!');
      } catch (error) {
        log('❌ Failed to copy cURL #$requestNumber: $error');
      }
    } else {
      log('❌ cURL #$requestNumber not found');
    }
  }

  /// Get all available curl commands
  static Map<int, String> getAllCurls() => Map.from(_curlCommands);

  /// Clear the curl command history
  static void clearHistory() {
    _curlCommands.clear();
    _requestCounter = 0;
    log('🗑️ cURL history cleared');
  }

  String _getCurlCommand(RequestOptions options) {
    var components = <String>['curl'];

    // Method
    if (options.method.toUpperCase() != 'GET') {
      components.add('-X ${options.method.toUpperCase()}');
    }

    // Headers
    options.headers.forEach((key, value) {
      if (key != 'Cookie') {
        // Skip cookie header
        components.add("-H '$key: ${_escapeQuotes(value.toString())}'");
      }
    });

    // Data/Body
    if (options.data != null) {
      String data;
      if (options.data is Map || options.data is List) {
        data = _getPrettyJsonString(options.data);
      } else if (options.data is FormData) {
        final formData = options.data as FormData;
        final fields = formData.fields
            .map(
                (e) => '"${_escapeQuotes(e.key)}": "${_escapeQuotes(e.value)}"')
            .join(',\n  ');
        data = '{\n  $fields\n}';
      } else {
        data = options.data.toString();
      }
      components.add("-d '${_escapeQuotes(data)}'");
    }

    // URL
    var url = '';
    if (options.path.startsWith('http')) {
      // If path is already a full URL, use it as is
      url = options.path;
    } else {
      // Otherwise, combine baseUrl and path
      url = options.baseUrl + options.path;
    }

    if (options.queryParameters.isNotEmpty) {
      final query = options.queryParameters.entries
          .map((e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}')
          .join('&');
      url += '?$query';
    }
    components.add("'$url'");

    // Format with line breaks for readability
    return _formatCurlCommand(components);
  }

  String _formatCurlCommand(List<String> components) {
    if (components.length <= 3) {
      // Simple commands stay on one line
      return components.join(' ');
    }

    // Multi-line format for complex commands
    final buffer = StringBuffer();
    buffer.write(components.first); // curl

    for (int i = 1; i < components.length - 1; i++) {
      buffer.write(' \\\n  ${components[i]}');
    }

    // URL goes on the last line
    buffer.write(' \\\n  ${components.last}');

    return buffer.toString();
  }

  String _getPrettyJsonString(dynamic data) {
    try {
      var encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(data);
    } catch (e) {
      return json.encode(data);
    }
  }

  String _escapeQuotes(String str) {
    return str.replaceAll("'", "\\'");
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      String responseBody = '';
      if (response.data != null) {
        if (response.data is Map || response.data is List) {
          final prettyData = _getPrettyJsonString(response.data);
          // Truncate very long responses
          if (prettyData.length > 1000) {
            responseBody =
                '\n📄 Body: ${prettyData.substring(0, 1000)}... (truncated)';
          } else {
            responseBody = '\n📄 Body: $prettyData';
          }
        } else {
          final dataStr = response.data.toString();
          if (dataStr.length > 500) {
            responseBody =
                '\n📄 Body: ${dataStr.substring(0, 500)}... (truncated)';
          } else {
            responseBody = '\n📄 Body: $dataStr';
          }
        }
      }

      log('✅ RESPONSE #$_requestCounter\n'
          '📊 Status: ${response.statusCode}\n'
          '📋 Headers: ${_formatHeaders(response.headers.map)}'
          '$responseBody\n');
    } catch (e) {
      log('✅ RESPONSE #$_requestCounter\n'
          '📊 Status: ${response.statusCode}\n'
          '⚠️ Failed to parse response body: $e\n');
    }
    handler.next(response);
  }

  String _formatHeaders(Map<String, dynamic> headers) {
    if (headers.isEmpty) return '{}';

    final formatted =
        headers.entries.map((e) => '    "${e.key}": "${e.value}"').join(',\n');
    return '{\n$formatted\n  }';
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('❌ ERROR #$_requestCounter\n'
        '📊 Status: ${err.response?.statusCode ?? 'N/A'}\n'
        '💬 Message: ${err.message}\n'
        '🔍 Error: ${err.error}\n'
        '🔗 Type: ${err.type}\n');
    handler.next(err);
  }
}
