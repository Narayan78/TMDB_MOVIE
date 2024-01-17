import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverspods/view/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {

  runApp(ProviderScope(child: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark(
        useMaterial3: true
      ),


      home: HomePage(),
    );
  }
}
