class Users {
  String? username;
  String? useremail;
  String? userpassword;

  Users({this.username, this.useremail, this.userpassword});
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'useremail': useremail,
      'userpassword': userpassword,
    };
  }
}

// local list

List<Users> userList = [];
