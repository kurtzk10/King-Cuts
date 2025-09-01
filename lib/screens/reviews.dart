import 'package:flutter/material.dart';
import 'package:kingscut/screens/service_page.dart';

class ReviewsPage extends StatefulWidget {
  final String? email;
  const ReviewsPage({required this.email});

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  String? get email => widget.email;
  final _formKey = GlobalKey<FormState>();

  String? selectedType;
  String? selectedBarber;
  var serviceTypes = ['Classic Haircut', 'Beard Grooming', 'Tailored Cut'];
  var barbers = ['Icent', 'Keane', 'Kian', 'Kurt'];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;

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
            SizedBox(height: 20),
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
                        color: Color(0xff6a0dad),
                        fontWeight: FontWeight.bold,
                        fontSize: isWide ? 30 : 24,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
                      minLines: 5,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Tell others about your experience',
                        floatingLabelStyle: TextStyle(color: Color(0xff6a0dad)),
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
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff6a0dad)),
                          borderRadius: BorderRadius.circular(12.5),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff6a0dad)),
                          borderRadius: BorderRadius.circular(12.5),
                        ),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? "Field can't be left blank" : null,
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: isWide
                          ? MainAxisAlignment.spaceEvenly
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: (isWide
                              ? screenWidth * 0.2
                              : screenWidth * 0.45),
                          child: FormField<String>(
                            validator: (value) {
                              if (selectedType == null ||
                                  selectedType!.isEmpty) {
                                return 'Select a service';
                              }
                              return null;
                            },
                            builder: (FormFieldState<String> state) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropdownMenu<String>(
                                    width: (isWide
                                        ? screenWidth * 0.2
                                        : screenWidth * 0.45),
                                    label: Text(
                                      "Service Type",
                                      style: TextStyle(
                                        color: Color(0xff6a0dad),
                                        fontSize: 14,
                                      ),
                                    ),
                                    textStyle: TextStyle(fontSize: 14),
                                    inputDecorationTheme: InputDecorationTheme(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          12.5,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff6a0dad),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          12.5,
                                        ),
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
                                      });
                                      state.didChange(value);
                                    },
                                  ),
                                  if (state.hasError)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                        top: 4,
                                      ),
                                      child: Text(
                                        state.errorText!,
                                        style: TextStyle(
                                          color: Color(0xffB3261E),
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                  else
                                    const SizedBox(height: 20),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: (isWide
                              ? screenWidth * 0.2
                              : screenWidth * 0.45),
                          child: FormField<String>(
                            validator: (value) {
                              if (selectedBarber == null ||
                                  selectedBarber!.isEmpty) {
                                return 'Select a barber';
                              }
                              return null;
                            },
                            builder: (FormFieldState<String> state) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DropdownMenu<String>(
                                    width: (isWide
                                        ? screenWidth * 0.2
                                        : screenWidth * 0.45),
                                    label: Text(
                                      "Barber",
                                      style: TextStyle(
                                        color: Color(0xff6a0dad),
                                        fontSize: 14,
                                      ),
                                    ),
                                    textStyle: TextStyle(fontSize: 14),
                                    inputDecorationTheme: InputDecorationTheme(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          12.5,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff6a0dad),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          12.5,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff6a0dad),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          12.5,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff6a0dad),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          12.5,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff6a0dad),
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          12.5,
                                        ),
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
                                      });
                                      state.didChange(value);
                                    },
                                  ),
                                  if (state.hasError)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                        top: 4,
                                      ),
                                      child: Text(
                                        state.errorText!,
                                        style: TextStyle(
                                          color: Color(0xffB3261E),
                                          fontSize: 12,
                                        ),
                                      ),
                                    )
                                  else
                                    const SizedBox(height: 16),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(200, 50),
                        side: BorderSide(color: Color(0xff6a0dad), width: 1),
                      ),
                      child: const Text('Submit'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      'What others say',
                      style: TextStyle(
                        fontFamily: 'Source Serif',
                        color: Color(0xff6a0dad),
                        fontWeight: FontWeight.bold,
                        fontSize: isWide ? 30 : 24,
                      ),
                    ),
                    SizedBox(height: 20),
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
                          content:
                              'cut so fire🔥🔥🔥',
                          type: 'Tailored Cut',
                          barber: 'Kurt',
                          isWide: true,
                          screenWidth: screenWidth,
                        ),
                        ReviewCard(
                          name: 'Kai Sotto',
                          stars: 5,
                          content:
                              'kaiju here. i freaking love king cuts 🥰😻',
                          type: 'Tailored Cut',
                          barber: 'Kurt',
                          isWide: true,
                          screenWidth: screenWidth,
                        ),
                        SizedBox(height: 20),
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
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xff6a0dad), width: 1),
        borderRadius: BorderRadius.circular(12.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Source Serif',
              color: Color(0xff6a0dad),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: List.generate(5, (index) {
              if (index < stars) {
                return Icon(Icons.star, color: Color(0xff6a0dad), size: 16);
              } else {
                return Icon(
                  Icons.star_border,
                  color: Color(0xff6a0dad),
                  size: 16,
                );
              }
            }),
          ),
          SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(
              fontFamily: 'Source Serif',
              color: Color(0xff6a0dad),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Barber: $barber',
                style: TextStyle(
                  fontFamily: 'Source Serif',
                  color: Color(0xff6a0dad),
                  fontSize: 16,
                ),
              ),
              Text(
                'Service: $type',
                style: TextStyle(
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
