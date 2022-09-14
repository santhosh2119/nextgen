import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CommonHelper {
  ConstantColors cc = ConstantColors();
  //common appbar
  appbarCommon(String title, BuildContext context, VoidCallback pressed) {
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: cc.greyPrimary),
      title: Text(
        title,
        style: TextStyle(
            color: cc.greyPrimary, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: InkWell(
        onTap: pressed,
        child: const Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
      ),
    );
  }

  bRow(String title, String text, {bool lastBorder = true}) {
    return Column(
      children: [
        Row(
          children: [
            //icon
            SizedBox(
              width: 125,
              child: Row(children: [
                // ignore: unrelated_type_equality_checks

                SizedBox(
                  width: 125,
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: cc.greyFour,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ]),
            ),

            Flexible(
              child: Text(
                text,
                style: TextStyle(
                  color: cc.greyFour,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
        lastBorder == true
            ? Container(
                margin: const EdgeInsets.symmetric(vertical: 14),
                child: CommonHelper().dividerCommon(),
              )
            : Container()
      ],
    );
  }

  //common orange button =======>
  buttonOrange(String title, VoidCallback pressed, {isloading = false}) {
    return InkWell(
      onTap: pressed,
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
              color: cc.primaryColor, borderRadius: BorderRadius.circular(8)),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          )),
    );
  }

  borderButtonOrange(String title, VoidCallback pressed) {
    return InkWell(
      onTap: pressed,
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 17),
          decoration: BoxDecoration(
              border: Border.all(color: cc.primaryColor),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            title,
            style: TextStyle(
              color: cc.primaryColor,
              fontSize: 14,
            ),
          )),
    );
  }

  labelCommon(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Text(
        title,
        style: TextStyle(
          color: cc.greyThree,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  paragraphCommon(String title, TextAlign textAlign) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        color: cc.greyParagraph,
        height: 1.4,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  titleCommon(String title) {
    return Text(
      title,
      style: TextStyle(
          color: cc.greyPrimary, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  dividerCommon() {
    return Divider(
      thickness: 1,
      height: 2,
      color: cc.borderColor,
    );
  }

  checkCircle() {
    return Container(
      padding: const EdgeInsets.all(3),
      child: const Icon(
        Icons.check,
        size: 13,
        color: Colors.white,
      ),
      decoration: BoxDecoration(shape: BoxShape.circle, color: cc.primaryColor),
    );
  }

  // profileImage(String imageLink, double height, double width) {
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(6),
  //     child: CachedNetworkImage(
  //       imageUrl: imageLink,
  //       placeholder: (context, url) {
  //         return Image.asset('assets/images/placeholder.png');
  //       },
  //       height: height,
  //       width: width,
  //       fit: BoxFit.cover,
  //     ),
  //   );
  // }

  //no order found
  // nothingfound(BuildContext context, String title) {
  //   return Container(
  //       height: MediaQuery.of(context).size.height - 120,
  //       alignment: Alignment.center,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(
  //             LineAwesomeIcons.hourglass,
  //             size: 26,
  //             color: cc.greyFour,
  //           ),
  //           const SizedBox(
  //             height: 7,
  //           ),
  //           Text(
  //             title,
  //             style: TextStyle(color: cc.greyFour),
  //           ),
  //         ],
  //       ));
  // }

}
