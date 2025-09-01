import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kingscut/screens/service_page.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatefulWidget {
  final String? email;
  const AboutUsPage({required this.email});

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  String? get email => widget.email;

  final List<String> images = [
    'assets/carousel-pic-1.jpg',
    'assets/carousel-pic-2.jpg',
    'assets/carousel-pic-3.jpg',
    'assets/carousel-pic-4.jpg',
  ];

  String? selectedImage;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;
    final horizontalPadding = screenWidth * 0.05;

    return Scaffold(
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
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenHeight * 0.02),
                          Stack(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: isWide
                                      ? screenHeight * .5
                                      : screenHeight * 0.35,
                                  viewportFraction: 1,
                                  autoPlay: true,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration: Duration(
                                    milliseconds: 800,
                                  ),
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                ),
                                items: images.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedImage = i;
                                          });
                                        },
                                        child: Container(
                                          width: isWide ? 500 : screenWidth,
                                          child: Image.asset(
                                            i,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              Positioned(
                                bottom: screenHeight * 0.01,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: images.asMap().entries.map((entry) {
                                    return Container(
                                      width: isWide ? 8 : screenWidth * 0.02,
                                      height: isWide ? 8 : screenWidth * 0.02,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: currentIndex == entry.key
                                            ? Colors.white
                                            : Color(0x71ffffff),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Text(
                            'King Cuts',
                            style: TextStyle(
                              fontFamily: 'Judson',
                              fontSize: isWide ? 36 : 28,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                            ),
                          ),
                          Text(
                            'Angeles Branch',
                            style: TextStyle(
                              fontFamily: 'Judson',
                              fontSize: isWide ? 36 : 28,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                color: Color(0xff6a0Dad),
                                size: isWide ? 20 : screenWidth * 0.06,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '9:30AM-8:00PM | Mon - Fri',
                                style: TextStyle(
                                  fontFamily: 'Source Serif',
                                  fontSize: isWide ? 18 : 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Color(0xff6a0Dad),
                                size: isWide ? 20 : screenWidth * 0.06,
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  '2098 Razor Avenue, Ultimate Mall\nAngeles, Central Luzon 2009',
                                  style: TextStyle(
                                    fontFamily: 'Source Serif',
                                    fontSize: isWide ? 18 : 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Text(
                            'Contact Us',
                            style: TextStyle(
                              fontFamily: 'Source Serif',
                              color: Color(0xff6a0dad),
                              fontSize: isWide ? 28 : 22,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          Row(
                            children: [
                              Icon(
                                Icons.phone_rounded,
                                color: Color(0xff6a0Dad),
                                size: isWide ? 20 : screenWidth * 0.06,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '0945 526 1300',
                                style: TextStyle(
                                  fontFamily: 'Source Serif',
                                  fontSize: isWide ? 18 : 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.mail,
                                color: Color(0xff6a0Dad),
                                size: isWide ? 20 : screenWidth * 0.06,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'kingcuts@gmail.com',
                                style: TextStyle(
                                  fontFamily: 'Source Serif',
                                  fontSize: isWide ? 18 : 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Text(
                            'Know our Barbers',
                            style: TextStyle(
                              fontFamily: 'Source Serif',
                              color: Color(0xff6a0dad),
                              fontSize: isWide ? 28 : 22,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          buildInstagramRow(
                            'Icent',
                            'd00bleo',
                            screenWidth,
                            isWide,
                          ),
                          buildInstagramRow(
                            'Keane',
                            'gels_keane',
                            screenWidth,
                            isWide,
                          ),
                          buildInstagramRow(
                            'Kian',
                            'kiaannpp',
                            screenWidth,
                            isWide,
                          ),
                          buildInstagramRow(
                            'Kurt',
                            'kurtzkuwu',
                            screenWidth,
                            isWide,
                          ),
                          SizedBox(height: screenHeight * 0.03),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
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

  Widget buildInstagramRow(
    String name,
    String username,
    double screenWidth,
    bool isWide,
  ) {
    return Row(
      children: [
        Icon(
          Icons.link,
          color: Color(0xff6a0Dad),
          size: isWide ? 20 : screenWidth * 0.06,
        ),
        SizedBox(width: 8),
        TextButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            backgroundColor: WidgetStateProperty.all(Colors.transparent),
          ),
          onPressed: () async {
            final Uri insta = Uri.parse("instagram://user?username=$username");
            final Uri instaWeb = Uri.parse(
              "https://www.instagram.com/$username",
            );

            if (await canLaunchUrl(insta)) {
              await launchUrl(insta, mode: LaunchMode.externalApplication);
            } else {
              await launchUrl(instaWeb, mode: LaunchMode.externalApplication);
            }
          },
          child: Text(
            name,
            style: TextStyle(
              fontFamily: 'Source Serif',
              fontSize: isWide ? 18 : 16,
              color: Color(0xff6a0dad),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Color(0xff6a0dad),
            ),
          ),
        ),
      ],
    );
  }
}
