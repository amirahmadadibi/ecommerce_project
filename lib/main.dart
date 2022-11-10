import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: PageView.builder(
                    controller: PageController(viewportFraction: 0.8),
                    itemCount: 3,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Container(
                          height: 200,
                          color: Colors.red,
                        ),
                      );
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
