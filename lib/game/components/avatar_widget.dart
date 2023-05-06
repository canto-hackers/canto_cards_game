import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key, required this.name, required this.assetPath, required this.life, required this.damage, required this.moves});

  final String name;
  final String assetPath;
  final String life;
  final String damage;
  final String moves;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.play_circle, color: Colors.lightBlue),
                    Text(
                      moves.toString(),
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.flash_on, color: Colors.yellow),
                    Text(
                      damage.toString(),
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ],
            ),
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
            const SizedBox(width: 10),
            const Icon(Icons.favorite, color: Colors.red),
            Text(
              life.toString(),
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          name.length > 6 ? '${name.substring(0, 6)}...${name.substring(name.length - 4)}' : name,
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
