import 'package:flutter/material.dart';
import 'package:testgeo/utils/theme.dart';
import 'package:testgeo/view/widget/text_utils.dart';

class DarkModeWidget extends StatelessWidget {
  const DarkModeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildIconWidget(),
      ],
    );
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration:
                BoxDecoration(color: darkSettings, shape: BoxShape.circle),
            child: Icon(Icons.dark_mode),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
              text: "DarkMode",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              underLine: TextDecoration.none)
        ],
      ),
    );
  }
}
