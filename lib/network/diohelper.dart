import 'package:dio/dio.dart';

class DioHelper{
  static Dio ?dio;
  static void init(){
    dio=Dio(
        BaseOptions(
          baseUrl: 'http://192.168.43.200:8000/api/',
          receiveDataWhenStatusError: true,
        )
    );
  }

 static String bearerToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjgzMjIxMzg0LCJleHAiOjIwNDMyMjEzODQsIm5iZiI6MTY4MzIyMTM4NCwianRpIjoiaGljY3h1OTBnQTVKRURRNyIsInN1YiI6IjEiLCJwcnYiOiI5YzQyOWU2YTYwY2Q1Mjg1NDczZjJjOGJjNzAxZWMwOTQ4ZGY0ZDhjIn0.FPoKhIQ2W09ZkA5-4vTLnPHQck87U05J-I-xg5EMVkk";
  static Future<Response> postData({required url ,data,query})async{
    dio!.options.headers["Authorization"] = "Bearer $bearerToken";
    return await dio!.post(
     '$url',
      data: data,
      queryParameters: query

    );
  }
  static Future<Response>getData({required url,quary})async{
    dio!.options.headers["Authorization"] = "Bearer $bearerToken";
    return await dio!.get(
     '$url',
      queryParameters: quary
    );
  }

}