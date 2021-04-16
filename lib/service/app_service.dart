import 'package:chopper/chopper.dart';

// Source code generation in Dart works by creating a new file which contains a "companion class".
// In order for the source gen to know which file to generate and which files are "linked", you need to use the part keyword.
part 'app_service.chopper.dart';

@ChopperApi()
abstract class AppServiceApiService extends ChopperService {

  @Get(path: "/todos")
  Future<Response> getTodos();

  static AppServiceApiService create() {
    final client = ChopperClient(
      // The first part of the URL is now here E.G https://jsonplaceholder.typicode.com
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        // The generated implementation
        _$AppServiceApiService(),
      ],
      // Converts data to & from JSON and adds the application/json header.
      converter: JsonConverter(),
    );

    // The generated class with the ChopperClient passed in
    return _$AppServiceApiService(client);
  }
}