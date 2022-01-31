import 'dart:io';

import 'package:flutter/material.dart';

class ShowHistoryScreen extends StatelessWidget {
  const ShowHistoryScreen({Key? key, required this.userImage})
      : super(key: key);
  final List<File> userImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        actions: [
          TextButton(
            child: const Text(
              'X',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: userImage.length,
        itemBuilder: (_, i) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black87,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.file(userImage[i]),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
