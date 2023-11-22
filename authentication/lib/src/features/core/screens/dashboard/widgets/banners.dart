import 'package:authbased/src/constants/app_text.dart';
import 'package:authbased/src/constants/colors.dart';
import 'package:authbased/src/constants/image_strings.dart';
import 'package:authbased/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class DashBoardBanners extends StatelessWidget {
  const DashBoardBanners({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.withOpacity(0.7)),
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.bookmark),
                          Flexible(
                            child: Image.asset(
                              welcomeScreenImage,
                              height: 130,
                              width: 120,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Android For Begineers',
                        style: txtTheme.headline6,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '10 Lessons',
                        style: txtTheme.bodyText2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: dashBoardCardPadding,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.withOpacity(0.7),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.bookmark),
                          Flexible(
                            child: Image.asset(
                              welcomeScreenImage,
                              height: 130,
                              width: 120,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Java For Begineers',
                        style: txtTheme.headline6,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '10 Lessons',
                        style: txtTheme.bodyText2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      DashboardButton,
                    ),
                    // style: OutlinedButton.styleFrom(
                    //   foregroundColor: cardBgColor,
                    //   backgroundColor: Colors.grey.withOpacity(
                    //     0.7,
                    //   ),
                    // ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
