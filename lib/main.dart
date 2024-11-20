import 'package:flutter/material.dart';
import 'package:store/componants/login_page/custom_gradient.dart';
import 'package:store/componants/login_page/log_in_bottom_sheet.dart';
import 'package:store/componants/login_page/log_in_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: CustomGradient(
              begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: LogInButton(
                  text: 'Log In',
                  transparent: false,
                  onPressed: () async {
                    await logInBottomSheet(context,
                        isLogin: true,
                        imagePath: 'images/login.png',
                        buttonText: 'Log In');
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: LogInButton(
                  text: 'Sign Up',
                  transparent: true,
                  onPressed: () async {
                    await logInBottomSheet(context,
                        isLogin: false,
                        imagePath: 'images/signup.png',
                        buttonText: 'Sign Up');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
