import 'package:flutter/material.dart';

class AreYouSureDialog extends StatelessWidget {
  const AreYouSureDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      width: 100,
      padding: const EdgeInsets.all(30),
      child: ListView(
        children: [
          const Text('Are you sure?'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('CANCEL'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('YES'))
            ],
          )
        ],
      ),
    );
  }
}
