import 'package:flutter/material.dart';

class RoundedCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double? radius;

  const RoundedCardWidget(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.price,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 33, 35, 47),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 15.0),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              // height: double.infinity,
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "$price\$",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
