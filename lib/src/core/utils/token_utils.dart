import 'dart:convert';

import '../../../main.dart';

/// A utility class for handling JWT token operations
class TokenUtils {
  TokenUtils._(); // Private constructor to prevent instantiation

  /// Parses a JWT token and returns its payload as a Map
  ///
  /// [token] The JWT token to parse
  /// Returns a Map containing the token payload, or an empty map if parsing failed
  static Map<String, dynamic> parseTokenPayload(String token) {
    try {
      if (token.isEmpty) {
        log.e('Error parsing token: Token is empty');
        return {};
      }

      // JWT token consists of 3 parts separated by dots: header.payload.signature
      final parts = token.split('.');
      if (parts.length != 3) {
        log.e('Error parsing token: Invalid token format');
        return {};
      }

      // The payload is the second part, encoded in base64
      String payload = parts[1];

      // Base64 padding adjustment
      while (payload.length % 4 != 0) {
        payload += '=';
      }

      // Replace characters that are different in base64Url vs base64
      String normalizedPayload =
          payload.replaceAll('-', '+').replaceAll('_', '/');

      // Decode the base64 string
      final decodedPayload = utf8.decode(base64Url.decode(normalizedPayload));

      // Parse the JSON payload
      final Map<String, dynamic> jsonPayload = jsonDecode(decodedPayload);

      log.d('Parsed token payload: $jsonPayload');
      return jsonPayload;
    } catch (e) {
      log.e('Error parsing token payload: $e');
      return {};
    }
  }

  /// Extracts a specific claim from a JWT token
  ///
  /// [token] The JWT token
  /// [claimKey] The key of the claim to extract
  /// Returns the claim value, or null if not found or if parsing failed
  static T? extractClaim<T>(String token, String claimKey) {
    final payload = parseTokenPayload(token);
    if (payload.containsKey(claimKey)) {
      return payload[claimKey] as T?;
    }
    return null;
  }

  /// Checks if user has a temporary password
  ///
  /// [token] The JWT token
  /// Returns true if the user has a temporary password
  static bool hasTempPassword(String token) {
    final payload = parseTokenPayload(token);

    // Direct access to hasTempPassword field
    if (payload.containsKey('hasTempPassword')) {
      return payload['hasTempPassword'] as bool? ?? false;
    }

    return false;
  }

  /// Gets the user ID from the token
  ///
  /// [token] The JWT token
  /// Returns the user ID or null if not found
  static String? getUserId(String token) {
    return extractClaim<String>(token, 'sub');
  }

  /// Gets the schools from the token
  ///
  /// [token] The JWT token
  /// Returns a list of schools with their IDs, names, and other details
  static List<Map<String, dynamic>> getSchools(String token) {
    final payload = parseTokenPayload(token);

    // Navigate through permissions.schools path
    if (payload.containsKey('permissions') &&
        payload['permissions'] is Map &&
        (payload['permissions'] as Map).containsKey('schools') &&
        payload['permissions']['schools'] is List) {
      return List<Map<String, dynamic>>.from(payload['permissions']['schools']);
    }

    return [];
  }

  /// Checks if user is a moderator
  ///
  /// [token] The JWT token
  /// Returns true if the user is a moderator
  static bool isModerator(String token) {
    final payload = parseTokenPayload(token);

    if (payload.containsKey('permissions') &&
        payload['permissions'] is Map &&
        (payload['permissions'] as Map).containsKey('isModerator')) {
      return payload['permissions']['isModerator'] as bool? ?? false;
    }

    return false;
  }

  /// Gets the user's job type from the first school
  ///
  /// [token] The JWT token
  /// Returns the job type (e.g., "teacher") or null if not available
  static String? getJobType(String token) {
    final schools = getSchools(token);

    if (schools.isNotEmpty && schools[0].containsKey('jobType')) {
      return schools[0]['jobType'] as String?;
    }

    return null;
  }

  /// Gets the school IDs associated with the user
  ///
  /// [token] The JWT token
  /// Returns a list of school IDs
  static List<int> getSchoolIds(String token) {
    final schools = getSchools(token);
    return schools
        .where((school) => school.containsKey('id'))
        .map((school) => school['id'] as int)
        .toList();
  }

  /// Checks if a token is expired
  ///
  /// [token] The JWT token to check
  /// Returns true if the token is expired, false otherwise
  static bool isTokenExpired(String token) {
    final expiryTimestamp = extractClaim<int>(token, 'exp');

    if (expiryTimestamp == null) {
      return true; // If we can't determine expiry, assume expired
    }

    final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return currentTime > expiryTimestamp;
  }

  /// Gets the remaining time until token expiration in seconds
  ///
  /// [token] The JWT token
  /// Returns the remaining time in seconds, or 0 if the token is already expired
  static int getTokenRemainingTime(String token) {
    final expiryTimestamp = extractClaim<int>(token, 'exp');

    if (expiryTimestamp == null) {
      return 0;
    }

    final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final remainingTime = expiryTimestamp - currentTime;

    return remainingTime > 0 ? remainingTime : 0;
  }
}
