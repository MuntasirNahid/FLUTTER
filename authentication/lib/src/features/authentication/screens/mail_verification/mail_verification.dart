import 'package:authbased/src/features/authentication/controllers/mail_verification_controller.dart';
import 'package:authbased/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LineAwesomeIcons.envelope_open,
              size: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Email Verification"),
            SizedBox(
              height: 20,
            ),
            Text(
              'Verify your email',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 200,
              child: OutlinedButton(
                
                onPressed: () {
                  controller.manuallyCheckEmailVerificationStatus();
                },
                child: Text('Continue'),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                controller.sendVerificationEmail();
              },
              child: Text('Resend Email Link'),
            ),
            TextButton(
              onPressed: () => AuthenticationRepository.instance.logOut(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LineAwesomeIcons.alternate_long_arrow_left,
                  ),
                  Text(
                    'Back To Login'.toLowerCase(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
