import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/screens/sign_in.dart';
import 'package:aduaba_app/widgets/form_errors.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isHidden = true;
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
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Create \nyour account",
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
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
                SizedBox(height: 30),
                Column(
                  children: [
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
                        buttonText: "Sign in Apple ID",
                        buttonColor: Colors.grey,
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
                    SizedBox(height: 10),
                    Text(
                      "- OR REGISTER WITH EMAIL -",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 300),
                      child: Text(
                        "First Name",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      onChanged: (value) {},
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color(0xfff7f7f7)),
                        ),
                        fillColor: Color(0xfff7f7f7),
                        filled: true,
                        hintText: 'First Name',
                        hintStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(right: 300),
                      child: Text(
                        "Last Name",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      onChanged: (value) {},
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color(0xfff7f7f7)),
                        ),
                        fillColor: Color(0xfff7f7f7),
                        filled: true,
                        hintText: 'Last Name',
                        hintStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(right: 280),
                      child: Text(
                        "Email Address",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      onSaved: (newValue) => email = newValue,
                      onChanged: (value) {
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
                      validator: (value) {
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
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color(0xfff7f7f7)),
                        ),
                        fillColor: Color(0xfff7f7f7),
                        filled: true,
                        hintText: 'Email Address',
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
                          padding: EdgeInsets.only(right: 300),
                          child: Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          obscureText: true,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: kEmailNullError);
                            } else if (emailvalidatorRegExp.hasMatch(value)) {
                              removeError(error: kInvalidEmailError);
                            }
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              addError(error: kEmailNullError);
                              return "";
                            } else if (!emailvalidatorRegExp.hasMatch(value)) {
                              addError(error: kInvalidEmailError);
                              return "";
                            }
                            return null;
                          },
                          onSaved: (newValue) => password = newValue,
                          keyboardType: TextInputType.visiblePassword,
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
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(right: 250),
                          child: Text(
                            "Confirm Password",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              removeError(error: kEmailNullError);
                            } else if (value.isNotEmpty &&
                                password == confirmPassword) {
                              removeError(error: kMatchPassError);
                            }
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              addError(error: kPassNullError);
                              return "";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Color(0xfff7f7f7)),
                            ),
                            fillColor: Color(0xfff7f7f7),
                            filled: true,
                            hintText: 'Confirm Password',
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
                        SizedBox(
                          height: 20,
                        ),
                        FormError(errors: errors),
                        SizedBox(
                          height: 30,
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
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignIn(),
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Have an account?',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      letterSpacing: 1),
                                ),
                                TextSpan(
                                  text: ('Sign In'),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
