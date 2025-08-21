abstract class UserEvent {}

class UserRegisterEvent extends UserEvent {
  String name;
  String email;
  String mobNo;
  String password;

  UserRegisterEvent({
    required this.name,
    required this.email,
    required this.mobNo,
    required this.password,
  });
}
