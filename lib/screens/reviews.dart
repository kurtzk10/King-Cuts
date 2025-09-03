import 'package:flutter/material.dart';
import 'package:kingscut/screens/service_page.dart';

class ReviewsPage extends StatefulWidget {
  final String? email;
  const ReviewsPage({super.key, required this.email});

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  String? get email => widget.email;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _reviewController = TextEditingController();

  String? selectedType;
  String? selectedBarber;
  String? _errorMessage;
  String? _serviceError;
  String? _barberError;

  var serviceTypes = ['Classic Haircut', 'Beard Grooming', 'Tailored Cut'];
  var barbers = ['Icent', 'Keane', 'Kian', 'Kurt'];

  @override
  Widget build(BuildContext context) {
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
        title: Padding(
          padding: const EdgeInsets.only(top: 12),
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
                        pageBuilder: (_, __, ___) => ServicePage(email: email),
                        transitionDuration: Duration.zero,
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xff6a0dad),
                    size: 32,
                  ),
                ),
                const Text(
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
            const SizedBox(height: 20),
            Padding(
              padding: isWide
                  ? EdgeInsets.symmetric(horizontal: screenWidth * 0.25)
                  : EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Write a review',
                      style: TextStyle(
                        fontFamily: 'Source Serif',
                        color: const Color(0xff6a0dad),
                        fontWeight: FontWeight.bold,
                        fontSize: isWide ? 30 : 24,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12.5),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x88888888),
                            offset: Offset(0, 5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: _reviewController,
                        minLines: 5,
                        maxLines: 5,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 12,
                          ),
                          labelText: 'Tell others about your experience',
                          floatingLabelStyle: const TextStyle(
                            color: Color(0xff6a0dad),
                          ),
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff6a0dad),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff6a0dad)),
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xff6a0dad),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xff6a0dad),
                            ),
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xff6a0dad),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                        ),
                      ),
                    ),
                    if (_errorMessage != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                            child: Text(
                              _errorMessage!,
                              style: const TextStyle(
                                color: Color(0xffB3261E),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: isWide
                          ? MainAxisAlignment.spaceEvenly
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: (isWide
                              ? screenWidth * 0.2
                              : screenWidth * 0.45),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.5),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x88888888),
                                      offset: Offset(0, 5),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: DropdownMenu<String>(
                                  width: (isWide
                                      ? screenWidth * 0.2
                                      : screenWidth * 0.45),
                                  label: const Text(
                                    "Service Type",
                                    style: TextStyle(
                                      color: Color(0xff6a0dad),
                                      fontSize: 14,
                                    ),
                                  ),
                                  textStyle: const TextStyle(fontSize: 14),
                                  inputDecorationTheme: InputDecorationTheme(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6a0dad),
                                      ),
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xff6a0dad),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                  ),
                                  dropdownMenuEntries: serviceTypes
                                      .map(
                                        (service) => DropdownMenuEntry(
                                          value: service,
                                          label: service,
                                        ),
                                      )
                                      .toList(),
                                  onSelected: (value) {
                                    setState(() {
                                      selectedType = value;
                                      _serviceError = null;
                                    });
                                  },
                                ),
                              ),
                              if (_serviceError != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    top: 4,
                                  ),
                                  child: Text(
                                    _serviceError!,
                                    style: const TextStyle(
                                      color: Color(0xffB3261E),
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              else
                                const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: (isWide
                              ? screenWidth * 0.2
                              : screenWidth * 0.45),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.5),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x88888888),
                                      offset: Offset(0, 5),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: DropdownMenu<String>(
                                  width: (isWide
                                      ? screenWidth * 0.2
                                      : screenWidth * 0.45),
                                  label: const Text(
                                    "Barber",
                                    style: TextStyle(
                                      color: Color(0xff6a0dad),
                                      fontSize: 14,
                                    ),
                                  ),
                                  textStyle: const TextStyle(fontSize: 14),
                                  inputDecorationTheme: InputDecorationTheme(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff6a0dad),
                                      ),
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xff6a0dad),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12.5),
                                    ),
                                  ),
                                  dropdownMenuEntries: barbers
                                      .map(
                                        (barber) => DropdownMenuEntry(
                                          value: barber,
                                          label: barber,
                                        ),
                                      )
                                      .toList(),
                                  onSelected: (value) {
                                    setState(() {
                                      selectedBarber = value;
                                      _barberError = null;
                                    });
                                  },
                                ),
                              ),
                              if (_barberError != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    top: 4,
                                  ),
                                  child: Text(
                                    _barberError!,
                                    style: const TextStyle(
                                      color: Color(0xffB3261E),
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              else
                                const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        boxShadow: const [
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
                          minimumSize: const Size(200, 50),
                          backgroundColor: const Color(0xff6a0dad),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Submit'),
                        onPressed: () {
                          setState(() {
                            // Reset all error messages
                            _errorMessage = null;
                            _serviceError = null;
                            _barberError = null;
                          });

                          bool isValid = true;
                          if (_reviewController.text.isEmpty) {
                            setState(() {
                              _errorMessage = "Field can't be left blank";
                            });
                            isValid = false;
                          }
                          if (selectedType == null || selectedType!.isEmpty) {
                            setState(() {
                              _serviceError = "Select a service";
                            });
                            isValid = false;
                          }
                          if (selectedBarber == null ||
                              selectedBarber!.isEmpty) {
                            setState(() {
                              _barberError = "Select a barber";
                            });
                            isValid = false;
                          }

                          if (isValid) _showDialog(context);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'What others say',
                      style: TextStyle(
                        fontFamily: 'Source Serif',
                        color: const Color(0xff6a0dad),
                        fontWeight: FontWeight.bold,
                        fontSize: isWide ? 30 : 24,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReviewCard(
                          name: 'Hero Park',
                          stars: 5,
                          content:
                              'Kian the goat fr! Always coming through with the clean cuts🤝🫡🙌🙌',
                          type: 'Tailored Cut',
                          barber: 'Kian',
                          isWide: true,
                          screenWidth: screenWidth,
                        ),
                        ReviewCard(
                          name: 'Carl Sigua',
                          stars: 5,
                          content:
                              "loved the vibes osns men. cut's one of the cleanest cuts ive gotten in a while. ❤️‍🩹",
                          type: 'Classic Cut',
                          barber: 'Icent',
                          isWide: true,
                          screenWidth: screenWidth,
                        ),
                        ReviewCard(
                          name: 'Secret Weapon Calaguas',
                          stars: 5,
                          content:
                              'king cuts clean as always !!! goated shop 🐐',
                          type: 'Beard Grooming',
                          barber: 'Keane',
                          isWide: true,
                          screenWidth: screenWidth,
                        ),
                        ReviewCard(
                          name: 'Allan Miranda',
                          stars: 4,
                          content: 'cut so fire🔥🔥🔥',
                          type: 'Tailored Cut',
                          barber: 'Kurt',
                          isWide: true,
                          screenWidth: screenWidth,
                        ),
                        ReviewCard(
                          name: 'Kai Sotto',
                          stars: 5,
                          content: 'kaiju here. i freaking love king cuts 🥰😻',
                          type: 'Tailored Cut',
                          barber: 'Kurt',
                          isWide: true,
                          screenWidth: screenWidth,
                        ),
                        const SizedBox(height: 20),
                      ],
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

class ReviewCard extends StatelessWidget {
  final String name;
  final int stars;
  final String content;
  final String type;
  final String barber;
  final bool isWide;
  final double screenWidth;

  const ReviewCard({
    super.key,
    required this.name,
    required this.stars,
    required this.content,
    required this.type,
    required this.barber,
    required this.isWide,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        boxShadow: const [
          BoxShadow(
            color: Color(0x88888888),
            offset: Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
        border: Border.all(color: const Color(0xff6a0dad), width: 1),
        borderRadius: BorderRadius.circular(12.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Source Serif',
              color: Color(0xff6a0dad),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: List.generate(5, (index) {
              if (index < stars) {
                return const Icon(
                  Icons.star,
                  color: Color(0xff6a0dad),
                  size: 16,
                );
              } else {
                return const Icon(
                  Icons.star_border,
                  color: Color(0xff6a0dad),
                  size: 16,
                );
              }
            }),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontFamily: 'Source Serif',
              color: Color(0xff6a0dad),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Barber: $barber',
                style: const TextStyle(
                  fontFamily: 'Source Serif',
                  color: Color(0xff6a0dad),
                  fontSize: 16,
                ),
              ),
              Text(
                'Service: $type',
                style: const TextStyle(
                  fontFamily: 'Source Serif',
                  color: Color(0xff6a0dad),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Submitted!',
          style: TextStyle(
            fontFamily: 'Source Serif',
            color: Color(0xff6a0dad),
          ),
        ),
        content: const Text('Your review has been submitted for review.'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
