import 'package:flutter/material.dart';
import 'package:kingscut/screens/calendar.dart';
import 'package:kingscut/screens/classic_haircut.dart';
import 'package:kingscut/screens/beard_grooming.dart';
import 'package:kingscut/screens/tailored_cut.dart';

class BarberPage extends StatelessWidget {
  final String type;
  final String cut;
  final double price;
  final String email;

  const BarberPage({
    required this.type,
    required this.cut,
    required this.price,
    required this.email,
  });

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
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 200,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    style: ButtonStyle(
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      Widget Function(String) destination;
                      if (type == 'Classic Haircut') {
                        destination = (email) =>
                            ClassicHaircutPage(email: email);
                      } else if (type == 'Beard Grooming') {
                        destination = (email) =>
                            BeardGroomingPage(email: email);
                      } else {
                        destination = (email) => TailoredCutPage(email: email);
                      }
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => destination(email),
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
                    '$type | $cut',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Choose your barber',
                      style: TextStyle(
                        fontFamily: 'Source Serif',
                        color: Color(0xff6a0dad),
                        fontWeight: FontWeight.bold,
                        fontSize: isWide ? 30 : 24,
                      ),
                    ),
                    SizedBox(height: 20),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          alignment: WrapAlignment.center,
                          children: [
                            BarberCard(
                              name: 'Icent',
                              imagePath: 'assets/icent.jpg',
                              width: 500,
                              email: email,
                              type: type,
                              cut: cut,
                              price: price,
                            ),
                            BarberCard(
                              name: 'Keane',
                              imagePath: 'assets/keane.jpg',
                              width: 500,
                              email: email,
                              type: type,
                              cut: cut,
                              price: price,
                            ),
                            BarberCard(
                              name: 'Kian',
                              imagePath: 'assets/kian.jpg',
                              width: 500,
                              email: email,
                              type: type,
                              cut: cut,
                              price: price,
                            ),
                            BarberCard(
                              name: 'Kurt',
                              imagePath: 'assets/kurt.jpg',
                              width: 500,
                              email: email,
                              type: type,
                              cut: cut,
                              price: price,
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BarberCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final double width;
  final String email;
  final String type;
  final String cut;
  final double price;

  const BarberCard({
    required this.name,
    required this.imagePath,
    required this.width,
    required this.email,
    required this.type,
    required this.cut,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_,__,___) =>
              CalendarPage(email: email, type: type, barberName: name, cut: cut, price: price),
              transitionDuration: Duration.zero,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.5),
              child: Image.asset(
                imagePath,
                width: width.clamp(200, 300),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Source Serif',
              color: const Color(0xff6a0dad),
              fontSize: MediaQuery.of(context).size.width > 600 ? 22 : 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
