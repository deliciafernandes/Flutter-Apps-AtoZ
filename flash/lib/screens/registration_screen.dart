import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
//TODO 1 : Add auth import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  // Initially password is obscure
  bool _obscureText = true;

  //TODO 2 : Create a new authentication instance - keep it private to avoid other classes to have acess
  //instance is a static property of the FirebaseAuth class!
  final _auth = FirebaseAuth.instance;

  bool _showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        color: Colors.blueAccent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldInputStyleDecoration.copyWith(
                  hintText: 'Enter your email',
                  icon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Stack(
                children: <Widget>[
                  TextField(
                    obscureText: _obscureText,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kTextFieldInputStyleDecoration.copyWith(
                      hintText: 'Enter your password',
                      icon: Icon(Icons.lock),
                    ),
                  ),
                  Positioned(
                    left: 315.0,
                    child: IconButton(
                      icon: _obscureText
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      iconSize: 20.0,
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                color: Colors.blueAccent,
                text: 'Register',
                onPressed: () async {
                  setState(() {
                    _showSpinner = true;
                  });
                  //Implement registration functionality
                  //TODO 3 : createUser by tapping in the _auth property
                  //This method createUser returns a future
                  //TODO 4 : Use try catch block for safety
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    //TODO 5 : Use if else block to push use to chat screen once authenticated correctly
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      _showSpinner = false;
                    });
                    //TODO 6: Error !!
                    //flutter: PlatformException(ERROR_OPERATION_NOT_ALLOWED, The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section., null)
                    //Means enable email sign in through firebase!
                    //If our authentication was successful, the newUser details get saved in our auth object
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//validator: (val) {
//return val.length < 6 ? 'Password too short.' : null;
//},
//onSaved: (val) {
//return _password = val;
//},
//obscureText: _obscureText,
