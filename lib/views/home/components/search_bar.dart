import 'package:darkshop/utils/screen_size.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomSearchBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromARGB(255, 240, 168, 67),
                        width: 2.5)),
                width: screenWidth * 0.8,
                height: screenHeight * 0.046,
                child: Row(children: [
                  const SizedBox(width: 10),
                  Expanded(
                      child: Text(
                    'Laptop ThinkPad',
                    style: TextStyle(
                        color: Colors.orange, fontSize: screenWidth * 0.037),
                  )),
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 50,
                    height: screenHeight * 0.03,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 231, 190, 163),
                              Color.fromARGB(255, 234, 63, 24)
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft)),
                    child: Center(
                        child: Text('Tìm',
                            style: TextStyle(fontSize: screenWidth * 0.033, color: const Color.fromARGB(255, 235, 229, 229)))),
                  )
                ]),
              )
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer);
  }
}
