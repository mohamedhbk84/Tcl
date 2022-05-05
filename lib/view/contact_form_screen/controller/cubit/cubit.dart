import 'package:arab_project/core/network/end_points.dart';
import 'package:arab_project/core/network/remote/dio_helper.dart';
import 'package:arab_project/view/contact_form_screen/controller/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ContactFormCubit extends Cubit<ContactFormStates> {
  ContactFormCubit() : super(ContactFormInitialState());

  static ContactFormCubit get(context) => BlocProvider.of(context);


  void userInquiryForm( {
    required String? field,
    required String? message,
  }){
    emit(ContactFormLoadingState());
    DioHelper.postData(url: CONTACT_FORM, data:
    {
      'field':field,
      'message':message,
    }).then((value) {
      emit(ContactFormSuccessState());
      print(value.data);

    }).catchError((error){
      emit(ContactFormErrorState(error.toString()));
      print(error.toString());

    });
  }


}
