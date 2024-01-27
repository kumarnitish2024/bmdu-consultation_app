import 'package:flutter/material.dart';
import 'package:ui_project/views/consultation/tele_consult_screen.dart';
import 'package:ui_project/views/utils/colors.dart';

class ConsultationTabs extends StatefulWidget {
  const ConsultationTabs({super.key});

  @override
  State<ConsultationTabs> createState() => _ConsultationTabsState();
}

class _ConsultationTabsState extends State<ConsultationTabs> with SingleTickerProviderStateMixin  {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar:  AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          "Consultation Timings",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        bottom: TabBar(
          indicator:  UnderlineTabIndicator(
              borderSide: BorderSide(width: 5.0,color: greenColor),
              insets: EdgeInsets.symmetric(horizontal:0)
          ),
          labelColor: greenColor,
          indicatorColor: greenColor,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Tab(
              text: "Tele Consult",
            ),
            Tab(
              text: "In-Person",
            ),
          ],
          controller: _tabController,
          indicatorWeight: 4.0,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
          children: [
        TeleConsultScreen(),
        Container(color: greenColor,)
      ]),
    ));
  }
}
