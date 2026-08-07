import '../../data/api/api_endpoints.dart';

/// Resolves a possibly-relative media path (e.g. from the backend's
/// upload response, "/uploads/restaurants/xyz.png") into a full,
/// absolute URL that Image.network can actually load.
String? resolveMediaUrl(String? path) {
  if (path == null || path.isEmpty) return null;

  // Already absolute — nothing to do.
  if (path.startsWith('http://') || path.startsWith('https://')) {
    return path;
  }

  // Media is served from the server root, not under /api/v1.
  final uri = Uri.parse(ApiEndpoints.baseUrl);
  final origin = '${uri.scheme}://${uri.host}${uri.hasPort ? ':${uri.port}' : ''}';

  return path.startsWith('/') ? '$origin$path' : '$origin/$path';
}