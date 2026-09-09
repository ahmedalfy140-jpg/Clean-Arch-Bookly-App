  import 'package:dio/dio.dart';

  class ApiServices {
    final Dio _dio;
    final baseUrl='https://www.googleapis.com/books/v1/volumes';
    final apikey='AIzaSyCJewSRb7k3o4QyKNoL3aGj9dYWV_vZ95w';

    ApiServices(this._dio);
    Future <Map<String,dynamic>> get({ required String endpoint,String? orderBy ,int startIndex =0})async{
      var response = await _dio.get(baseUrl,
      queryParameters: {
        'q':endpoint,
        'key':apikey,
        'orderBy':orderBy,
         'startIndex': startIndex,
      }
      
      
      );
      return response.data;



    }

  }