import 'package:dio/dio.dart';

abstract class Failures {
   final String errorMessage;
  Failures({required this.errorMessage});
}

// ignore: camel_case_types
class serverFailures extends Failures{
  serverFailures({required super.errorMessage});

  
  // ignore: deprecated_member_use
  factory serverFailures.fromDioError(DioError dioError) {

    switch(dioError.type) {
      case DioExceptionType.connectionTimeout:
      return serverFailures(errorMessage: 'Connection Timeout with ApiServer !');

      case DioExceptionType.sendTimeout:
      return serverFailures(errorMessage: 'Send Timeout with ApiServer !');

      case DioExceptionType.receiveTimeout:
      return serverFailures(errorMessage: 'Receive Timeout with ApiServer !');

      case DioExceptionType.badCertificate:
      return serverFailures(errorMessage: 'Bad Certificate with ApiServer !');

      case DioExceptionType.badResponse:
      return serverFailures.fromResponse(dioError.response!.statusCode!, dioError.response!.data);

      case DioExceptionType.cancel:
      return serverFailures(errorMessage: 'Request to ApiServer was canceld !');

      case DioExceptionType.unknown:
      return serverFailures(errorMessage: 'Unexpected Error, Please try later again !');

      case DioExceptionType.connectionError:
      return serverFailures(errorMessage: 'No internet Connection');
    } 
  }

  factory serverFailures.fromResponse(int stateCode,dynamic response) {
    if(stateCode == 401 || stateCode == 402 || stateCode == 403 || stateCode == 422) {
      return serverFailures(errorMessage: response['message']);
    }
    else if(stateCode == 404) {
      return serverFailures(errorMessage: 'Your response no found,Please try later !');
    }
    else if(stateCode == 500) {
      return serverFailures(errorMessage: 'Internal server error, Please try later !');
    } else {
      return serverFailures(errorMessage: 'Opps there was an error, Please try again !');
    }
  }
}