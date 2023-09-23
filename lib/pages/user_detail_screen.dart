import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserDetailPage extends StatefulWidget {
  final String userId;

  const UserDetailPage({super.key, @pathParam required this.userId});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
