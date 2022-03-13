import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:core';
import 'dart:convert';

/**JESSICA: The key for the league name form needs to be 'id' :) */
void main() => runApp(JoinLeagueApp());

class JoinLeagueApp extends StatelessWidget {
  JoinLeagueApp(); //I had to make it not const so I could create these functions

  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> sendData(formData) async {
    final header = {
      'Api-Version': 'v2',
      'Ocp-Apim-Subscription-Key':
          'c7d04b42632847e4bd1a633c4e54a75d', //I think this is the same???
    };
    final response = await http.post(
        Uri.parse('https://csc494apimgmt.azure-api.net/league'),
        headers: header,
        body: json.encode(formData));
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const JoinLeagueScreen(),
        '/joinleague': (context) => const JoinLeagueScreen(),
      },
      /*home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
        ),
      ),*/
    );
  }
}

class JoinLeagueScreen extends StatelessWidget {
  const JoinLeagueScreen();

  final String leaguename =
      ""; // change this once we figure out how to get league name from the database

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(01, 19, 36, 20),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('Join a League!')),
      body: new Column(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 20),
                    child: Center(
                      child: Text(
                        'Moolah Master',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(239, 41, 23, 1),
                          fontFamily: 'Bebas Neue',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0, bottom: 60),
                    child: Image.asset(
                      'assets/MoolahMasterLogo2.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 350,
                      child: FormBuilderTextField(
                        name: 'joinedleague',
                        cursorColor: Colors.white,
                        style: TextStyle(
                            color: Color.fromRGBO(239, 41, 23, 1),
                            fontSize: 20),
                        decoration: InputDecoration(
                          labelText: 'ENTER A TEAM NAME:',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.0)),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
              ),
              Center(
                child: TextButton(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontFamily: 'Bebas Neue',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Color.fromRGBO(239, 41, 23, 1),
                    padding: EdgeInsets.only(
                        top: 20, bottom: 10, right: 35, left: 35),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sixth');
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class JoinSpecificLeague extends StatelessWidget {
  const JoinSpecificLeague();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Join a League"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Text(
          'Join a Moolah Master League',
        ),
      ),
    );
  }
}
