import 'dart:async';

import 'package:ecomm_378/domain/constants/app_constants.dart';
import 'package:ecomm_378/domain/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString(AppConstants.PREF_KEY_USER_TOKEN) ?? "";
      String nextPage = AppRoutes.login;

      if(token.isNotEmpty){
        nextPage = AppRoutes.dashboard;
      }

      Navigator.pushReplacementNamed(context, nextPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 40,
            ),
            SizedBox(height: 11),
            Text('Ecommerce', style: TextStyle(fontSize: 34)),
          ],
        ),
      ),
    );
  }
}
