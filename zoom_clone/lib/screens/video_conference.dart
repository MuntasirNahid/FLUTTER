import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class VideoConference extends StatelessWidget {
  const VideoConference(
      {super.key,
      required this.conferenceId,
      required this.userId,
      required this.userName});
  final String conferenceId;
  final String userId;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltVideoConference(
      appID: 430044877,
      appSign:
          'dee2110b7ee3b24274ad58c8454e76360806abdd857e9047848e1881d3ed7f84',
      conferenceID: conferenceId,
      userID: userId,
      userName: userName,
      config: ZegoUIKitPrebuiltVideoConferenceConfig(),
    );
  }
}
