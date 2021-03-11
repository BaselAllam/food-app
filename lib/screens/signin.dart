import 'package:flutter/material.dart';
import 'package:food/screens/bottomnavbar/bottomnavbar.dart';




class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> emailKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

var _formKey = GlobalKey<FormState>();

bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                margin: EdgeInsets.all(15.0),
                height: 200.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage('assets/logo.jpg'),
                    fit: BoxFit.fill
                  ),
                ),
              ),
              field('Email Address', Icons.email, false, TextInputType.emailAddress, emailController, emailKey),
              field('Password', Icons.lock, secure, TextInputType.text, passwordController, passwordKey),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot Password?!',
                    style: TextStyle(color: Colors.grey, fontSize: 15.0)
                  ),
                ),
              ),
              Column(
                children: [
                  Builder(
                    builder: (BuildContext context){
                      return FlatButton(
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.black,
                        onPressed: () {
                          if(!_formKey.currentState.validate()){
                            Scaffold.of(context).showSnackBar(snack('Some Field Required!'));
                          }else{
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return BottomNavBar();}));
                          }
                        },
                      );
                    }
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Don\'t have an account? Signup',
                    style: TextStyle(color: Colors.grey, fontSize: 15.0, height: 1.5)
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
  snack(String content){
    return SnackBar(
      content: Text(content),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
    );
  }
  field(String label, IconData icon, bool secured, TextInputType type, TextEditingController controller, Key key) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: key,
        validator: (value){
          if(value.isEmpty){
            return 'this field required';
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black, width: 0.5)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black, width: 0.5)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.black, width: 0.5)
          ),
          prefixIcon: Icon(icon, color: Colors.black),
          suffixIcon: label == 'Password' ? IconButton(
            icon: Icon(Icons.remove_red_eye),
            color: Colors.grey,
            onPressed: () {
              setState((){
                secure = !secure;
              });
            },
          ) : null,
          labelText: label
        ),
        textInputAction: TextInputAction.done,
        keyboardType: type,
        obscureText: secured,
        controller: controller
      ),
    );
  }
}