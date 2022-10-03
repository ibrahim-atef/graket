abstract class AuthStates {}

class AuthInitializedStates extends AuthStates {}

class InitRegisterState extends AuthStates {}

class LoadingRegisterState extends AuthStates {}

class SuccessRegisterState extends AuthStates {}

class ErrorRegisterState extends AuthStates {}

class SuccessCreateState extends AuthStates {
  final String uId;

  SuccessCreateState(this.uId);
}

class ErrorCreateState extends AuthStates {}
class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginErrorState extends AuthStates {
  final String error;

  LoginErrorState(this.error);
}


class GetUsersLoadingState extends AuthStates {}

class GetUsersSuccessState extends AuthStates {}

class GetUsersErrorState extends AuthStates {}