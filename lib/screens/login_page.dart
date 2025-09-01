import 'package:flutter/material.dart';
import 'package:kingscut/screens/service_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool showAccountList = true;

  String? selectedAccountEmail;

  final List<Map<String, String>> accounts = [
    {"email": "miggymalakas@gmail.com", "name": "Miguelito Malakas"},
    {'email': 'bugoynakoy2x@gmail.com', 'name': 'Bugoy na Koykoy'},
    {'email': 'primeshanti2016@gmail.com', 'name': 'Shanti Dope'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isWide = screenWidth > 600;

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight;

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: maxHeight),
              child: IntrinsicHeight(
                child: Container(
                  child: showAccountList
                      ? _buildAccountList(isWide, screenWidth)
                      : SingleChildScrollView(
                          child: _buildLoginCard(
                            isWide,
                            screenWidth,
                            screenHeight,
                          ),
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoginCard(bool isWide, double screenWidth, double screenHeight) {
    final account = accounts.firstWhere(
      (acc) => acc["email"] == selectedAccountEmail,
    );

    final cardWidth = isWide ? screenWidth * 0.5 : screenWidth * 0.9;
    final cardHeight = isWide ? 360.0 : 320.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: isWide ? 0 : screenHeight * 0.2),
        const Text(
          'Login',
          style: TextStyle(
            fontFamily: 'Source Serif',
            fontWeight: FontWeight.bold,
            color: Color(0xFF6A0DAD),
            fontSize: 24,
          ),
        ),
        SizedBox(height: 16),
        Container(
          width: cardWidth,
          height: cardHeight,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff6a0dad), width: 1),
            borderRadius: BorderRadius.circular(12.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/user.png', width: isWide ? 90 : 70),
              SizedBox(height: 8),
              Text(
                account['name']!,
                style: TextStyle(
                  fontFamily: 'Source Serif',
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6a0dad),
                  fontSize: isWide ? 24 : 22,
                ),
              ),
              Text(
                account['email']!,
                style: TextStyle(
                  fontFamily: 'Source Serif',
                  color: Color(0xff6a0dad),
                  fontSize: isWide ? 14 : 12,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xff6a0dad),
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: 'Password',
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
                          borderSide: BorderSide(
                            color: Color(0xff6a0dad),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12.5),
                        ),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter your password' : null,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: isWide ? 220 : 200,
                      height: 50,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          side: BorderSide(color: Color(0xff6a0dad), width: 1),
                        ),
                        child: const Text('Login'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ServicePage(email: account['email']),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            overlayColor: WidgetStateColor.transparent,
          ),
          child: Text(
            'Sign in with a different account',
            style: TextStyle(
              fontFamily: 'Source Serif',
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Color(0xff6a0dad),
              fontSize: isWide ? 16 : 14,
            ),
          ),
          onPressed: () {
            setState(() {
              showAccountList = true;
            });
          },
        ),
      ],
    );
  }

  Widget _buildAccountList(bool isWide, double screenWidth) {
    final listWidth = isWide ? screenWidth * 0.5 : screenWidth * 0.9;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Choose an account',
          style: TextStyle(
            fontFamily: 'Source Serif',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xff6a0dad),
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: listWidth,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff6a0dad), width: 1),
            borderRadius: BorderRadius.circular(12.5),
          ),
          child: Column(
            children: accounts.map((acc) {
              return ConstrainedBox(
                constraints: BoxConstraints(maxWidth: listWidth),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12.5),
                  onTap: () {
                    setState(() {
                      selectedAccountEmail = acc['email'];
                      showAccountList = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/user.png'),
                          radius: isWide ? 25 : 20,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                acc["name"]!,
                                style: TextStyle(
                                  fontFamily: 'Source Serif',
                                  fontWeight: FontWeight.bold,
                                  fontSize: isWide ? 18 : 16,
                                ),
                              ),
                              Text(
                                acc["email"]!,
                                style: TextStyle(
                                  fontFamily: 'Source Serif',
                                  fontSize: isWide ? 14 : 12,
                                  color: Color(0xff6a0dad),
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xff6a0dad),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: isWide ? 100 : 50),
      ],
    );
  }
}
