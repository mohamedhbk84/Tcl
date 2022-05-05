import 'package:arab_project/shared/components/components.dart';
import 'package:arab_project/shared/styles/styles.dart';
import 'package:arab_project/view/Auth/Register_screen/model/profile.dart';
import 'package:arab_project/view/calender/cubit/CalenderCubit.dart';
import 'package:arab_project/view/layout/app_home_layout.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddNotes extends StatelessWidget {
  AddNotes({Key? key}) : super(key: key);
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();
  var NotesController = TextEditingController();
  var SubjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CalenderCubit(),
        child: BlocConsumer<CalenderCubit, CalenderStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = CalenderCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text("Add Notes"),
                  leading: IconButton(onPressed: (){
                    currentIndex =2;
                    navigateAndFinish(context,AppHomeLayout() );
                  }, icon: Icon(Icons.arrow_back)),
                  elevation: 0,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DateTimeField(
                          controller: startTimeController,
                          format: DateFormat("yyyy-MM-dd hh:mm:ss"),
                          decoration: const InputDecoration(
                            label: Text("start_time"),
                            border: OutlineInputBorder(
                              gapPadding: 5,
                              borderSide:
                                  BorderSide(color: Colors.teal, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          onShowPicker: (context, currentValue) async {
                            final date = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                            if (date != null) {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                    currentValue ?? DateTime.now()),
                              );
                              return DateTimeField.combine(date, time);
                            } else {
                              return currentValue;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DateTimeField(
                          controller: endTimeController,
                          format: DateFormat("yyyy-MM-dd hh:mm:ss"),
                          decoration: const InputDecoration(
                            label: Text("end_time"),
                            border: OutlineInputBorder(
                              gapPadding: 5,
                              borderSide:
                                  BorderSide(color: Colors.teal, width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          onShowPicker: (context, currentValue) async {
                            final date = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                            if (date != null) {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                    currentValue ?? DateTime.now()),
                              );
                              return DateTimeField.combine(date, time);
                            } else {
                              return currentValue;
                            }
                          },
                        ),
                      ),

                      ////////// add note
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: defaultFormField(
                            controller: NotesController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Notes';
                              }
                            },
                            label: 'Notes',
                            prefix: Icons.notes,
                            onTap: () {}),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: defaultFormField(
                            controller: SubjectController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Subject';
                              }
                            },
                            label: 'Subject',
                            prefix: Icons.notes,
                            onTap: () {}),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (startTimeController.text.isEmpty ||
                              endTimeController.text.isEmpty ||
                              NotesController.text.isEmpty ||
                              SubjectController.text.isEmpty) {
                            showToast(
                                msg: 'You Should Enter Data',
                                state: ToastStates.ERROR);
                          } else {

                            cubit.postNotes(StartTime: startTimeController.text,
                              EndTime: endTimeController.text,
                              Notes: NotesController.text,
                              Subject: SubjectController.text,
                                id:dummyProfile.id,

                            );
                          }
                        },
                        child: Center(
                            child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              color: Colors.indigo.shade300,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                            child: Text(
                              "Save Notes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
