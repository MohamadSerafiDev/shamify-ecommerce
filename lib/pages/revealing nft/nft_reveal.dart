import 'package:flutter/material.dart';

class NftReveal extends StatelessWidget {
  NftReveal({super.key});
  int i = 4978;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Center(child: Text('haha')),
            Text('${index + i}'),
          ],
        );
      },
    ));
  }
}
