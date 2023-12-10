import 'package:flutter/material.dart';
import 'package:flutter_application_1/getapi/example1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _homescreenState();
}

class _homescreenState extends State<loginpage> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var agecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'email'),
              controller: emailcontroller,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'password'),
              controller: passwordcontroller,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'age'),
              controller: agecontroller,
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences soso = await SharedPreferences.getInstance();
                soso.setString('email', emailcontroller.text.toString());
                soso.setString('age', agecontroller.text.toString());
                soso.setBool('islogin', true);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homescreen()));
              },
              child: Container(
                height: 50,
                width: 150,
                color: Colors.green,
                child: Text('zara touchh mee'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
