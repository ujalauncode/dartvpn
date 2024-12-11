
import 'package:clearvpn/Homedemo.dart';
import 'package:clearvpn/Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
  getApplicationDocumentsDirectory();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(),
        );
  }
     );
}}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

 

  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
Widget build(BuildContext context){
  // return const MaterialApp(
  //   title: 'vpn demo page',
  //   home: HomeScreen(),
  // );

return Scaffold(
  appBar: AppBar(
    title: const Text('vpn '),
      backgroundColor: const Color.fromRGBO(115, 237, 190, 0.071)
,
  ),
  body: Container(
    color: const Color.fromARGB(255, 52, 51, 51),
  ),
);
}
}
