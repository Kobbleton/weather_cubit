import 'package:http/http.dart' as http;

String httpErrorHandler(http.Response response) {
  final statuscode = response.statusCode;
  final reasonPhrase = response.reasonPhrase;

  final String errorMessage =
      ' Request failed\nStatus Code: $statuscode\nReason: $reasonPhrase';

  return errorMessage;
}
