import 'package:authbased/src/features/core/models/dashborad/categories_model.dart';
import 'package:flutter/material.dart';

class DashBoardCategories extends StatelessWidget {
  const DashBoardCategories({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategoryModels.list;
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
            height: 170,
            width: 160,
            child: Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      list[index].title,
                      style: txtTheme.headline6!.apply(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[index].heading,
                        style: txtTheme.headline6,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        list[index].subHeading,
                        style: txtTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),

        // children: [
        //   SizedBox(
        //     height: 170,
        //     width: 160,
        //     child: Row(
        //       children: [
        //         Container(
        //           height: 45,
        //           width: 45,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Colors.black,
        //           ),
        //           child: Center(
        //             child: Text(
        //               'JS',
        //               style: txtTheme.headline6!.apply(
        //                 color: Colors.white,
        //               ),
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           width: 5,
        //         ),
        //         Flexible(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 'Java Script ',
        //                 style: txtTheme.headline6,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //               Text(
        //                 '10 Class',
        //                 style: txtTheme.bodyLarge,
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           width: 10,
        //         ),
        //       ],
        //     ),
        //   ),
        //   SizedBox(
        //     height: 170,
        //     width: 160,
        //     child: Row(
        //       children: [
        //         Container(
        //           height: 45,
        //           width: 45,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Colors.black,
        //           ),
        //           child: Center(
        //             child: Text(
        //               'JS',
        //               style: txtTheme.headline6!.apply(
        //                 color: Colors.white,
        //               ),
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           width: 5,
        //         ),
        //         Flexible(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 'Java Script',
        //                 style: txtTheme.headline6,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //               Text(
        //                 '10 Class',
        //                 style: txtTheme.bodyLarge,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           width: 10,
        //         ),
        //       ],
        //     ),
        //   ),
        //   SizedBox(
        //     height: 170,
        //     width: 160,
        //     child: Row(
        //       children: [
        //         Container(
        //           height: 45,
        //           width: 45,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Colors.black,
        //           ),
        //           child: Center(
        //             child: Text(
        //               'JS',
        //               style: txtTheme.headline6!.apply(
        //                 color: Colors.white,
        //               ),
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           width: 5,
        //         ),
        //         Flexible(
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Text(
        //                 'Java Script',
        //                 style: txtTheme.headline6,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //               Text(
        //                 '10 Class',
        //                 style: txtTheme.bodyLarge,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           width: 10,
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
