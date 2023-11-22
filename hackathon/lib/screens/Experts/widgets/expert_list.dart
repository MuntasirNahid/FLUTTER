import 'package:flutter/material.dart';

class ExpertWidget extends StatelessWidget {
  final String expertName;
  final String expertIn;
  final String totalUpvote;
  final String expertImage;

  const ExpertWidget({
    super.key,
    required this.expertName,
    required this.expertIn,
    required this.totalUpvote,
    required this.expertImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.30),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: GestureDetector(
        
        onTap: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
              ),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0x2821D8DE),
                ),
                child: Image.asset(expertImage),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 13.0),
                  child: Text(
                    expertName,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.school,
                      color: Color(0xFF898989),
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      expertIn,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF898989),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.thumb_up,
                      color: Color(0xFF898989),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      totalUpvote,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF898989),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xFF898989),
              ),
            )
          ],
        ),
      ),
    );
  }
}
