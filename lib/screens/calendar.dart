import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:kingscut/screens/barber.dart';
import 'package:kingscut/screens/summary.dart';


class CalendarPage extends StatefulWidget {
  final String email;
  final String type;
  final String barberName;
  final String cut;
  final double price;

  const CalendarPage({
    required this.email,
    required this.type,
    required this.barberName,
    required this.cut,
    required this.price,
  });

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  bool _showTimeSlots = true;
  int selectedTimeIndex = 0;

  List<String> timeSlots = [
    '9:30 AM',
    '10:30 AM',
    '11:30 AM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
    '6:00 PM',
    '7:00 PM',
  ];

  late String selectedTime = timeSlots[selectedTimeIndex];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Container(
          margin: EdgeInsets.only(left: 6, top: 11),
          child: Image.asset('assets/logo_black.png', height: 20, width: 20),
        ),
        leadingWidth: 50,
        toolbarHeight: 70,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.only(top: 12),
          child: const Text(
            "King Cuts",
            style: TextStyle(
              fontFamily: 'Judson',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => BarberPage(
                          type: widget.type,
                          cut: widget.cut,
                          price: widget.price,
                          email: widget.email,
                        ),
                        transitionDuration: Duration.zero,
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xff6a0dad),
                    size: 32,
                  ),
                ),
                Text(
                  '${widget.cut} | ${widget.barberName}',
                  style: TextStyle(
                    fontFamily: 'Source Serif',
                    color: Color(0xff6a0dad),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                margin: isWide
                    ? EdgeInsets.only(top: screenHeight / 10)
                    : EdgeInsets.zero,
                child: Wrap(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.5),
                        color: Color(0xff6a0dad),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x88888888),
                            offset: Offset(0, 5),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Wrap(
                        children: [
                          Container(
                            width: isWide ? screenWidth / 3 - 60 : screenWidth,
                            margin: EdgeInsets.only(bottom: 10),
                            child: TableCalendar(
                              firstDay: DateTime(now.year, now.month, 1),
                              focusedDay: _focusedDay,
                              lastDay: DateTime(
                                now.year,
                                now.month + 2,
                                1,
                              ).subtract(const Duration(days: 1)),
                              selectedDayPredicate: (day) {
                                return isSameDay(_selectedDay, day);
                              },

                              daysOfWeekStyle: DaysOfWeekStyle(
                                weekdayStyle: TextStyle(
                                  fontFamily: 'Source Serif',
                                  color: Colors.white,
                                  fontSize: isWide ? 18 : 16,
                                ),
                                weekendStyle: TextStyle(
                                  fontFamily: 'Source Serif',
                                  color: Colors.white,
                                  fontSize: isWide ? 18 : 16,
                                ),
                              ),

                              daysOfWeekHeight: 20,

                              headerStyle: HeaderStyle(
                                formatButtonVisible: false,
                                titleTextStyle: TextStyle(
                                  fontFamily: 'Source Serif',
                                  color: Colors.white,
                                  fontSize: isWide ? 20 : 18,
                                ),
                                leftChevronIcon: Icon(
                                  Icons.chevron_left,
                                  color: Colors.white,
                                ),
                                rightChevronIcon: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
                                ),
                              ),

                              calendarStyle: CalendarStyle(
                                cellMargin: const EdgeInsets.all(2),

                                selectedDecoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),

                                todayDecoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),

                                selectedTextStyle: TextStyle(
                                  fontFamily: 'Source Serif',
                                  color: Color(0xff6a0dad),
                                  fontSize: isWide ? 18 : 16,
                                  fontWeight: FontWeight.bold,
                                ),

                                defaultTextStyle: TextStyle(
                                  fontFamily: 'Source Serif',
                                  color: Colors.white,
                                  fontSize: isWide ? 18 : 16,
                                ),
                                outsideTextStyle: TextStyle(
                                  fontFamily: 'Source Serif',
                                  color: Colors.grey,
                                  fontSize: isWide ? 18 : 16,
                                ),
                                disabledTextStyle: TextStyle(
                                  fontFamily: 'Source Serif',
                                  color: Colors.grey,
                                  fontSize: isWide ? 18 : 16,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.grey,
                                  decorationThickness: 2,
                                ),
                              ),
                              enabledDayPredicate: (day) {
                                final isPast = day.isBefore(now);
                                final isWeekend =
                                    day.weekday == DateTime.saturday ||
                                    day.weekday == DateTime.sunday;
                                return !isPast && !isWeekend;
                              },

                              onDaySelected: (selectedDay, focusedDay) {
                                setState(() {
                                  _selectedDay = selectedDay;
                                  _focusedDay = focusedDay;
                                  _showTimeSlots = true;
                                  selectedTimeIndex = 0;
                                });
                              },
                            ),
                          ),
                          if (_showTimeSlots && _selectedDay != null)
                            Container(
                              width: isWide
                                  ? screenWidth / 3 - 60
                                  : screenWidth,
                              margin: isWide
                                  ? EdgeInsets.all(20)
                                  : EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    DateFormat('EEEE d MMMM').format(_selectedDay!),
                                    style: TextStyle(
                                      fontFamily: 'Source Serif',
                                      color: Colors.white,
                                      fontSize: isWide ? 20 : 18,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: List.generate(timeSlots.length, (
                                      index,
                                    ) {
                                      final isSelected =
                                          index == selectedTimeIndex;
                                      return SizedBox(
                                        width: isWide ? 100 : 75,
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              selectedTimeIndex = index;
                                              selectedTime = timeSlots[selectedTimeIndex];
                                            });
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor: isSelected
                                                ? Colors.white
                                                : Color(0xff6a0dad),
                                            foregroundColor: isSelected
                                                ? Color(0xff6a0dad)
                                                : Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.25),
                                            ),
                                            side: BorderSide(
                                              color: isSelected
                                                  ? Colors.transparent
                                                  : Colors.white,
                                              width: 1,
                                            ),
                                          ),

                                          child: Text(
                                            timeSlots[index],
                                            style: TextStyle(
                                              fontFamily: 'Source Serif',
                                              fontSize: isWide ? 16 : 12,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(200, 50),
                padding: EdgeInsets.symmetric(horizontal: 30),
                backgroundColor: Color(0xff6a0dad),
                side: BorderSide(color: Color(0xff6a0dad), width: 1),
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => SummaryPage(
                      email: widget.email,
                      type: widget.type,
                      date: DateFormat('MM/dd/yyyy').format(_selectedDay!),
                      time: selectedTime!,
                      barberName: widget.barberName,
                      cut: widget.cut,
                      price: widget.price,
                    ),
                    transitionDuration: Duration.zero,
                  ),
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
