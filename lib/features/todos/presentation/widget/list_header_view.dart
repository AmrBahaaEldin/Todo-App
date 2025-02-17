import 'package:flutter/cupertino.dart';
import 'package:project4/features/todos/presentation/widget/custom_header_item.dart';

class ListHeaderView extends StatelessWidget {
  const ListHeaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) =>
          CustomTodoHeader(),
    );
  }
}