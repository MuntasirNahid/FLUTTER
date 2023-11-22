import 'dart:convert';

import 'package:chatgpt_dalle/secrets.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  final List<Map<String, String>> messages = [];

  Future<String> isArtPromptAPI(String prompt) async {
    print('Iam here');
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $OpenAIApiKey'
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              'role': 'user',
              'content':
                  'Does this message want to generate an AI picture,image,art or anything similar?$prompt . Simply answer with yes or no.',
            }
          ]
        }),
      );
      print(res.body);
      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();

        switch (content) {
          case 'Yes':
          case 'Yes.':
          case 'yes':
          case 'yes.':
            final res = await DallEAPI(prompt);
            print('res');

            return res;
          default:
            final res = await ChatGPTAPI(prompt);
            print('res');
            return res;
        }
      }
      return 'An Internal error occured';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> ChatGPTAPI(String prompt) async {
    //storing the previous prompt
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $OpenAIApiKey'
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages,
        }),
      );

      if (res.statusCode == 200) {
        print(res.body);

        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
      }
      return 'an Internal error occured';
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> DallEAPI(String prompt) async {
    //storing the previous prompt
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/images/generations'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $OpenAIApiKey'
        },
        body: jsonEncode({
          "prompt": prompt,
          'n': 1,
        }),
      );

      if (res.statusCode == 200) {
        print(res.body);
        String imageUrl = jsonDecode(res.body)['data'][0]['url'];
        imageUrl = imageUrl.trim();

        messages.add({
          'role': 'assistant',
          'content': imageUrl,
        });
        return imageUrl;
      }
      return 'an Internal error occured';
    } catch (e) {
      return e.toString();
    }
  }
}
