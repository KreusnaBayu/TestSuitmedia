import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apktest/providers/user_provider.dart';
import 'package:apktest/providers/palindrome_provider.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProvider>(context, listen: false).fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
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
          padding: EdgeInsets.only(right: 60.0),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Third Screen',
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
      body: RefreshIndicator(
        onRefresh: () async {
          await userProvider.refreshUsers();
        },
        child: userProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : userProvider.users.isEmpty
                ? Center(child: Text('No users available', style: TextStyle(fontSize: 18, color: Colors.grey)))
                : ListView.builder(
                    itemCount: userProvider.users.length,
                    itemBuilder: (context, index) {
                      final user = userProvider.users[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user['avatar']),
                          ),
                          title: Text(
                            '${user['first_name']} ${user['last_name']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(user['email']),
                          onTap: () {
                            palindromeProvider.setSelectedUserName('${user['first_name']} ${user['last_name']}');
                            Navigator.pop(context); 
                          },
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
