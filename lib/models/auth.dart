class Auth {
  String msg;
  bool status;
  Auth({required this.msg, required this.status});
  factory Auth.Fromjson(Map<String, dynamic> json) {
    return Auth(msg: json["message"], status: json["status"]);
  }
}
