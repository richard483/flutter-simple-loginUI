import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp( home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final loginFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();

  void loginMsg(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    if(passwordFieldController.text.isEmpty){
      scaffold.showSnackBar(
        SnackBar(
          content:  Text("Password is empty!"),
        ),
      );
    }else{
      scaffold.showSnackBar(
        SnackBar(
          content:  Text("Logged in with: " + loginFieldController.text),
          action: SnackBarAction(label: 'Okay', onPressed: scaffold.hideCurrentSnackBar),
        ),
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter TextField Example'),
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: loginFieldController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                      hintText: 'Input-email',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: passwordFieldController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => loginMsg(context),
                  child: const Text("Login"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold)
                  ),
                ),
              ],
            )
        )
    );
  }
}