import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_project/views/utils/colors.dart';

class TeleConsultWidgets {
  BuildContext context;

  TeleConsultWidgets({required this.context});

  Widget durationFieldView(Widget child) {
    return Container(
      decoration: _containerBorder(),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: child,
          )),
          _dividerView(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text("mins"),
          )
        ],
      ),
    );
  }

  Widget followUpView(Widget child) {
    return Container(
      decoration: _containerBorder(),
      child: Row(
        children: [
          Flexible(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: child,
          )),
          _dividerView(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text("days"),
          )
        ],
      ),
    );
  }

  Widget feeView(Widget child) {
    return Container(
      decoration: _containerBorder(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('\u{20B9}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          _dividerView(),
          Flexible(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: child,
          )),
        ],
      ),
    );
  }

  Widget textField(TextEditingController controller) => TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        cursorColor: mainColor,
        decoration: const InputDecoration(
          border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10)),
      );

  Widget _dividerView() {
    return SizedBox(
      width: 5,
      height: 48,
      child: VerticalDivider(
        color: Colors.black,
        width: 2,
      ),
    );
  }

  _containerBorder() {
    return BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(4),
    );
  }
}

class DaysTileView extends StatefulWidget {
  const DaysTileView({super.key});

  @override
  State<DaysTileView> createState() => _DaysTileViewState();
}

class _DaysTileViewState extends State<DaysTileView> {
  List<int> selectDays = <int>[];
  List<String> allDays = ["M", "T", "W", "T", "F", "S", "S"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: allDays.asMap().entries.map((entry) {
        int index = entry.key;
        String day = entry.value;
        bool isSelected = selectDays.contains(index);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectDays.remove(index);
              } else {
                selectDays.add(index);
              }
            });
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: mainColor),
              color: isSelected ? mainColor : Colors.grey.shade200,
            ),
            child: Center(
              child: Text(
                day,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class ConsultTimeView extends StatefulWidget {
  const ConsultTimeView({super.key});

  @override
  State<ConsultTimeView> createState() => _ConsultTimeViewState();
}

class _ConsultTimeViewState extends State<ConsultTimeView> {
  TextEditingController morningStartController = TextEditingController();
  TextEditingController morningEndController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              controller: morningStartController,
              readOnly: true,
              onTap: () => _selectTime(context, morningStartController),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(width: .5)),
                hintText: "Start",
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: SizedBox(
            height: 40,
            width: 110,
            child: TextField(
              controller: morningEndController,
              readOnly: true,
              onTap: () => _selectTime(context, morningEndController),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "End",
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        CircleAvatar(
          radius: 18,
          backgroundColor: mainColor.withOpacity(.3),
          child: Icon(
            CupertinoIcons.delete,
            size: 18,
            color: mainColor,
          ),
        ),
      ],
    );
  }

  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != controller.text) {
      controller.text = picked.format(context);
    }
  }
}
