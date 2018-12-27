import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<http.Response> get(url, {Map<String, String> headers}) async {
  final uri = Uri.encodeFull(url);
  var authHeaders = {HttpHeaders.authorizationHeader: _getAuthorizationToken()};
  if (headers != null) {
    authHeaders.addAll(headers);
  }
  final response = await http.get(
    uri,
    headers: _addServiceHeaders(headers),
  );

  if (response.statusCode == 200) {
    return response;
  } else {
    throw _getHttpError(response, uri);
  }
}

Future<http.Response> post(String url, {Map<String, String> headers, body, Encoding encoding}) async {
  final response = await http.post(
    Uri.encodeFull(url),
    headers: _addServiceHeaders(headers),
    body: body,
    encoding: encoding
  );

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return response;
  } else {
    throw _getHttpError(response, url);
  }
}

Future<http.Response> put(String url, {Map<String, String> headers, body, Encoding encoding}) async {
  final response = await http.put(
    Uri.encodeFull(url),
    headers: _addServiceHeaders(headers),
    body: body,
    encoding: encoding
  );

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return response;
  } else {
    throw _getHttpError(response, url);
  }
}

Future<http.Response> delete(String url, {Map<String, String> headers}) async {
  final response = await http.delete(
    Uri.encodeFull(url),
    headers: _addServiceHeaders(headers)
  );

  if (response.statusCode >= 200 && response.statusCode < 300) {
    return response;
  } else {
    throw _getHttpError(response, url);
  }
}

HttpException _getHttpError(http.Response response, String url) {
  return HttpException('Http error: ${response.body}', uri: Uri.parse(url));
}

String _getAuthorizationToken() {
  return "Basic your_api_token_here";
}

Map<String, String> _addServiceHeaders(Map<String, String> headers) {
  Map<String, String> resultHeaders = {HttpHeaders.authorizationHeader: _getAuthorizationToken()};
  if (headers != null) {
     resultHeaders.addAll(headers);
  }
  return resultHeaders;
}