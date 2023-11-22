import 'package:animate_do/animate_do.dart';
import 'package:chatgpt_dalle/home_page/widgets/dallEResponse.dart';
import 'package:chatgpt_dalle/home_page/widgets/text_response.dart';
import 'package:chatgpt_dalle/openai_service.dart';
import 'package:chatgpt_dalle/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'home_page/widgets/assistant_Image.dart';
import 'home_page/widgets/feature_list.dart';
import 'home_page/widgets/feature_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  final flutterTts = FlutterTts();
  String lastWords = '';
  final OpenAIService openAIService = OpenAIService();
  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    //  initTextToSpeech();
  }

  //this is for ios only

  // Future<void> initTextToSpeech() async {
  //   await flutterTts.setSharedInstance(true);
  //   setState(() {});
  // }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> systemSpeak(String content) async {
    await flutterTts.speak(content);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    speechToText.stop();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BounceInDown(
          child: const Text('Tosar GPT'),
        ),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AssistantImage(),
            const SizedBox(
              height: 20,
            ),

            //chat text reaponse
            TextResponse(
              generatedImageUrl: generatedImageUrl,
              generatedContent: generatedContent,
            ),

            //image response
            if (generatedImageUrl != null)
              DallEResponse(
                generatedImageUrl: generatedImageUrl,
              ),

            FeatureText(
              generatedContent: generatedContent,
              generatedImageUrl: generatedImageUrl,
            ),

            FeatureLists(
              generatedContent: generatedContent,
              generatedImageUrl: generatedImageUrl,
              start: start,
              delay: delay,
            )
          ],
        ),
      ),

      //voice command button
      floatingActionButton: ZoomIn(
        delay: Duration(milliseconds: start + 3 * delay),
        child: FloatingActionButton(
          backgroundColor: Pallete.firstSuggestionBoxColor,
          onPressed: () async {
            if (await speechToText.hasPermission &&
                speechToText.isNotListening) {
              print('Started Listening');
              await startListening();
            } else if (speechToText.isListening) {
              print('stopped listening');
              final speech = await openAIService.isArtPromptAPI(lastWords);
              print(speech.toString());
              if (speech.contains('https')) {
                generatedImageUrl = speech;
                generatedContent = null;
                setState(() {});
              } else {
                generatedImageUrl = null;
                generatedContent = speech;
                setState(() {});
                await systemSpeak(speech);
              }
              await stopListening();
            } else {
              initSpeechToText();
            }
          },
          child: Icon(
            speechToText.isListening ? Icons.stop : Icons.mic,
          ),
        ),
      ),
    );
  }
}
