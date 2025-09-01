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

  @override
  Widget build(BuildContext context) {
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
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
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
                            MaterialPageRoute(
                              builder: (context) => ServicePage(email: email),
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
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
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
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(i, fit: BoxFit.cover),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'King Cuts',
                            style: TextStyle(
                              fontFamily: 'Judson',
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Angeles Branch',
                          style: TextStyle(
                            fontFamily: 'Judson',
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            height: 1.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            color: Color(0xff6a0Dad),
                            size: 24,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '9:30AM-8:00PM | Mon - Fri',
                            style: TextStyle(
                              fontFamily: 'Source Serif',
                              fontSize: 18,
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
                            size: 24,
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              '2098 Razor Avenue, Ultimate Mall\nAngeles, Central Luzon 2009',
                              style: TextStyle(
                                fontFamily: 'Source Serif',
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                              fontFamily: 'Source Serif',
                              color: Color(0xff6a0dad),
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.phone_rounded,
                            color: Color(0xff6a0Dad),
                            size: 24,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '0945 526 1300',
                            style: TextStyle(
                              fontFamily: 'Source Serif',
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.mail, color: Color(0xff6a0Dad), size: 24),
                          SizedBox(width: 5),
                          Text(
                            'kingcuts@gmail.com',
                            style: TextStyle(
                              fontFamily: 'Source Serif',
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Know our Barbers',
                            style: TextStyle(
                              fontFamily: 'Source Serif',
                              color: Color(0xff6a0dad),
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Example barber buttons
                      buildInstagramRow('Icent', 'd00bleo'),
                      buildInstagramRow('Keane', 'gels_keane'),
                      buildInstagramRow('Kian', 'kiaannpp'),
                      buildInstagramRow('Kurt', 'kurtzkuwu'),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Overlay
          if (selectedImage != null)
            Container(
              color: Color(0xe6000000),
              child: Stack(
                children: [
                  Center(
                    child: InteractiveViewer(
                      child: Image.asset(selectedImage!),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 20,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white, size: 32),
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

  Widget buildInstagramRow(String name, String username) {
    return Row(
      children: [
        Icon(Icons.link, color: Color(0xff6a0Dad), size: 24),
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
              fontSize: 18,
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
