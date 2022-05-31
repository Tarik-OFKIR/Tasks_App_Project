import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasks_projet_innovation_front/Themes/them.dart';
import 'package:get/get.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            height: 52,
              margin: const EdgeInsets.only(top: 8.0),
              padding: const EdgeInsets.only(left: 14),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.tertiary,
                  width: 1.0
                ),
                borderRadius: BorderRadius.circular(12)
              ),
            child: Row(
              children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget==null?false:true,
                  autofocus: false,
                  cursorColor: Colors.white,
                  controller: controller,
                  style: subTitleStyle,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: subTitleStyle,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 0
                      )
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 0
                        )
                    ),
                  ),
                )
              ),
                widget==null?Container():Container(child: widget)
              ],
            ),
          )

        ],
      )
    );
  }
}
