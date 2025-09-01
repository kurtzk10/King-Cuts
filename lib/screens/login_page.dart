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

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          alignment: Alignment.center,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: showAccountList ? _buildAccountList() : _buildLoginCard(),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginCard() {
    final account = accounts.firstWhere(
      (acc) => acc["email"] == selectedAccountEmail,
    );

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(
              fontFamily: 'Source Serif',
              fontWeight: FontWeight.bold,
              color: Color(0xFF6A0DAD),
              fontSize: 24,
            ),
          ),
          Container(
            height: 320,
            width: 400,
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff6a0dad), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Image.asset('assets/user.png', width: 70),
                ),
                Text(
                  account['name']!,
                  style: TextStyle(
                    fontFamily: 'Source Serif',
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6a0dad),
                    fontSize: 22,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    account['email']!,
                    style: TextStyle(
                      fontFamily: 'Source Serif',
                      color: Color(0xff6a0dad),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xff6a0dad),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 146,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: true,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0xff6a0dad),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff6a0dad)),
                              borderRadius: BorderRadius.circular(12.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff6a0dad)),
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
                          validator: (value) => value!.isEmpty
                              ? 'Please enter your password'
                              : null,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size(200, 50),
                              side: BorderSide(
                                color: Color(0xff6a0dad),
                                width: 1,
                              ),
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
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.transparent),
            ),
            child: Text(
              'Sign in with a different account',
              style: TextStyle(
                fontFamily: 'Source Serif',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Color(0xff6a0dad),
              ),
            ),
            onPressed: () => {
              setState(() {
                showAccountList = true;
              }),
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAccountList() {
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
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff6a0dad), width: 1),
            borderRadius: BorderRadius.circular(12.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...accounts.map(
                (acc) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/user.png'),
                  ),
                  title: Text(acc["email"]!),
                  subtitle: Text(acc["name"]!),
                  onTap: () {
                    setState(() {
                      selectedAccountEmail = acc['email'];
                      showAccountList = false;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
