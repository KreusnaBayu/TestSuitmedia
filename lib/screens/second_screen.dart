import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apktest/providers/palindrome_provider.dart';
import 'package:apktest/widgets/reusable_button.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final palindromeProvider = Provider.of<PalindromeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 45.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Second Screen',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.teal[600],
        
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.teal[800],
              ),
            ),
            Text(
              palindromeProvider.name,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Colors.teal[900],
              ),
            ),
            SizedBox(height: 24.0),
            Expanded(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Selected User ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.teal[800],
                          ),
                        ),
                        Text(
                          palindromeProvider.selectedUserName.isNotEmpty
                              ? palindromeProvider.selectedUserName
                              : 'Name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.teal[800],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.0),
            ReusableButton(
              title: 'Choose a User',
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              /* color: Colors.teal,
              textColor: Colors.white, */
            ),
          ],
        ),
      ),
    );
  }
}
