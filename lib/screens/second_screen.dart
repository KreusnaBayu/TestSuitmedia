import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apktest/providers/palindrome_provider.dart';
import 'package:apktest/widgets/reusable_button.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan nama dari FirstScreen dan nama pengguna yang dipilih
    final palindromeProvider = Provider.of<PalindromeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ikon untuk tombol back
          onPressed: () {
            Navigator.pop(context); // Kembali ke layar sebelumnya
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 80.0), 
          child: Text(
            'Welcome',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blue, // Warna kustom untuk AppBar
        automaticallyImplyLeading: false, // Menghapus tombol back default
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label dinamis untuk nama dari FirstScreen
            Text(
              'Name: ${palindromeProvider.name}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8.0),
            // Label dinamis untuk nama pengguna yang dipilih
            Text(
              'Selected User: ${palindromeProvider.selectedUserName.isNotEmpty ? palindromeProvider.selectedUserName : 'None'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
            // Tombol "Choose a User" untuk navigasi ke ThirdScreen
            ReusableButton(
              title: 'Choose a User',
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
          ],
        ),
      ),
    );
  }
}
