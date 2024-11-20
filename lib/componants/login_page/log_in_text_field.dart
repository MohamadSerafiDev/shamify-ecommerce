import 'package:flutter/material.dart';
import 'package:store/componants/login_page/log_in_button.dart';

class LogInTextField extends StatelessWidget {
  final bool ispass;
  final bool isconfirm;
  final bool isLogin;
  final bool withbutton;
  final String hintText;
  const LogInTextField(
      {super.key,
      required this.ispass,
      required this.hintText,
      required this.isLogin,
      required this.isconfirm,
      this.withbutton = false});

  @override
  Widget build(BuildContext context) {
    TextEditingController phonecontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController confirmcontroller = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            // to decide which controller i should assign to text field
            controller: ispass
                ? (isconfirm ? confirmcontroller : passwordcontroller)
                : phonecontroller,
            obscureText: ispass,
            keyboardType:
                ispass ? TextInputType.visiblePassword : TextInputType.phone,
            onSaved: (newValue) {
              // some logic
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              hintText: hintText,
              filled: true,
              fillColor: Colors.grey[300],
              suffix: Icon(ispass ? Icons.password : Icons.phone),
              counter: ispass && isLogin
                  ? TextButton(
                      onPressed: () {},
                      child: const Text(
                        "forget your passowrd?",
                        style: TextStyle(
                            color: Color.fromRGBO(5, 147, 255, 1),
                            fontSize: 14),
                      ),
                    )
                  : const Text(''),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
          ),
        ),
        withbutton
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LogInButton(
                  text: isLogin ? 'Log In' : 'Sign Up',
                  transparent: !isLogin,
                  onPressed: isLogin
                      ? () {
                          //login logic
                        }
                      : () {
                          //sign up logic
                        },
                ),
              )
            : Container(),
      ],
    );
  }
}
