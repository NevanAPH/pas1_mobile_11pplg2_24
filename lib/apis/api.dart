const String authUrl = "https://mediadwi.com/api/latihan";
const String baseUrl = "https://www.thesportsdb.com/api/v1/json/3";

class ApiException implements Exception {
  String cause;
  ApiException(this.cause);
}