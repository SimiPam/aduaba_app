class User {
  int userId;
  String firstname;
  String lastname;
  String email;
  String phone;
  String img;
  String type;
  String token;
  String renewalToken;

  User(
      {this.userId,
      this.firstname,
      this.lastname,
      this.email,
      this.phone,
      this.img,
      this.type,
      this.token,
      this.renewalToken});

  // now create converter

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      userId: responseData['id'],
      firstname: responseData['firstname'],
      lastname: responseData['lastname'],
      email: responseData['Email'],
      phone: responseData['phone'],
      type: responseData['type'],
      token: responseData['token'],
      renewalToken: responseData['token'],
    );
  }
}
