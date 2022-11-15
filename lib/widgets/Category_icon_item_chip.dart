import 'package:flutter/material.dart';

class CategoryItemChip extends StatelessWidget {
  const CategoryItemChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 56,
              width: 56,
              decoration: ShapeDecoration(
                  color: Colors.red,
                  shadows: const [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 25,
                      spreadRadius: -12,
                      offset: Offset(0.0, 15),
                    )
                  ],
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
            ),
            const Icon(
              Icons.mouse,
              color: Colors.white,
              size: 32,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'همه',
          style: TextStyle(fontFamily: 'SB', fontSize: 12),
        )
      ],
    );
  }
}
