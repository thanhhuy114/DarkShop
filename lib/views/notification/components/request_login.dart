import 'package:darkshop/views/login/login_screen.dart';
import 'package:flutter/material.dart';

class RequestLogin extends StatelessWidget {
  const RequestLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Bạn cần đăng nhập để sử dụng chức năng này!",
            style: TextStyle(fontSize: 16),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Text("Đăng nhập"))
        ],
      ),
    );
  }
}
