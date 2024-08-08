import 'package:apktest/utils/hexautil.dart';
import 'package:apktest/widgets/reusable_avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apktest/providers/palindrome_provider.dart';
import 'package:apktest/widgets/reusable_button.dart';
import 'package:apktest/widgets/reusable_textfield.dart';



class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexToColor('#003C43'), 
              hexToColor('#E3FEF7'), 
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ReusableCircleAvatar(
                  imagePath: 'assets/profile.png',
                  radius: 80.0, 
                  borderColor: Colors.white, 
                  borderWidth: 2.0, 
                ),
              ),
              SizedBox(height: 32.0),
              ReusableTextField(
                hintText: 'Name',
                onChanged: (value) {
                  Provider.of<PalindromeProvider>(context, listen: false)
                      .setName(value);
                },
              ),
              SizedBox(height: 16.0),
              ReusableTextField(
                hintText: 'Palindrome',
                onChanged: (value) {
                  Provider.of<PalindromeProvider>(context, listen: false)
                      .setSentence(value);
                },
              ),
              SizedBox(height: 16.0),
              ReusableButton(
                title: 'Check',
                onPressed: () {
                  final message =
                      Provider.of<PalindromeProvider>(context, listen: false)
                          .getPalindromeMessage();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text(message),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 16.0),
              ReusableButton(
                title: 'Next',
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
