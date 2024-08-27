import 'package:flutter/material.dart';

class button extends StatelessWidget {
  const button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
          // Respond to button press
      },
      child: Text('CONTAINED BUTTON'),
    );
  }
}