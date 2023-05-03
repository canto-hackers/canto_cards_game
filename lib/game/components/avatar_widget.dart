import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key, required this.name, required this.assetPath});

  final String name;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          backgroundImage: name == 'EMPTY'
              ? const AssetImage(
                  'images/avatars/empty_avatar.png',
                )
              : AssetImage(assetPath),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
