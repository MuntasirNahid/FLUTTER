import 'package:authbased/src/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              otpTitle,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 80,
              ),
            ),
            Text(
              otpSubtitle,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '$otpMessage support@funemail.com',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 15,
            ),
            OtpTextField(
              numberOfFields: 6,
              filled: true,
              fillColor: Colors.black.withOpacity(0.1),
              keyboardType: TextInputType.number,
              // obscureText: true,
              onSubmit: (value) {
                print('The code is $value');
              },
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('NEXT'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
