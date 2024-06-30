import 'package:flutter/material.dart';
import 'package:nillq_doctor_app/screens/authentication/login.dart';
import 'package:nillq_doctor_app/services/docIdManager.dart';
import 'package:nillq_doctor_app/services/saveToken.dart';
import 'package:nillq_doctor_app/services/userAuthentication.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TokenManager tokenManager = TokenManager();
  Authentication authentication = Authentication();
  DocIdManager docIdManager = DocIdManager();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
        child: ListView(
          children: <Widget>[
            ListTile(
              onTap: () {},
              shape: const Border(bottom: BorderSide(color: Colors.grey)),
              title: Text(
                'Account Settings',
                style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
              ),
              trailing: const Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Logout?'),
                        content: const Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () async {
                                try {
                                  await authentication.logout();
                                  await tokenManager.destroyToken();
                                  await docIdManager.destroyDocId();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()),
                                      (route) => false);
                                } catch (error) {
                                  Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Logout Failed'),
                                          content: const Text(
                                              'Sorry, Something went wrong, Please try again later'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Ok'))
                                          ],
                                        );
                                      });
                                }
                              },
                              child: const Text('Yes'))
                        ],
                      );
                    });
              },
              shape: const Border(bottom: BorderSide(color: Colors.grey)),
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
              ),
              trailing: const Icon(Icons.logout),
            )
          ],
        ),
      ),
    );
  }
}
