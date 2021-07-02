import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/screens/sign%20in/sign_in.dart';

import 'package:aduaba_app/widgets/form_errors.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isPassHidden = true;
  bool _isConfirmPassHidden = true;
  final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirmPassword;
  String firstName;
  String lastName;

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
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 40, bottom: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create \nyour account",
                    style: TextStyle(
                      // letterSpacing: 1.5,
                      fontSize: 24,
                      color: Color(0xFF10151A),
                      fontWeight: FontWeight.w700,
                    ),
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
              SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: signUpOutlineButtonWidget(
                      img: "assets/google.png",
                      buttonText: "Sign in with Google",
                      buttonAction: () {},
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: signUpButtonWidget(
                      img: "assets/fb.png",
                      buttonText: "Register with Facebook",
                      buttonColor: Color(0xff3d5b96),
                      buttonAction: () {},
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: signUpButtonWidget(
                      img: "assets/ios.png",
                      buttonText: "Sign in with Apple ID",
                      buttonColor: Colors.black,
                      buttonAction: () {},
                    ),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: Text(
                      "- OR REGISTER WITH EMAIL -",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  formTextTitle("First Name"),
                  SizedBox(height: 10),
                  buildTextFormField(
                    pass: false,
                    text: "First Name",
                  ),
                  SizedBox(height: 20),
                  formTextTitle("Last Name"),
                  SizedBox(height: 10),
                  buildTextFormField(
                    pass: false,
                    text: "Last Name",
                  ),
                  SizedBox(height: 20),
                  formTextTitle("Email Address"),
                  SizedBox(height: 10),
                  buildTextFormField(
                      pass: false,
                      text: "Email Address",
                      validate: (value) {
                        if (value.isEmpty &&
                            !errors.contains(kEmailNullError)) {
                          setState(() {
                            errors.add(kEmailNullError);
                          });
                          return "";
                        } else if (!emailvalidatorRegExp.hasMatch(value) &&
                            !errors.contains(kInvalidEmailError)) {
                          setState(() {
                            errors.add(kInvalidEmailError);
                          });
                          return "";
                        }
                        return null;
                      },
                      onChange: (value) {
                        if (value.isNotEmpty &&
                            errors.contains(kEmailNullError)) {
                          setState(() {
                            errors.remove(kEmailNullError);
                          });
                          return "";
                        } else if (emailvalidatorRegExp.hasMatch(value) &&
                            errors.contains(kInvalidEmailError)) {
                          setState(() {
                            errors.remove(kInvalidEmailError);
                          });
                          return "";
                        }
                        return null;
                      },
                      onSave: (newValue) => email = newValue),
                  SizedBox(height: 20),
                  formTextTitle("Password"),
                  SizedBox(height: 10),
                  buildPasswordTextFormField(
                      text: "Enter Password",
                      onSave: (newValue) => password = newValue,
                      onChange: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: kEmailNullError);
                        } else if (emailvalidatorRegExp.hasMatch(value)) {
                          removeError(error: kInvalidEmailError);
                        }
                      },
                      validate: (value) {
                        if (value.isEmpty) {
                          addError(error: kEmailNullError);
                          return "";
                        } else if (!emailvalidatorRegExp.hasMatch(value)) {
                          addError(error: kInvalidEmailError);
                          return "";
                        }
                        return null;
                      },
                      togglePasswordView: () {
                        setState(() {
                          _isPassHidden = !_isPassHidden;
                        });
                      },
                      textInputType: TextInputType.visiblePassword,
                      pass: _isPassHidden),
                  SizedBox(height: 20),
                  formTextTitle("Confirm Password"),
                  SizedBox(height: 20),
                  buildPasswordTextFormField(
                      text: "Confirm Password",
                      onSave: (newValue) => password = newValue,
                      onChange: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: kEmailNullError);
                        } else if (value.isNotEmpty &&
                            password == confirmPassword) {
                          removeError(error: kMatchPassError);
                        }
                      },
                      togglePasswordView: () {
                        setState(() {
                          _isConfirmPassHidden = !_isConfirmPassHidden;
                        });
                      },
                      validate: (value) {
                        if (value.isEmpty) {
                          addError(error: kPassNullError);
                          return "";
                        }
                        return null;
                      },
                      textInputType: TextInputType.visiblePassword,
                      pass: _isConfirmPassHidden),
                  SizedBox(
                    height: 24,
                  ),
                  FormError(errors: errors),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: buttonWidget(
                        buttonText: "Create Account",
                        buttonColor: Color(0xFF3A953C),
                        buttonAction: () {
                          // if (_formKey.currentState.validate()) {
                          //   _formKey.currentState.save();
                          //   // KeyboardUtil.hideKeyboard(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(),
                        ),
                      );
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Have an account?',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff999999),
                                  letterSpacing: 1),
                            ),
                            TextSpan(
                              text: (' Sign In'),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff3A953C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
