import 'package:darkshop/utils/colors.dart';
import 'package:flutter/material.dart';

class ButtonSort extends StatelessWidget {
  const ButtonSort(
      {super.key,
      required this.title,
      required this.seleted,
      required this.isUp,
      required this.updateSeletedIndex});
  final String title;
  final bool seleted;
  final bool? isUp;
  final Function updateSeletedIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        updateSeletedIndex();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3 - 10,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: seleted ? MyColors.backgroundButton : MyColors.backgroundApp,
          border: Border.all(),
        ),
        child: Center(
            child: isUp == null
                ? Text(
                    title,
                    style:
                        TextStyle(color: seleted ? Colors.white : Colors.black),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(),
                      Text(
                        title,
                        style: TextStyle(
                            color: seleted ? Colors.white : Colors.black),
                      ),
                      isUp!
                          ? const Icon(Icons.keyboard_double_arrow_up)
                          : const Icon(Icons.keyboard_double_arrow_down)
                    ],
                  )),
      ),
    );
  }
}
