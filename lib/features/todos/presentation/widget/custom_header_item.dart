import 'package:flutter/material.dart';
import 'package:project4/core/constant/app_color.dart';

class CustomTodoHeader extends StatelessWidget {
  const CustomTodoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 20),
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      width: 120,


      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18)),
        color: AppColor.textFieldColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "40 tasks",
            style: TextStyle(
                color: Colors.grey.shade500, fontSize: 10),
          ),
          Text(
            "Business",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}