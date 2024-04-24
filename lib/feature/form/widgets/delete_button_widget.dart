import 'package:flutter/material.dart';

class DeleteBtnWidget extends StatelessWidget {
  final Function onPressed;

  const DeleteBtnWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => Colors.red,
        ),
      ),
      onPressed: () => onPressed(),
      child: const Text(
        'DELETE',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
