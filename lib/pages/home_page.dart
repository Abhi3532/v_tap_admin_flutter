import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:v_tap_admin_flutter/components/common_button.dart';
import 'package:v_tap_admin_flutter/core/navigator/app_router.gr.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonButton(
                  width: 200,
                  padding: const EdgeInsets.all(15),
                  onTap: () {
                    context.router.push(UserDetailRoute(userId: "gdgdfgdgdgd"));
                  },
                  text: "go to User Detail"),
            ],
          ),
        ),
      ),
    );
  }
}
