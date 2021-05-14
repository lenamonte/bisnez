part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterStart extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterSuccessState extends RegisterState {
  final ModelUser user;

  RegisterSuccessState({this.user});

  @override
  List<Object> get props => [user];
}

class RegisterFailureState extends RegisterState {
  final String errorMessage;

  RegisterFailureState({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
} 
