import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static const BASE_URL = "http://newsapi.org/v2";
  //取得apiを入れてください
  static const API_KEY = "";

  static ApiService create(){
    final client = ChopperClient(
        baseUrl: BASE_URL,
        services: [
          _$ApiService()
        ],
        converter: JsonConverter()
    );
    return _$ApiService(client);
  }

  @Get(path: "/top-headlines")
  Future<Response> getHeadlines(
      {@Query("country") String country = "jp",
        @Query("pageSize") int pageSize = 10,
        @Query("apiKey") String apiKey = ApiService.API_KEY});

  @Get(path: "/top-headlines")
  Future<Response> getKeyWords(
      {@Query("country") String country = "jp",
        @Query("pageSize") int pageSize = 30,
        @Query("q") String keyword,
        @Query("apiKey") String apiKey = ApiService.API_KEY});

  @Get(path: "/top-headlines")
  Future<Response> getCategory(
      {@Query("country") String country = "jp",
        @Query("pageSize") int pageSize = 30,
        @Query("category") String category = "business",
        @Query("apiKey") String apiKey = ApiService.API_KEY});
}
