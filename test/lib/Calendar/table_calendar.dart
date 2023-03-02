import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarPage extends StatefulWidget {
  const TableCalendarPage({super.key});

  @override
  State<TableCalendarPage> createState() => _TableCalendarPageState();
}

class _TableCalendarPageState extends State<TableCalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  bool _selectedDayIsWeekend = false;

  void isWeekend({required DateTime dateTime}) {
    if (dateTime.weekday == 6 || dateTime.weekday == 7) {
      _selectedDayIsWeekend = true;
    } else {
      _selectedDayIsWeekend = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "내 일정",
          style: TextStyle(
            color: Color(0xFF191919),
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TableCalendar(
            locale: 'ko-KR',
            focusedDay: _selectedDay,
            firstDay: DateTime(2023, 1, 1),
            lastDay: DateTime(2023, 5, 31),
            onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                isWeekend(dateTime: selectedDay);
              });
              // print(focusedDay);
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            // currentDay: DateTime(2023, 3, 28),
            daysOfWeekHeight: 20,
            // ignore: prefer_const_constructors
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              leftChevronVisible: false,
              rightChevronVisible: false,
              titleTextFormatter: (date, locale) {
                return '${date.year}.${date.month}';
              },
            ),
            calendarStyle: CalendarStyle(
              defaultTextStyle: const TextStyle(),
              weekendTextStyle: const TextStyle(color: Colors.red),
              selectedTextStyle: TextStyle(
                  color: _selectedDayIsWeekend ? Colors.red : Colors.black),
              todayTextStyle: const TextStyle(
                color: Colors.white,
              ),
              todayDecoration: const BoxDecoration(
                color: Color(0xFF6120FF),
                shape: BoxShape.circle,
              ),
              selectedDecoration: const BoxDecoration(
                color: Color(0xFFDBDBDB),
                shape: BoxShape.circle,
              ),
              markerSize: 4,
              markerMargin: const EdgeInsets.only(top: 5),
              markerDecoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            eventLoader: (day) {
              if (day.day % 2 == 0) return [''];
              return [];
            },
          ),
        ),
      ),
    );
  }
}
