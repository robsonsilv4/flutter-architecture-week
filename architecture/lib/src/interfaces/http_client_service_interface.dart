abstract class IHttpClient {
  void addToken(String token);

  Future get(String url);
}
