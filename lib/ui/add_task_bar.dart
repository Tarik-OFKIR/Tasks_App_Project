import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tasks_projet_innovation_front/controllers/task_controller.dart';
import 'package:tasks_projet_innovation_front/Themes/them.dart';
import 'package:tasks_projet_innovation_front/ui/widgets/button.dart';
import 'package:tasks_projet_innovation_front/ui/widgets/input_field.dart';

import '../models/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController= TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime="9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList=[
    5,
    10,
    15,
    20,
  ];
  String _selectedRepeat = "None";
  List<String> repeatList=[
    "None",
    "Daily",
    "weakly",
    "Monthly"
  ];
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _appBar(context),
      body:Container(
        padding: const EdgeInsets.only(left:20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Add Task",
                style: headingStyle,
              ),
              MyInputField(title: "Title", hint: "Enter your title",controller: _titleController,),
              MyInputField(title: "Note", hint: "Enter your note",controller: _noteController,),
              MyInputField(title: "Date", hint: DateFormat.yMd().format(_selectedDate),
              widget: IconButton(
                icon:  Icon(Icons.calendar_today_outlined,
                color:Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  _getDateFromUser();
                },

              ),
              ),
              Row(
                children: [
                  Expanded(
                      child: MyInputField(
                    title: "Start Date",
                    hint: _startTime,
                        widget: IconButton(
                          onPressed: () {
                            _getTimeFromUser(isStartTime: true);
                          },
                          icon:  Icon(
                            Icons.access_time_rounded,
                            color:Theme.of(context).colorScheme.secondary,
                          ),

                        ),
                  )),
                  const SizedBox(width: 12,),
                  Expanded(
                      child: MyInputField(
                        title: "End Date",
                        hint: _endTime,
                        widget: IconButton(
                          onPressed: () {
                            _getTimeFromUser(isStartTime: false);
                          },
                          icon:  Icon(
                            Icons.access_time_rounded,
                            color:Theme.of(context).colorScheme.secondary,
                          ),

                        ),
                      )),
                ],
              ),
              MyInputField(title: "Remind", hint: "$_selectedRemind minutes early",
              widget:DropdownButton(
                icon:  Icon(Icons.keyboard_arrow_down,
                color: Theme.of(context).colorScheme.secondary,
              ),
              iconSize: 32,
              elevation: 4,
              style: subTitleStyle ,
              underline: Container(height: 0,),

              items: remindList.map<DropdownMenuItem<String>>((int value){
                return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString(), style: TextStyle(color:Theme.of(context).colorScheme.secondary)),

                );
                }
              ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRemind = int.parse(newValue!);
                  });
              },


              )


              ),
              MyInputField(title: "Repeat", hint: "$_selectedRepeat ",
                  widget:DropdownButton(
                    icon:  Icon(Icons.keyboard_arrow_down,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    iconSize: 32,
                    elevation: 4,
                    style: subTitleStyle ,
                    underline: Container(height: 0,),

                    items: repeatList.map<DropdownMenuItem<String>>((String? value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value!, style:  TextStyle(color:Theme.of(context).colorScheme.secondary)),
                      );
                    }
                    ).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRepeat = newValue!;
                      });
                    },


                  )


              ),
              const SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPallete(),
                  MyButton(label: "Create Task", onTap: ()=>_validatedData())
                ],
              )
            ],
          ),
        ),
      )
    );
  }
  _validatedData(){
    if(_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty){
      _addTaskToDb();
      Get.back();
    }else if(_titleController.text.isEmpty || _noteController.text.isEmpty){
      Get.snackbar("Required", "All fields are required!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Theme.of(context).colorScheme.secondary,
        colorText: Theme.of(context).colorScheme.primary,
        icon: const Icon(Icons.warning_amber_rounded,
          color: Colors.red
        )
      );
    }
  }

  _addTaskToDb() async {
    int value = await _taskController.addTask(
        task:TaskModel(
          note: _noteController.text,
          title: _titleController.text,
          date: DateFormat.yMd().format(_selectedDate),
          startTime: _startTime,
          endTime: _endTime,
          remind: _selectedRemind,
          repeat: _selectedRepeat,
          color: _selectedColor,
          isCompleted: 0,
        )
    );
  }

  _colorPallete(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color",
          style: titleStyle,
        ),
        const SizedBox(height: 8.0,),
        Wrap(
          children: List<Widget>.generate(
              3,
                  (int index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      _selectedColor=index;
                      print("$index");
                    });

                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: index==0?bluishClr:index==1?yellowClr:pinkClr,
                      child: _selectedColor==index? Icon(Icons .done,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 16,
                      ):Container(),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  _appBar(BuildContext context){
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.background,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child:  Icon( Icons.arrow_back_ios,
          size: 20,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),


    );
  }

  _getDateFromUser() async{
    DateTime? _pickerDate= await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2014),
        lastDate: DateTime(2122)
    );
    if(_pickerDate!=null){
      setState(() {
        _selectedDate = _pickerDate;
      });
    }else{
      print("it's null or something is wrong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async{
    var pickedTime = await _showTimePicked();
    String _formatedTime = pickedTime.format(context);
    if(pickedTime==null){
      print("Time canceled");
    }else if(isStartTime==true){
      setState(() {
        _startTime=_formatedTime;
      });
    }else if(isStartTime==false){
      setState(() {
        _endTime=_formatedTime;
      });

    }

  }

  _showTimePicked(){
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])
        )
    );
  }
}
