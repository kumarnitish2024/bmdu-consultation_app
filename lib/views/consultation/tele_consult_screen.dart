import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_project/views/consultation/widgets/tele_consul_widgets.dart';

import '../utils/colors.dart';

class TeleConsultScreen extends StatefulWidget {
  const TeleConsultScreen({super.key});

  @override
  State<TeleConsultScreen> createState() => _TeleConsultScreenState();
}

class _TeleConsultScreenState extends State<TeleConsultScreen> {
  TextEditingController durationController = TextEditingController(text: "0");
  TextEditingController followController = TextEditingController(text: "0");
  TextEditingController feeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var dayTileView = const DaysTileView();
    var consultTimeView = const ConsultTimeView();
    var view = TeleConsultWidgets(context: context);
    return Scaffold(
        body: Stack(
      children: [
        ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            Text("Timings", style: TextStyle(fontWeight: FontWeight.w400)),
            SizedBox(height: 12),
            dayTileView,
            SizedBox(height: 12),
            Text(
              "Morning Session",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),

            SizedBox(height: 12),
            consultTimeView,

            SizedBox(height: 12),
            Text(
              "Afternoon Session",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 12),
            consultTimeView,
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Timing 2",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                ),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: mainColor,
                  child: Icon(
                    CupertinoIcons.delete,
                    size: 18,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: 12),
            dayTileView,
            SizedBox(height: 12),
            Text(
              "Morning Session",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 12),
            consultTimeView,
            SizedBox(height: 12),
            Text(
              "Afternoon Session",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 12),
            consultTimeView,
            SizedBox(height: 30),
            tittleView("Slot Duration*"),
            SizedBox(height: 3),
            view.durationFieldView(view.textField(durationController)),
            SizedBox(height: 12),
            tittleView("Follow-Up Duration"),
            SizedBox(height: 3),
            view.followUpView(view.textField(followController)),
            SizedBox(height: 12),
            tittleView("Consultation fee*"),
            SizedBox(height: 3),
            view.feeView(view.textField(feeController)),
            SizedBox(
              height: 90,
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 5,
          right: 5,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size.fromHeight(45)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Set your desired border radius for a circular button
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(greenColor),
              ),
              child: Text(
                "Save Changes",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget tittleView(String tittle) {
    return Text(
      tittle,
      style: TextStyle(color: mainColor),
    );
  }
}
