import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socod/pages/register/sign_up/bloc/signup_event.dart';
import 'package:socod/pages/register/sign_up/bloc/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent,SignUpState>{
  SignUpBloc():super(const SignUpState()){
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);

    on<NameEvent>(_nameEvent);

    on<GenderEvent>(_genderEvent);

    on<GenderInterestEvent>(_genderInterestEvent);

    on<BioEvent>(_bioEvent);

    on<InterestEvent>(_interestEvent);

    on<PhoneEvent>(_phoneEvent);

    on<DeptEvent>(_deptEvent);

    on<YearEvent>(_yearEvent);

  }
  void _emailEvent(EmailEvent event, Emitter<SignUpState> emit){
    print("My email is ${event.email}");
    emit(state.copywith(email: event.email));

  }

  void _passwordEvent(PasswordEvent event, Emitter<SignUpState> emit){
    print("My password is ${event.password}");
    emit(state.copywith(password: event.password));

  }

  void _nameEvent(NameEvent event, Emitter<SignUpState> emit){
    print("My password is ${event.name}");
    emit(state.copywith(name: event.name));

  }

  

  void _genderEvent(GenderEvent event, Emitter<SignUpState> emit){
    print("My password is ${event.gender}");
    emit(state.copywith(gender: event.gender));

  }

  void _genderInterestEvent(GenderInterestEvent event, Emitter<SignUpState> emit){
    print("My password is ${event.gender_of_interest}");
    emit(state.copywith(gender_of_interest: event.gender_of_interest));

  }

  void _bioEvent(BioEvent event, Emitter<SignUpState> emit){
    print("My password is ${event.bio}");
    emit(state.copywith(bio: event.bio));

  }

  void _interestEvent(InterestEvent event, Emitter<SignUpState> emit){
    print("My password is ${event.interests}");
    emit(state.copywith(interest: event.interests));

  }

  void _phoneEvent(PhoneEvent event, Emitter<SignUpState> emit){
    print("My password is ${event.phone}");
    emit(state.copywith(phone: event.phone));

  }

  void _deptEvent(DeptEvent event, Emitter<SignUpState> emit){
    print("My password is ${event.dept}");
    emit(state.copywith(dept: event.dept));

  }

  void _yearEvent(YearEvent event, Emitter<SignUpState> emit){
    print("My password is ${event.year}");
    emit(state.copywith(password: event.year));

  }



}