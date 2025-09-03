import 'package:flutter/material.dart';
import 'package:kingscut/screens/calendar.dart';
import 'package:kingscut/screens/done.dart';

class SummaryPage extends StatefulWidget {
  final String email;
  final String type;
  final String date;
  final String barberName;
  final String time;
  final String cut;
  final double price;

  const SummaryPage({
    required this.email,
    required this.type,
    required this.date,
    required this.time,
    required this.barberName,
    required this.cut,
    required this.price,
    super.key,
  });

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  late TextEditingController _email;
  late TextEditingController _date;
  late TextEditingController _time;
  late TextEditingController _barberName;
  late TextEditingController _toPay;
  late TextEditingController _FirstNameController;
  late TextEditingController _LastNameController;

  String? _firstError;
  String? _lastError;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: widget.email);
    _date = TextEditingController(text: widget.date);
    _time = TextEditingController(text: widget.time);
    _barberName = TextEditingController(text: widget.barberName);
    _toPay = TextEditingController(text: 'P ${widget.price.toString()}');
    _FirstNameController = TextEditingController();
    _LastNameController = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _date.dispose();
    _time.dispose();
    _barberName.dispose();
    _toPay.dispose();
    _FirstNameController.dispose();
    _LastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                        pageBuilder: (_, __, ___) => CalendarPage(
                          email: widget.email,
                          type: widget.type,
                          barberName: widget.barberName,
                          cut: widget.cut,
                          price: widget.price,
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
              ],
            ),
            Padding(
              padding: isWide
                  ? EdgeInsets.symmetric(horizontal: screenWidth * 0.25)
                  : EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
              child: Form(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Reservation Details',
                      style: TextStyle(
                        fontFamily: 'Source Serif',
                        color: Color(0xff6a0dad),
                        fontWeight: FontWeight.bold,
                        fontSize: isWide ? 30 : 24,
                      ),
                    ),
                    SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.5),
                                  color: Colors.grey[50],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x88888888),
                                      offset: Offset(0, 5),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: _FirstNameController,
                                  style: TextStyle(fontSize: 16),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 12,
                                    ),
                                    labelText: 'First Name',
                                    floatingLabelStyle: TextStyle(
                                      color: Color(0xff6a0dad),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff6a0dad),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6a0dad),
                                      ),
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6a0dad),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6a0dad),
                                      ),
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6a0dad),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                  ),
                                ),
                              ),
                              if (_firstError != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    top: 4,
                                  ),
                                  child: Text(
                                    _firstError!,
                                    style: TextStyle(
                                      color: Color(0xffB3261E),
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              else
                                SizedBox(height: 16),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.5),
                                  color: Colors.grey[50],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x88888888),
                                      offset: Offset(0, 5),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: TextFormField(
                                  controller: _LastNameController,
                                  style: TextStyle(fontSize: 16),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 12,
                                    ),
                                    labelText: 'Last Name',
                                    floatingLabelStyle: TextStyle(
                                      color: Color(0xff6a0dad),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff6a0dad),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6a0dad),
                                      ),
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6a0dad),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6a0dad),
                                      ),
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6a0dad),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                  ),
                                ),
                              ),
                              if (_lastError != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    top: 4,
                                  ),
                                  child: Text(
                                    _lastError!,
                                    style: TextStyle(
                                      color: Color(0xffB3261E),
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              else
                                SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12.5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x88888888),
                            offset: Offset(0, 5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _email,
                        enabled: false,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff6a0dad),
                        ),
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          floatingLabelStyle: TextStyle(
                            color: Color(0xff6a0dad),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xff6a0dad),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff6a0dad)),
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(12.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x88888888),
                                  offset: Offset(0, 5),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(right: 5),
                            child: TextFormField(
                              controller: _date,
                              enabled: false,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff6a0dad),
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: Color(0xff6a0dad),
                                  ),
                                ),
                                labelText: 'Date',
                                labelStyle: TextStyle(color: Color(0xff6a0dad)),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff6a0dad),
                                  ),
                                  borderRadius: BorderRadius.circular(12.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(12.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x88888888),
                                  offset: Offset(0, 5),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(left: 5),
                            child: TextFormField(
                              controller: _time,
                              enabled: false,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff6a0dad),
                              ),
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.access_time,
                                    color: Color(0xff6a0dad),
                                  ),
                                ),
                                labelText: 'Time',
                                labelStyle: TextStyle(color: Color(0xff6a0dad)),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff6a0dad),
                                  ),
                                  borderRadius: BorderRadius.circular(12.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(12.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x88888888),
                                  offset: Offset(0, 5),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(right: 5),
                            child: TextFormField(
                              controller: _barberName,
                              enabled: false,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff6a0dad),
                              ),
                              decoration: InputDecoration(
                                labelText: 'Barber',
                                labelStyle: TextStyle(color: Color(0xff6a0dad)),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff6a0dad),
                                  ),
                                  borderRadius: BorderRadius.circular(12.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(12.5),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x88888888),
                                  offset: Offset(0, 5),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(left: 5),
                            child: TextFormField(
                              controller: _toPay,
                              enabled: false,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff6a0dad),
                              ),
                              decoration: InputDecoration(
                                labelText: 'To Pay',
                                labelStyle: TextStyle(color: Color(0xff6a0dad)),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff6a0dad),
                                  ),
                                  borderRadius: BorderRadius.circular(12.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12.5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x88888888),
                            offset: Offset(0, 5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 16),
                        minLines: 5,
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: 'Notes (optional)',
                          floatingLabelStyle: TextStyle(
                            color: Color(0xff6a0dad),
                          ),
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xff6a0dad),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff6a0dad)),
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff6a0dad),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x88888888),
                            offset: Offset(0, 5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size(200, 50),
                          backgroundColor: Color(0xff6a0dad),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Submit'),
                        onPressed: () {
                          bool isValid = true;
                          String? tempFirstError;
                          String? tempLastError;

                          if (_FirstNameController.text.isEmpty) {
                            tempFirstError = "Field can't be left blank";
                            isValid = false;
                          }
                          if (_LastNameController.text.isEmpty) {
                            tempLastError = "Field can't be left blank";
                            isValid = false;
                          }

                          setState(() {
                            _firstError = tempFirstError;
                            _lastError = tempLastError;
                          });

                          if (isValid) {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    DonePage(email: widget.email),
                                transitionDuration: Duration.zero,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
