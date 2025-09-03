import 'package:flutter/material.dart';
import 'package:kingscut/screens/service_page.dart';

class DonePage extends StatelessWidget {
  final String email;

  const DonePage({required this.email});

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

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: isWide
                  ? EdgeInsets.symmetric(horizontal: screenWidth / 3)
                  : EdgeInsets.symmetric(horizontal: screenWidth / 6),
              child: Text(
                textAlign: TextAlign.center,
                'A copy of your reservation details has been sent to your email!',
                style: TextStyle(
                  fontFamily: 'Source Serif',
                  color: Color(0xff6a0dad),
                  fontSize: 32,
                ),
              ),
            ),
            SizedBox(height: 50),
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
                child: const Text('Continue'),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => ServicePage(email: email),
                      transitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
