abstract class SignUpEvent{}

class EmailEvent extends SignUpEvent{
  final String email;
  EmailEvent(this.email);
}
class PasswordEvent extends SignUpEvent{
  final String password;
  PasswordEvent(this.password);
}

class NameEvent extends SignUpEvent{
  final String name;
  NameEvent(this.name);
}

class GenderEvent extends SignUpEvent{
  final String gender;
  GenderEvent(this.gender);
}

class GenderInterestEvent extends SignUpEvent{
  final String gender_of_interest;
  GenderInterestEvent(this.gender_of_interest);
}

class BioEvent extends SignUpEvent{
  final String bio;
  BioEvent(this.bio);
}

class InterestEvent extends SignUpEvent{
  final List<String> interests;
  InterestEvent(this.interests);
}

class PhoneEvent extends SignUpEvent{
  final String phone;
  PhoneEvent(this.phone);
}

class DeptEvent extends SignUpEvent{
  final String dept;
  DeptEvent(this.dept);
}

class YearEvent extends SignUpEvent{
  final String year;
  YearEvent(this.year);
}


class RolesEvent extends SignUpEvent{
  final List<int> roles;
  RolesEvent(this.roles);
}
