import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:zoom_clone/screens/video_conference.dart';
import 'package:zoom_clone/utills/colors.dart';
import 'package:zoom_clone/widgets/meeting_options.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  var jitsiMeet = JitsiMeet();
  var options = JitsiMeetConferenceOptions(room: 'jitsiIsAwesome');

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: const Text(
          'Join A Meeting',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: meetingIdController,
              maxLines: 1,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: secondaryBackgroundColor,
                filled: true,
                hintText: 'Room Id',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              maxLines: 1,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: secondaryBackgroundColor,
                filled: true,
                hintText: 'Name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                //   jitsiMeet.join(options);
                VideoConference(
                  conferenceId: meetingIdController.text,
                  userId: _authMethods.user.uid,
                  userName: nameController.text,
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Join',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            MeetingOptions(
              text: 'Mute Audio?',
              isMuted: isAudioMuted,
              onChange: onAudioMuted,
            ),
            MeetingOptions(
              text: 'Mute Video?',
              isMuted: isVideoMuted,
              onChange: onVideoMuted,
            ),
          ],
        ),
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
