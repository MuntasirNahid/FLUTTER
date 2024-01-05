import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestAssistant {
  static Future<dynamic> receiveRequest(String url) async {
    http.Response httpResponse = await http.get(Uri.parse(url));

    try {
      if (httpResponse.statusCode == 200) {
        String responseData = httpResponse.body;
        var decodeResponse = jsonDecode(responseData);

        return decodeResponse;
      } else {
        return "Failed.No Response";
      }
    } catch (e) {
      return "Failed.No Response";
    }
  }
}
