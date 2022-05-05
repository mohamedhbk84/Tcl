abstract class ContactFormStates {}

class ContactFormInitialState extends ContactFormStates {}

class ContactFormLoadingState extends ContactFormStates {}

class ContactFormSuccessState extends ContactFormStates {}

class ContactFormErrorState extends ContactFormStates {
  final String error;

  ContactFormErrorState(this.error);
}

//user create
class UserCreateLoadingState extends ContactFormStates {}

class UserCreateSuccessState extends ContactFormStates {}

class UserCreateErrorState extends ContactFormStates {
  final String error;

  UserCreateErrorState(this.error);
}
