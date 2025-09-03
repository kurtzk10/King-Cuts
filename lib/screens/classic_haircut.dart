import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kingscut/screens/service_page.dart';
import 'package:kingscut/screens/barber.dart';

class ClassicHaircutPage extends StatefulWidget {
  final String? email;
  const ClassicHaircutPage({required this.email});

  @override
  _ClassicHaircutPageState createState() => _ClassicHaircutPageState();
}

class _ClassicHaircutPageState extends State<ClassicHaircutPage> {
  String? get email => widget.email;

  final List<List<String>> images = [
    [
      'assets/fade-1.jpg',
      'assets/fade-2.jpg',
      'assets/fade-3.jpg',
      'assets/fade-4.jpg',
    ],
    [
      'assets/buzz-1.jpg',
      'assets/buzz-2.jpg',
      'assets/buzz-3.jpg',
      'assets/buzz-4.jpg',
    ],
    [
      'assets/crew-1.jpg',
      'assets/crew-2.jpg',
      'assets/crew-3.jpg',
      'assets/crew-4.jpg',
    ],
    [
      'assets/mullet-1.jpg',
      'assets/mullet-2.jpg',
      'assets/mullet-3.jpg',
      'assets/mullet-4.jpg',
    ]

  ];

  final List<String> cuts = ['Fade', 'Buzz Cut', 'Crew Cut', 'Mullet'];
  final List<double> prices = [500, 350, 350, 600];

  final List<int> currentIndices = [0, 0, 0, 0];
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
                  'Classic Haircuts',
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
                    children: List.generate(4, (i) {
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
                                  enableInfiniteScroll: true,
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
                              Positioned(
                                top: 10,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: images.asMap().entries.map((entry) {
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
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                  type: 'Classic Haircut',
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
