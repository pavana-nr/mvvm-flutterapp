import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});
  final bool loading;
  final String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: loading!
            ? const CircularProgressIndicator()
            : Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
