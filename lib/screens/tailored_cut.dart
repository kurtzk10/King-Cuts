import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kingscut/screens/service_page.dart';
import 'package:kingscut/screens/barber.dart';

class TailoredCutPage extends StatefulWidget {
  final String? email;
  const TailoredCutPage({required this.email});

  @override
  _TailoredCutPageState createState() => _TailoredCutPageState();
}

class _TailoredCutPageState extends State<TailoredCutPage> {
  String? get email => widget.email;

  final List<List<String>> images = [
    ['consult.jpg'],
    ['assets/tailored-1.jpg',
    'assets/tailored-2.jpg',
    'assets/tailored-3.jpg',
    'assets/tailored-4.jpg',],
  ];

  final List<String> cuts = ['Consultation + Cut', 'King Custom Cuts'];
  final List<double> prices = [600, 700];

  final List<int> currentIndices = [0, 0];
  String? selectedImage;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.grey[50],
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        overlayColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) =>
                                ServicePage(email: email),
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
                      'Services',
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
                Text(
                  'Tailored Cuts',
                  style: TextStyle(
                    fontFamily: 'Source Serif',
                    color: Color(0xff6a0dad),
                    fontWeight: FontWeight.bold,
                    fontSize: isWide ? 30 : 24,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 30,
                    children: List.generate(2, (i) {
                      String cut = cuts[i];
                      double price = prices[i];
                      return Container(
                        width: isWide ? (screenWidth - 50) / 2 : screenWidth,
                        height: isWide
                            ? screenHeight * 0.5
                            : screenHeight * 0.35,
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
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: isWide
                                      ? screenHeight * 0.5
                                      : screenHeight * 0.35,
                                  viewportFraction: 1.0,
                                  enableInfiniteScroll: images[i].length > 1,
                                  scrollPhysics: images[i].length > 1
                                  ? null
                                  : NeverScrollableScrollPhysics(),
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentIndices[i] = index;
                                    });
                                  },
                                ),
                                items: images[i].map((img) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedImage = img;
                                          });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          child: Image.asset(
                                            img,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              if (images[i].length > 1)
                                Positioned(
                                  top: 10,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: images[i].asMap().entries.map((
                                      entry,
                                    ) {
                                      return Container(
                                        width: 8,
                                        height: 8,
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: currentIndices[i] == entry.key
                                              ? Colors.white
                                              : Color(0x71ffffff),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              Positioned(
                                bottom: isWide ? 10 : 2,
                                left: 10,
                                right: 10,
                                child: Wrap(
                                  alignment: WrapAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cut,
                                      style: TextStyle(
                                        fontFamily: 'Source Serif',
                                        color: Color(0xff6a0dad),
                                        fontSize: isWide ? 20 : 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                BarberPage(
                                                  type: 'Tailored Cut',
                                                  cut: cut,
                                                  price: price,
                                                  email: email!,
                                                ),
                                            transitionDuration: Duration.zero,
                                          ),
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Color(0xff6a0dad),
                                        foregroundColor: Colors.white,
                                      ),
                                      child: Text(
                                        'Get $cut | P$price',
                                        style: TextStyle(
                                          fontSize: isWide ? 16 : 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          if (selectedImage != null)
            Container(
              color: Color(0xe6000000),
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: isWide
                          ? EdgeInsets.symmetric(vertical: 50)
                          : EdgeInsets.zero,
                      child: InteractiveViewer(
                        child: Image.asset(selectedImage!, fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.05,
                    right: screenWidth * 0.05,
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: isWide ? 30 : screenWidth * 0.08,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedImage = null;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
