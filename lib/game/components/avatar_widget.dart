import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String name;

  const AvatarWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
