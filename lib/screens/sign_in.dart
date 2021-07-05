import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/screens/home_screen.dart';
import 'package:aduaba_app/screens/reset_password.dart';
import 'package:aduaba_app/screens/sign_up.dart';
import 'package:aduaba_app/widgets/custom_page_route.dart';
import 'package:aduaba_app/widgets/form_errors.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isPassHidden = true;
  final emailControllerr = TextEditingController();
  final passwordController = TextEditingController();
  final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;

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
                    "Sign in \nto your account",
                    style: TextStyle(
                      // letterSpacing: 1.5,
                      fontSize: 24,
                      color: Color(0xFF10151A),
                      fontWeight: FontWeight.w700,
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
                height: 48,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  formTextTitle("Email Address"),
                  SizedBox(height: 20),
                  buildTextFormField(
                    pass: false,
                    validate: (value) {
                      if (value.isNotEmpty) {
                        addError(error: kEmailNullError);
                        return "";
                      } else if (emailvalidatorRegExp.hasMatch(value)) {
                        addError(error: kInvalidEmailError);
                        return "";
                      }
                      return null;
                    },
                    onChange: (value) {
                      if (value.isNotEmpty) {
                        removeError(error: kEmailNullError);
                      } else if (emailvalidatorRegExp.hasMatch(value)) {
                        removeError(error: kInvalidEmailError);
                      }
                      return null;
                    },
                    onSave: (newValue) => email = newValue,
                  ),

                  SizedBox(height: 20),

                  formTextTitle("Password"),
                  SizedBox(height: 20),
                  buildPasswordTextFormField(
                      onChange: (value) {
                        if (value.isNotEmpty) {
                          removeError(error: kPassNullError);
                        } else if (value.length >= 8) {
                          removeError(error: kShortPassError);
                        }
                        return null;
                      },
                      validate: (value) {
                        if (value.isNotEmpty) {
                          addError(error: kPassNullError);
                          return "";
                        } else if (value.length < 8) {
                          addError(error: kShortPassError);
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

                  FormError(
                    errors: errors,
                  ),

                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CustomPageRoute(
                            child: ResetPassword(),
                            direction: AxisDirection.up,
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF819272),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
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
                            CustomPageRoute(
                              child: MyHomePage(),
                              direction: AxisDirection.up,
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "- OR SIGN IN WITH SOCIALS -",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: signUpButtonWidget(
                      img: "assets/ios.png",
                      buttonText: "Sign in with Apple ID",
                      buttonColor: Colors.black,
                      buttonAction: () {},
                    ),
                  ),
                  SizedBox(height: 16),
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
                  SizedBox(height: 24),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CustomPageRoute(
                          child: SignUp(),
                          direction: AxisDirection.right,
                        ),
                      );
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Don\'t have an account?',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff999999),
                                  letterSpacing: 1),
                            ),
                            TextSpan(
                              text: (' Sign Up'),
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
            ],
          ),
        ),
      ),
    );
  }
}
