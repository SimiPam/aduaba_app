import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:aduaba_app/model/user.dart';
import 'package:aduaba_app/utilities/app_url.dart';
import 'package:aduaba_app/utilities/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  Status get registeredInStatus => _registeredInStatus;

  set registeredInStatus(Status value) {
    _registeredInStatus = value;
  }

  Future<Map<String, dynamic>> register(String email, String password,
      String confirmPassword, String firstName, String lastName) async {
    final Map<String, dynamic> apiBodyData = {
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "firstName": firstName,
      "lastName": lastName
    };

    return await post(AppUrl.register, body: json.encode(apiBodyData),
            // body: register,
            headers: {'Content-Type': 'application/json'})
        .then(onRegValue)
        .catchError(onError);
  }

  notify() {
    notifyListeners();
  }

  static Future<FutureOr> onRegValue(Response response) async {
    var result;

    final Map<String, dynamic> responseData = json.decode(response.body);

    print(responseData);

    if (response.statusCode == 200) {
      var userData = responseData['data'];
      print(responseData);
      print(userData);
      // now we will create a user model
      User authUser = User.fromJson(responseData);

      // now we will create shared preferences and save data
      UserPreferences().saveUser(authUser);

      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
      result = {
        'status': false,
        'message': 'Not successfully registered',
        'data': responseData
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;
    final Map<String, dynamic> apiBodyData = {
      "email": email,
      "password": password
    };
    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response response = await post(AppUrl.login, body: json.encode(apiBodyData),
        // body: register,
        headers: {
          'Content-Type': 'application/json',
          'Charset': 'utf-8'
          // 'Authorization':
          //     'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJzaW1pMSIsImp0aSI6ImJmMmU5NjliLTAyMWUtNGU2Zi1hYmU4LTc0MWNjNzIwNjNiNCIsImVtYWlsIjoiczFAZ21haWwuY29tIiwidWlkIjoiY2ZjYjA5YzQtM2FhNy00NDdkLWEyN2YtN2Q0NjdmNWMyODI2Iiwicm9sZXMiOiJVc2VyIiwiZXhwIjoxNjI1NjU5OTM3LCJpc3MiOiJTZWN1cmVBcGkiLCJhdWQiOiJTZWN1cmVBcGlVc2VyIn0.rzr5Gwg5mcqYNF6ICnhyi2y8O2JrGFryNvHB49kzET8',
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      print(responseData);

      // var userData = responseData['data'];
      // print(userData);

      User authUser = User.fromJson(responseData);

      UserPreferences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};
      // result = {'status': true, 'message': 'Successful', 'user': response.body};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }

    return result;
  }

  // Future<Map<String, dynamic>> login(String email, String password) async {
  //   var result;
  //
  //   // final Map<String, dynamic> loginData = {
  //   //   'email': email,
  //   //   'password': password
  //   // };
  //   final Map<String, dynamic> loginData = {
  //     "email": "s1@gmail.com",
  //     "password": "SimiPam123"
  //   };
  //
  //   _loggedInStatus = Status.Authenticating;
  //   notifyListeners();
  //
  //   Response response = await post(
  //     AppUrl.login,
  //     body: json.encode(loginData),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Basic ZGlzYXBpdXNlcjpkaXMjMTIz',
  //       'X-ApiKey': 'ZGlzIzEyMw=='
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> responseData = json.decode(response.body);
  //
  //     print(responseData);
  //
  //     var userData = responseData['Content'];
  //
  //     User authUser = User.fromJson(userData);
  //
  //     UserPreferences().saveUser(authUser);
  //
  //     _loggedInStatus = Status.LoggedIn;
  //     notifyListeners();
  //
  //     result = {'status': true, 'message': 'Successful', 'user': authUser};
  //   } else {
  //     _loggedInStatus = Status.NotLoggedIn;
  //     notifyListeners();
  //     result = {
  //       'status': false,
  //       'message': json.decode(response.body)['error']
  //     };
  //   }
  //
  //   return result;
  // }

  static onError(error) {
    print('the error is $error');
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
