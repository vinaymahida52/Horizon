import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horizon/core/config/theme/color_palette.dart';
import 'package:horizon/core/extension/context_ext.dart';
import 'package:horizon/core/shared/constraints/common_padding.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarViewChild extends StatefulWidget {
  @override
  _CalendarViewChildState createState() => _CalendarViewChildState();
}

class _CalendarViewChildState extends State<CalendarViewChild> {
  // List of events for the calendar
  final List<CalendarEvent> _events = [
    CalendarEvent(
      subject: 'Consulting',
      from: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 6, 0, 0),
      to: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 12, 0, 0),
      color: Colors.purple,
    ),
    CalendarEvent(
      subject: 'Plan',
      from: DateTime(DateTime.now().year, DateTime.now().month, 5, 12, 0),
      to: DateTime(DateTime.now().year, DateTime.now().month, 5, 15, 0),
      color: Colors.red,
    ),
    CalendarEvent(
      subject: 'Consultingx',
      from: DateTime(DateTime.now().year, DateTime.now().month, 8, 9, 0),
      to: DateTime(DateTime.now().year, DateTime.now().month, 8, 12, 0),
      color: Colors.orange,
    ),
    CalendarEvent(
      subject: 'Project Plan',
      from: DateTime(DateTime.now().year, DateTime.now().month, 8, 12, 0),
      to: DateTime(DateTime.now().year, DateTime.now().month, 8, 15, 0),
      color: Colors.green,
    ),
    // Add more events similarly for other dates...
  ];

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CommonPadding.kCommonPadding,
      child: Column(
        spacing: 20,
        children: [
          ColorInfo(),
          SizedBox(
            height: context.h * 0.7,
            width: context.w * 0.7,
            child: Focus(
              focusNode: _focusNode,
              onKeyEvent: (FocusNode node, KeyEvent event) {
                // Specifically handle Meta key events to prevent the error
                if (event.logicalKey == LogicalKeyboardKey.metaLeft ||
                    event.logicalKey == LogicalKeyboardKey.metaRight) {
                  return KeyEventResult.handled; // Consume the event
                }
                return KeyEventResult.ignored;
              },
              child: SfCalendar(
                view: CalendarView.month,
                firstDayOfWeek: 1,

                dataSource: _getDataSource(),
                initialDisplayDate: DateTime.now(),
                initialSelectedDate: DateTime.now(),
                minDate: DateTime.now().subtract(Duration(days: 365 * 3)),
                maxDate: DateTime.now().add(Duration(days: 365)),
                // monthViewSettings: MonthViewSettings(showAgenda: true),
                // appointmentTextStyle: TextStyle(fontSize: 10), // Adjust text size
                // todayHighlightColor: Colors.transparent, // Remove today highlight
                showNavigationArrow: true, // Show navigation arrows
                headerStyle: CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                cellBorderColor: Colors.grey[300], // Border color for cells
                backgroundColor: Colors.white, // Background color
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Returns the calendar data source with the given appointments collection.
  EventDataSource _getDataSource() {
    return EventDataSource(_events);
  }
}

/// An object to set the appointment collection data source to calendar.
class EventDataSource extends CalendarDataSource {
  EventDataSource(List<CalendarEvent> source) {
    appointments = source;
  }
  @override
  DateTime getStartTime(int index) {
    return appointments![index].from!;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to!;
  }

  @override
  String getSubject(int index) {
    return appointments![index].subject!;
  }

  @override
  Color getColor(int index) {
    return appointments![index].color!;
  }
}

/// Custom event class to hold the event details
class CalendarEvent {
  CalendarEvent({
    this.subject,
    this.from,
    this.to,
    this.color,
  });

  final String? subject;
  final DateTime? from;
  final DateTime? to;
  final Color? color;
}

class ColorInfo extends StatelessWidget {
  const ColorInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        DescBox(
          title: "Project",
          color: ColorPalette.primaryColor,
        ),
        DescBox(
          title: "Task",
          color: ColorPalette.primaryPink,
        ),
      ],
    );
  }
}

class DescBox extends StatelessWidget {
  const DescBox({
    super.key,
    required this.title,
    required this.color,
  });
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Container(
          height: context.w > 600 ? 20 : 50,
          width: context.w > 600 ? 20 : 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Text(
          title,
          style: context.bodyMedium.copyWith(
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}

class _MeetingDataSource extends CalendarDataSource<_Meeting> {
  _MeetingDataSource(this.source);

  List<_Meeting> source;

  @override
  List<dynamic> get appointments => source;

  @override
  DateTime getStartTime(int index) {
    return source[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return source[index].to;
  }

  @override
  bool isAllDay(int index) {
    return source[index].isAllDay;
  }

  @override
  String getSubject(int index) {
    return source[index].eventName;
  }

  @override
  Color getColor(int index) {
    return source[index].background;
  }

  @override
  _Meeting convertAppointmentToObject(
      _Meeting eventName, Appointment appointment) {
    return _Meeting(
      appointment.subject,
      appointment.startTime,
      appointment.endTime,
      appointment.color,
      appointment.isAllDay,
    );
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in Calendar.
class _Meeting {
  _Meeting(
    this.eventName,
    this.from,
    this.to,
    this.background,
    this.isAllDay,
  );

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
