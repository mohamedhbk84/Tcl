import 'package:arab_project/view/Auth/Register_screen/model/profile.dart';
import 'package:arab_project/view/calender/cubit/CalenderCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderScreen extends StatelessWidget {
  CalenderScreen({Key? key}) : super(key: key);
  CalendarController _calendarController = CalendarController();
  Appointment? _selectedAppointment;
  String? _subjectText = '',
      _startTimeText = '',
      _endTimeText = '',
      _dateText = '',
      _timeDetails = '';
  Color? _headerColor, _viewHeaderColor, _calendarColor;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) =>
    CalenderCubit()
      ..getNotes(id: dummyProfile.id)
      ,
      child: BlocConsumer<CalenderCubit, CalenderStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CalenderCubit.get(context);
          return
            Container(
              child: SfCalendar(
                controller: _calendarController,
                view: CalendarView.week,
                // showDatePickerButton: true,
                // showWeekNumber: true,
                //   view: CalendarView.week,
                  allowedViews: [
                    CalendarView.day,
                    CalendarView.week,
                    CalendarView.workWeek,
                    CalendarView.month,
                    CalendarView.timelineDay,
                    CalendarView.timelineWeek,
                    CalendarView.timelineWorkWeek,
                  ],
                  monthViewSettings: MonthViewSettings(showAgenda: true),
                // monthViewSettings: MonthViewSettings(
                //     showAgenda: true,
                //     agendaViewHeight: 150,
                //     agendaItemHeight: 50,
                //     monthCellStyle: MonthCellStyle(
                //     ),
                //     appointmentDisplayMode: MonthAppointmentDisplayMode
                //         .appointment),
                resourceViewSettings: ResourceViewSettings(
                  visibleResourceCount: 2,
                ),
                headerStyle: const CalendarHeaderStyle(
                    textAlign: TextAlign.center,
                    backgroundColor: Color(0xFF7fcd91),
                    textStyle: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 5,
                        color: Color(0xFFff5eaea),
                        fontWeight: FontWeight.w500)),

                //      monthViewSettings: MonthViewSettings(showAgenda: true),
                onViewChanged: (ViewChangedDetails details) {
                },
                  dataSource: MeetingDataSource(cubit.meetings),
               onTap: (CalendarTapDetails details) {
                 if (details.targetElement == CalendarElement.appointment ||
                     details.targetElement == CalendarElement.agenda) {
                   final Appointment appointmentDetails = details
                       .appointments![0];
                   _subjectText = appointmentDetails.subject;
                   String? sub = appointmentDetails.notes;
                   _dateText = DateFormat('MMMM dd, yyyy')
                       .format(appointmentDetails.startTime)
                       .toString();
                   _startTimeText =
                       DateFormat('hh:mm a').format(
                           appointmentDetails.startTime).toString();
                   _endTimeText =
                       DateFormat('hh:mm a')
                           .format(appointmentDetails.endTime)
                           .toString();
                   if (appointmentDetails.isAllDay) {
                     _timeDetails = 'All day';
                   } else {
                     _timeDetails = '$_startTimeText - $_endTimeText';
                   }
                   showDialog(
                       context: context,
                       builder: (BuildContext context) {
                         return AlertDialog(
                           title: Container(child: new Text('$_subjectText')),
                           content: Container(
                             height: 80,
                             child: Column(
                               children: <Widget>[
                                 Row(
                                   children: <Widget>[
                                     Text(
                                       '$sub',
                                       style: TextStyle(
                                         fontWeight: FontWeight.w400,
                                         fontSize: 16,
                                       ),
                                     ),
                                   ],
                                 ),
                                 Row(
                                   children: <Widget>[
                                     Text(
                                       '$_dateText',
                                       style: TextStyle(
                                         fontWeight: FontWeight.w400,
                                         fontSize: 15,
                                       ),
                                     ),
                                   ],
                                 ),

                                 Row(
                                   children: <Widget>[
                                     Text(_timeDetails!,
                                         style: TextStyle(
                                             fontWeight: FontWeight.w400,
                                             fontSize: 14)),
                                   ],
                                 )
                               ],
                             ),
                           ),
                           actions: <Widget>[
                              TextButton(
                                 onPressed: () {
                                   Navigator.of(context).pop();
                                 },
                                 child: new Text('close'))
                           ],
                         );
                       });
                 }}



                )
              ,
            );
        },
      ),

    );
  }

  // void calendarTapped(CalendarTapDetails details, context) {
  //   if (details.targetElement == CalendarElement.appointment ||
  //       details.targetElement == CalendarElement.agenda) {
  //     final Appointment appointmentDetails = details.appointments![0];
  //   //  _subjectText = appointmentDetails.subject;
  //     // _dateText = DateFormat('MMMM dd, yyyy')
  //     //     .format(appointmentDetails.startTime)
  //     //     .toString();
  //     // _startTimeText =
  //     //     DateFormat('hh:mm a').format(appointmentDetails.startTime).toString();
  //     // _endTimeText =
  //     //     DateFormat('hh:mm a').format(appointmentDetails.endTime).toString();
  //     if (appointmentDetails.isAllDay) {
  //      // "_timeDetails" = 'All day';
  //     } else {
  //       // "_timeDetails" = '$"_startTimeText" - $"_endTimeText"';
  //     }
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: Container(child: new Text('"_subjectText"')),
  //             content: Container(
  //               height: 80,
  //               child: Column(
  //                 children: <Widget>[
  //                   Row(
  //                     children: <Widget>[
  //                       Text(
  //                         '$"_dateText"',
  //                         style: TextStyle(
  //                           fontWeight: FontWeight.w400,
  //                           fontSize: 20,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Row(
  //                     children: <Widget>[
  //                       Text(''),
  //                     ],
  //                   ),
  //                   Row(
  //                     children: <Widget>[
  //                       Text("_timeDetails",
  //                           style: TextStyle(
  //                               fontWeight: FontWeight.w400, fontSize: 15)),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //             actions: <Widget>[
  //               new FlatButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   child: new Text('close'))
  //             ],
  //           );
  //         });
  //   }
  Widget appointmentShowDetailsBuilder(BuildContext buildContext,
      CalendarAppointmentDetails calendarAppointmentDetails) {
    final Appointment appointment = calendarAppointmentDetails.appointments
        .first;
    return GestureDetector(
      onTap: () {
        print("Pressed");
        //navigatorKey.currentState.pushNamed('/home');
      },
      child: Container(
        color: appointment.color,
        width: calendarAppointmentDetails.bounds.width,
        height: calendarAppointmentDetails.bounds.height,
        child: Column(
          children: [
            Text(appointment.subject),
            RaisedButton(
              onPressed: () {
                print("Nakib");
              },
              child: Text("Nakib"),
            )
          ],
        ),
      ),
    );
  }

  String _getMonthDate(int month) {
    if (month == 01) {
      return 'January';
    } else if (month == 02) {
      return 'February';
    } else if (month == 03) {
      return 'March';
    } else if (month == 04) {
      return 'April';
    } else if (month == 05) {
      return 'May';
    } else if (month == 06) {
      return 'June';
    } else if (month == 07) {
      return 'July';
    } else if (month == 08) {
      return 'August';
    } else if (month == 09) {
      return 'September';
    } else if (month == 10) {
      return 'October';
    } else if (month == 11) {
      return 'November';
    } else {
      return 'December';
    }
  }


}