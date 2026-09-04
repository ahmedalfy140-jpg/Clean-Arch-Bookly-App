import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection timeout with API server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout with API server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout with API server');

      case DioExceptionType.badCertificate:
        return ServerFailure('bad certificate');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response?.statusCode ?? 0,
          dioError.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('request was cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure('no internet connection');

      case DioExceptionType.unknown:
        return ServerFailure('unexpected error');

      case DioExceptionType.transformTimeout:
        return ServerFailure('data transformation failed');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403) {
      return ServerFailure(
        response['error']?['message'] ?? 'unknown error',
      );
    } else if (statusCode == 404) {
      return ServerFailure('not found, please try later');
    } else if (statusCode == 429) {
      return ServerFailure('Too many requests, please try later');
    } else if (statusCode == 500) {
      return ServerFailure('internal server error, please try later');
    } else {
      return ServerFailure('oops there was an error');
    }
  }
}