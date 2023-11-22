import 'package:authbased/src/constants/image_strings.dart';
import 'package:authbased/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class topCourseIndividual extends StatelessWidget {
  final TextTheme txtTheme;

  final String heading;
  final String title;
  final String subHeading;
  final String picturePath;
  const topCourseIndividual({
    super.key,
    required this.txtTheme,
    required this.heading,
    required this.title,
    required this.subHeading,
    required this.picturePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.95,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: txtTheme.headline5?.apply(fontWeightDelta: 2),
                  ),
                ),
                Flexible(
                  child: Image.asset(
                    welcomeScreenImage,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: dashBoardCardPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                  onPressed: () {},
                  child: Icon(
                    Icons.play_arrow,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: txtTheme.headline6?.apply(fontWeightDelta: 2),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      subHeading,
                      style: txtTheme.bodyText2?.apply(fontWeightDelta: 2),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
