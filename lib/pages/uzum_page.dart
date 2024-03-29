import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/product_list.dart';
import '../models/product_model.dart';

class UzumPage extends StatefulWidget {
  const UzumPage({super.key});

  @override
  State<UzumPage> createState() => _UzumPageState();
}

class _UzumPageState extends State<UzumPage> {

  bool isCamera = false;
  bool isFileSelected = false;
  String? path;

  Future<void> getImage()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isFileSelected = false;
    final picker = ImagePicker();
    XFile? xFile = await picker.pickImage(source: isCamera ?ImageSource.camera : ImageSource.gallery);
    if(xFile != null) {
      await prefs.setString("image", xFile.path);
      path = await read();
      if(path != null){
        isFileSelected = true;
        setState(() {});
      }
    }
  }
  Future<String?> read()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("image");
  }
  @override
  void didChangeDependencies() async{
    path = await read();
    if(path != null){
      isFileSelected = true;
      setState(() {});
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onLongPress: ()async{
            await getImage();
            setState(() {});
          },
          child: CircleAvatar(
            radius: 60,
            backgroundImage: isFileSelected ?Image.file(File(path!)).image :Image.asset("assets/images/img.png").image,
          ),
        ),
      ),
    );
  }
}