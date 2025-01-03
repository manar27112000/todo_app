import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';
import 'package:todo_app/ui/widgets/task_item_widget.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
      TimelineCalendar(
      calendarType: CalendarType.GREGORIAN,
      calendarLanguage: "en",
      calendarOptions: CalendarOptions(
        viewType: ViewType.DAILY,
        toggleViewType: true,
        headerMonthElevation: 10,
        headerMonthShadowColor:Colors.transparent,
        headerMonthBackColor: Colors.transparent,


      ),
      dayOptions: DayOptions(
        selectedBackgroundColor: Theme.of(context).primaryColor,
          compactMode: true,
          weekDaySelectedColor: Theme.of(context).primaryColor,
          disableDaysBeforeNow: true),
      headerOptions: HeaderOptions(
        calendarIconColor: Colors.white,
          resetDateColor: Colors.white,
          navigationColor: Colors.white ,
          weekDayStringType: WeekDayStringTypes.SHORT,
          monthStringType: MonthStringTypes.FULL,
          backgroundColor: Theme.of(context).primaryColor,
          headerTextColor: Colors.white),
      onChangeDateTime: (datetime) {
        print(datetime.getDate());
      },
    ),
        Expanded(child: ListView.builder(
          itemBuilder: (context,index)=>const TaskItemWidget(),
          itemCount: 20,))
      ],
    );
  }
}
