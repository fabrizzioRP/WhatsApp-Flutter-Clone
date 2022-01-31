import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_flu/services/usuarios_services.dart';

Future functionCamera(BuildContext context) async {
  final imageUser = Provider.of<User>(context, listen: false);
  final picker = ImagePicker();
  final XFile? pickedFile = await picker.pickImage(
    source: ImageSource.camera,
    imageQuality: 100,
  );

  if (pickedFile == null) return null;

  final photo = File.fromUri(Uri(path: pickedFile.path));
  imageUser.guardaPicture(photo);
  imageUser.isViewedHistory = false;
  return photo;
}
