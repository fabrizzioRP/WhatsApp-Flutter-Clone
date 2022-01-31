import 'package:flutter/material.dart';
import 'package:whatsapp_flu/utils/init_camera.dart';

class CameraUserScreen extends StatelessWidget {
  const CameraUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    functionCamera(context);
    return Scaffold(
      body: Center(
        child: Image.asset('assets/thechild.png'),
      ),
    );
  }
}
