import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key, required this.name, required this.assetPath});

  final String name;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        name == 'EMPTY'
            ? const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/avatars/empty_avatar.png'),
              )
            : CircleAvatar(
                radius: 50,
                backgroundImage: name == 'EMPTY'
                    ? const AssetImage(
                        'images/avatars/empty_avatar.png',
                      )
                    : AssetImage(assetPath),
                child: ClipOval(
                  child: Image.asset(
                    name == 'EMPTY' ? 'images/avatars/empty_avatar.png' : assetPath,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
