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
  TokenManager tokenManager = new TokenManager();
  Authentication authentication = new Authentication();
  DocIdManager docIdManager = new DocIdManager();
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
              shape: Border(bottom: BorderSide(color: Colors.grey)),
              title: Text(
                'Account Settings',
                style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Logout?'),
                        content: Text('Are you sure you want to logout?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel')),
                          TextButton(
                              onPressed: () async {
                                try {
                                  await authentication.logout();
                                  await tokenManager.destroyToken();
                                  await docIdManager.destroyDocId();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()),
                                      (route) => false);
                                } catch (error) {
                                  Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Logout Failed'),
                                          content: Text(
                                              'Sorry, Something went wrong, Please try again later'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Ok'))
                                          ],
                                        );
                                      });
                                }
                              },
                              child: Text('Yes'))
                        ],
                      );
                    });
              },
              shape: Border(bottom: BorderSide(color: Colors.grey)),
              title: Text(
                'Logout',
                style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
              ),
              trailing: Icon(Icons.logout),
            )
          ],
        ),
      ),
    );
  }
}
