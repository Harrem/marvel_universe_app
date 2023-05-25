abstract class BaseApiService {
  final String baseUrl = 'https://gateway.marvel.com:443/v1/public/';

  Future<dynamic> getResponse(String url);
}
