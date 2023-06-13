import 'package:flutter/material.dart';

class OvalCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;

  const OvalCardWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/character', arguments: title);
      },
      child: Column(
        children: [
          Expanded(
            child: Card(
              clipBehavior: Clip.hardEdge,
              shape: const CircleBorder(),
              child: Stack(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        imageUrl,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                // fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
