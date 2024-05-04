import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class NewView extends StatefulWidget {
  NewView({
    super.key,
    required this.title,
    required this.message,
    this.okText = 'OK',
    required this.tapOkButton,
    this.cancelText = 'Cancel',
    required this.tapCancelButton,
  });

  final String title;
  final String message;
  final String okText;
  final VoidCallback tapOkButton;
  final String cancelText;
  final VoidCallback tapCancelButton;

  @override
  State<NewView> createState() => StateChild();
}

class NewViewState extends State<NewView> with StateMother {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300), // maximum width
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(15),
          Text(widget.title)
              .textStyle(Theme.of(context).textTheme.bodyLarge!)
              .fontWeight(FontWeight.bold),
          Gap(5),
          Text(widget.message),
          Gap(20),
          Container()
              .height(1)
              .width(double.infinity)
              .backgroundColor(Colors.grey.withOpacity(0.4)),
          Container(
            height: 54, // Row height
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    child: Text(widget.cancelText)
                        .textStyle(Theme.of(context).textTheme.bodyLarge!)
                        .textColor(Colors.blue.shade700)
                        .fontWeight(FontWeight.bold)
                        .center(),
                  ).backgroundColor(Colors.transparent).gestures(onTap: () {
                    widget.tapOkButton();
                  }).padding(top: 14, bottom: 18),
                ),
                VerticalDivider(
                  thickness: 1, // 두께 증가
                  color: Colors.grey.withOpacity(0.4), // 색상 변경
                ),
                Expanded(
                  child: Container(
                    child: Text(widget.okText)
                        .textStyle(Theme.of(context).textTheme.bodyLarge!)
                        .textColor(Colors.blue.shade700)
                        .fontWeight(FontWeight.bold)
                        .center(),
                  ).backgroundColor(Colors.transparent).gestures(onTap: () {
                    widget.tapOkButton();
                  }).padding(top: 14, bottom: 18),
                ),
              ],
            ),
          ).width(double.infinity),
        ],
      ),
    );
  }
}

main() async {
  return buildApp(
      appHome: NewView(
    title: 'Title',
    message: 'This is message.',
    okText: 'OK',
    tapOkButton: () {
      print('OK');
    },
    cancelText: 'Cancel',
    tapCancelButton: () {
      print('Cancel');
    },
  ).center());
}
