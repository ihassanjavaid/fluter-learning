]        import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 // This widget is the root of your application.
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     theme: ThemeData(
       // This is the theme of your application.
       //
       // Try running your application with "flutter run". You'll see the
       // application has a blue toolbar. Then, without quitting the app, try
       // changing the primarySwatch below to Colors.green and then invoke
       // "hot reload" (press "r" in the console where you ran "flutter run",
       // or simply save your changes to "hot reload" in a Flutter IDE).
       // Notice that the counter didn't reset back to zero; the application
       // is not restarted.
       primarySwatch: Colors.blue,
     ),
     home: MyHomePage(title: 'Forms'),
   );
 }
}

class MyHomePage extends StatefulWidget {
 MyHomePage({Key key, this.title}) : super(key: key);

 final String title;

 @override
 _MyHomePageState createState() => _MyHomePageState();
}

// global key
// email, password
// form
// TEXT FORM FIELD
// SUBMIT

class _MyHomePageState extends State<MyHomePage> {

  final formkey = GlobalKey<FormState>();
  String _email, _pass;

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(widget.title),
     ), // Appbar
     body: Card(
        child: Padding(
          padding: EdgeInsets.all(7.5),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisSize = MainAxisSize.min;
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email'
                  ), // Input Decoration
                  validator: (input) => !input.contains('@' ) ? "Invalid Email" : null,
                  onSaved: (input) => _email = input,
                ), // TextFormField
                 TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password'
                  ), // Input Decoration
                  validator: (input) => input.length < 4 ? "Password should contain 4 letters" : null,
                  onSaved: (input) => _pass = input,
                  obscureText: true,
                ), // TextFormField
                Row(
                  mainAxisAlignment: mainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(7.5),
                      child: RaisedButton(
                        child: Text("Log in"),
                        onPressed: () => _submit
                      ), // Raised Button
                    ), //Padding
                  ], //Widget
                ), // Row
              ], // Widget[]
            ), // Column
          ), // Form
        ), // Padding
     ) // Card
   ); //Scaffold
 }

void _submit() {

  if (formkey.currentState.validate() ){
    formkey.currentState.save();
  }

}

}


