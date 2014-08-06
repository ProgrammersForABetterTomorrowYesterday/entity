part of magnetfruit_entity;

class HttpMethod {
  static const int NONE = 0x00;
  static const int OPTIONS = 0x01;
  static const int GET = 0x02;
  static const int HEAD = 0x04;
  static const int POST = 0x08;
  static const int PUT = 0x10;
  static const int DELETE = 0x20;
  static const int ALL = 0x3F;

  static final Map<String, int> _httpMethods = {
      'OPTIONS': OPTIONS,
      'GET': GET,
      'HEAD': HEAD,
      'POST': POST,
      'PUT': PUT,
      'DELETE': DELETE
  };

  static int getHttpMethodValue(String method) {
    if (method != null && method.isNotEmpty) {
      for (final key in _httpMethods.keys) {
        if (new RegExp(key, caseSensitive: false).hasMatch(method)) {
          return _httpMethods[key];
        }
      }
    }

    return NONE;
  }
}
