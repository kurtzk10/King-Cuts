import 'package:flutter/material.dart';
import 'package:kingscut/screens/about_us.dart';
import 'package:kingscut/screens/reviews.dart';
import 'package:kingscut/screens/classic_haircut.dart';
import 'package:kingscut/screens/beard_grooming.dart';
import 'package:kingscut/screens/tailored_cut.dart';

class ServicePage extends StatelessWidget {
  final String? email;

  const ServicePage({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Container(
          margin: const EdgeInsets.only(left: 6, top: 11),
          child: Image.asset('assets/logo_black.png', height: 20, width: 20),
        ),
        leadingWidth: 50,
        toolbarHeight: 70,
        titleSpacing: 0,
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
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
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 200,
          ),
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 600;
                return Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    ServiceCard(
                      title: "Classic Haircut",
                      imagePath: "assets/classic-haircut.jpg",
                      width: isWide ? screenWidth * 0.25 : screenWidth * 0.6,
                      email: email!,
                      destination: ClassicHaircutPage(email: email),
                    ),
                    ServiceCard(
                      title: "Beard Grooming",
                      imagePath: "assets/beard-grooming.jpg",
                      width: isWide ? screenWidth * 0.25 : screenWidth * 0.6,
                      email: email!,
                      destination: BeardGroomingPage(email: email),
                    ),
                    ServiceCard(
                      title: "Tailored Cut",
                      imagePath: "assets/tailored-cut.jpg",
                      width: isWide ? screenWidth * 0.25 : screenWidth * 0.6,
                      email: email!,
                      destination: TailoredCutPage(email: email),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => AboutUsPage(email: email),
                      transitionDuration: Duration.zero,
                    ),
                  );
                },
                style: ButtonStyle(overlayColor: WidgetStateColor.transparent),
                child: const Text(
                  "About Us",
                  style: TextStyle(
                    fontFamily: 'Source Serif',
                    color: Color(0xFF6a0dad),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff6a0dad),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => ReviewsPage(email: email),
                      transitionDuration: Duration.zero,
                    ),
                  );
                },
                style: ButtonStyle(overlayColor: WidgetStateColor.transparent),
                child: const Text(
                  "Reviews",
                  style: TextStyle(
                    fontFamily: 'Source Serif',
                    color: Color(0xFF6a0dad),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff6a0dad),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final double width;
  final String email;
  final Widget destination;

  const ServiceCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.width,
    required this.email,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => destination,
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
          const SizedBox(height: 8),
          Text(
            title,
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
