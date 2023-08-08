class SignUpState {
  final String email;
  final String password;
  final String name;
  final String gender;
  final String gender_of_interest;
  final String bio;
  final List<String> interest;
  final String phone;
  final String dept;
  final int year;
  final List<int> roles;


  const SignUpState({
    this.email="",
    this.password="",
    this.name="",
    this.gender="",
    this.gender_of_interest="",
    this.bio="",
    this.interest=const <String>[],
    this.phone="",
    this.dept="",
    this.year=0,
    this.roles=const <int>[8421],
    
    });

  SignUpState copywith({
    String? email,
    String? password,
    String? name,
    String? gender,
    String? gender_of_interest,
    String? bio,
    List<String>? interest,
    String? phone,
    String? dept,
    int? year,
    List<int>? roles,
    }){
    return SignUpState(
      email: email??this.email,
      password: password??this.password,
      name: name??this.name,
      gender: gender??this.gender,
      gender_of_interest: gender_of_interest??this.gender_of_interest,
      bio: bio??this.bio,
      interest: interest??this.interest,
      phone: phone??this.phone,
      dept: dept??this.dept,
      year: year??this.year,
      roles: roles??this.roles
    );
 }
}