import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscureText = true;
  bool isPasswordFilledTrue = true;

  String text = "";

  final TextEditingController controller = TextEditingController();

  bool validate(String password) {
    isPasswordFilledTrue = password.length >= 8;
    setState(() {});
    return isPasswordFilledTrue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(text, style: const TextStyle(
                fontSize: 35,
              ),),

              const SizedBox(height: 30,),
              TextField(

                // onChanged: (String value){
                //   text = value;
                //   setState(() {});
                //   log(value);
                // },


                // onEditingComplete: (){
                //   text = controller.text;
                //   setState(() {});
                // },

                onSubmitted: (String value){
                  text = value;
                  setState(() {});
                },



                textAlign: TextAlign.center,
                showCursor: true,
                obscuringCharacter: "-",
                textCapitalization: TextCapitalization.sentences,
                controller: controller,
                // style: const TextStyle(
                //   color: Colors.white
                // ),
                cursorColor: Colors.orange,
                // mouseCursor: MouseCursor.uncontrolled,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.send,
                onTap: () {
                  log("message");
                },
                obscureText: isObscureText,
                maxLines: 1,
                maxLength: 10,
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.zero,
                  hintText: "This is a very long hint string that would normally span three lines but it cannot.",
                  hintMaxLines: 1,
                  // hintTextDirection: TextDirection.rtl,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  // label: const Text("Password"),
                  // floatingLabelBehavior: FloatingLabelBehavior.auto,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      isObscureText = !isObscureText;
                      setState(() {});
                    },
                    splashRadius: 20,
                    icon: isObscureText
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),

                  // contentPadding: EdgeInsets.only(left: 35),
                  // fillColor: Colors.blueGrey,
                  // filled: true,
                  focusedErrorBorder: !isPasswordFilledTrue
                      ? const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                          color: Colors.green,
                          width: 2
                      )
                  ) : null,
                  errorText: !isPasswordFilledTrue ? "Xato Kiritildi" : null,
                  errorBorder: !isPasswordFilledTrue
                      ? const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      color: Colors.yellow,
                      width: 2
                    )
                        ) : null,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(Radius.circular(12)),
                  //   borderSide: BorderSide(
                  //     color: Colors.green,
                  //     width: 3
                  //   )
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //     borderRadius: BorderRadius.all(Radius.circular(12)),
                  //     borderSide: BorderSide(
                  //         color: Colors.orange,
                  //         width: 3
                  //     )
                  // ),
                  enabled: true,
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              ElevatedButton(
                onPressed: () {
                  validate(controller.text.trim());
                },
                child: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
