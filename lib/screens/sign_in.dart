import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/screens/home_screen.dart';
import 'package:aduaba_app/screens/reset_password.dart';
import 'package:aduaba_app/widgets/form_errors.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isHidden = true;
  final emailControllerr = TextEditingController();
  final passwordController = TextEditingController();
  final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sign in \nto your account",
                    style: TextStyle(
                      letterSpacing: 1.5,
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    //  textAlign: TextAlign.center,
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xffecf5ec),
                    child: Icon(
                      Icons.person,
                      size: 27,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 330),
                      child: Text(
                        "Email Address",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isNotEmpty) {
                          addError(error: kEmailNullError);
                          return "";
                        } else if (emailvalidatorRegExp.hasMatch(value)) {
                          addError(error: kInvalidEmailError);
                          return "";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: kEmailNullError);
                        } else if (emailvalidatorRegExp.hasMatch(value)) {
                          removeError(error: kInvalidEmailError);
                        }
                        return null;
                      },
                      onSaved: (newValue) => email = newValue,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          //  borderSide: BorderSide(color: Color(0xfff7f7f7)),
                        ),
                        fillColor: Color(0xfff7f7f7),
                        filled: true,
                        hintText: 'Email Address',
                        suffixIcon: Icon(Icons.mail_outline),
                        hintStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 370),
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: _isHidden,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: kPassNullError);
                            } else if (value.length >= 8) {
                              removeError(error: kShortPassError);
                            }
                            return null;
                          },
                          validator: (value) {
                            if (value.isNotEmpty) {
                              addError(error: kPassNullError);
                              return "";
                            } else if (value.length < 8) {
                              addError(error: kShortPassError);
                              return "";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Color(0xfff7f7f7)),
                            ),
                            fillColor: Color(0xfff7f7f7),
                            filled: true,
                            hintText: 'Enter Password',
                            hintStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.grey,
                            ),
                            suffixIcon: InkWell(
                              onTap: _togglePasswordView,
                              child: Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        FormError(
                          errors: errors,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPassword(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 300),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: buttonWidget(
                          buttonText: "Login",
                          buttonColor: Color(0xFF3A953C),
                          buttonAction: () {
                            // if (_formKey.currentState.validate()) {
                            //   _formKey.currentState.save();
                            //   // KeyboardUtil.hideKeyboard(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "- OR SIGN IN WITH SOCIALS -",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: buttonWidget(
                        buttonText: "Sign in Apple ID",
                        buttonColor: Colors.black,
                        buttonAction: () {},
                      ),
                    ),

                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: buttonWidget(
                        buttonText: "Sign in with Google",
                        buttonColor: Color(
                          (0xff3d5b96),
                        ),
                        buttonAction: () {},
                      ),
                    ),
                    // Text(
                    //   "Email Address",
                    //   style: TextStyle(
                    //       fontSize: 15,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(height: 15),
                    // buildTextField('Email Address'),
                    // SizedBox(height: 25),
                    // Text(
                    //   "Password",
                    //   style: TextStyle(
                    //       fontSize: 15,
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(height: 15),
                    // buildTextField('Password'),
                    // SizedBox(height: 25),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
