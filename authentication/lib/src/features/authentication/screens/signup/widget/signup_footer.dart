import 'package:authbased/src/constants/image_strings.dart';
import 'package:flutter/material.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('OR'),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: Image(
              image: AssetImage(welcomeScreenImage),
              width: 20,
            ),
            label: Text("Sign-Up with Google"),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: "Already Have an account?",
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: 'Login'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
