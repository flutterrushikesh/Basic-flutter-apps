//this class for to do cards.

class UserData {
  int? taskId;
  String task;
  String description;
  String date;

  UserData({
    this.taskId,
    required this.task,
    required this.description,
    required this.date,
  });

  Map<String, String> userMap() {
    return {
      'task': task,
      'description': description,
      'date': date,
    };
  }

  @override
  String toString() {
    return '{taskId:$taskId, task:$task, description:$description, date:$date}';
  }
}

//This class for login
class SignInModel {
  String name;
  String username;
  String phone;
  String password;

  SignInModel(
      {required this.name,
      required this.username,
      required this.phone,
      required this.password});

  Map<String, String> signInMap() {
    return {
      'name': name,
      'username': username,
      'phone': phone,
      'password': password
    };
  }

  @override
  String toString() {
    return '{name:$name, username:$username, phone:$phone, password:$password}';
  }
}
