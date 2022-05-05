import 'package:arab_project/core/network/remote/dio_helper.dart';
import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/view/Auth/Register_screen/model/profile.dart';
import 'package:arab_project/view/calender/model/calender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderCubit extends Cubit <CalenderStates> {
  CalenderCubit() :super(AppInitCalenderStates());

  static CalenderCubit get(context) => BlocProvider.of(context);
  List<Appointment> meetings = <Appointment>[];
  // List<Appointment> getAppointments() {
  //
  //   final DateTime today = DateTime.now();
  //   final DateTime startTime =
  //   DateTime(today.year, today.month, today.day, 9, 0, 0);
  //   final DateTime endTime = startTime.add(const Duration(hours: 2));
  //
  //   meetings.add(Appointment(
  //       startTime: startTime,
  //       endTime: endTime,
  //       subject: 'Meeting',
  //       notes: "إجتماع مهم",
  //       color: Colors.blue,
  //       recurrenceRule: 'FREQ=DAILY;COUNT=10',
  //       isAllDay: false));
  //
  //
  //   return meetings;
  // }


// List<  CalenderModel>  calender;
  Calender? notes ;
void getNotes({required int id}) {

  DioHelper.getData(
    url: "notes",
    qurey: {
      "user_id":id
    }
  ).then((value) {
    print(value.data['data']);

   notes =Calender.fromJson(value.data);
    // Map<String,dynamic> list = value.data;
    // calender = CalenderModel,;
   // print(calender!.data!.data![0]);
    for(int i = 0 ; i < notes!.data.length; i++){
      meetings.add(Appointment(
          startTime: DateTime.parse(notes!.data[i].startTime!),
          endTime:  DateTime.parse(notes!.data[i].endTime!),
          subject: notes!.data[i].subject!,
          notes:notes!.data[i].notes!,
          color: Colors.blue,
          // recurrenceRule: 'FREQ=DAILY;COUNT=10',
          isAllDay: false));
    }
 print("llllll");
  print(notes!.toJson());
    emit(AppGetCategorySuccessState());
  }).catchError((error) {
    print('الايرور هنا وانت بتجيب Category' + error.toString());
    emit(AppGetCategoryErrorState());
  });
}

  void postNotes({
    required int id,
    required String StartTime,
    required String EndTime,
    required String Notes,
    required String Subject,
  }) {
    emit(postNotesLoadingState());
    DioHelper.postData(url: "notes/addNotes", data: {
      'start_time': StartTime,
      'end_time': EndTime,
      'notes': Notes,
      'subject': Subject,
      'user_id':id
    }).then((value) {
      print(value.data);
      showToast(msg: 'Data Added Successfully', state: ToastStates.SUCCESS);
      getNotes(id: dummyProfile.id);
      emit(postNotesSuccessState());
    }).catchError((error) {
      emit(postNotesErrorState());
    });
  }

}
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}



abstract class CalenderStates{}
class AppInitCalenderStates extends CalenderStates{}
class AppGetCategorySuccessState extends CalenderStates{}
class AppGetCategoryErrorState extends CalenderStates{}
class postNotesLoadingState extends CalenderStates{}
class postNotesSuccessState extends CalenderStates{}
class postNotesErrorState extends CalenderStates{}