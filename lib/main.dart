import 'package:flutter/material.dart';

void main() => runApp(const JoinLeagueApp());

class JoinLeagueApp extends StatelessWidget {
  const JoinLeagueApp();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const JoinLeagueScreen(),
        '/joinleague': (context) => const JoinLeagueScreen(),
      },
    );
  }
}

class JoinLeagueScreen extends StatelessWidget {
  const JoinLeagueScreen();
  final String leaguename = ""; // change this once we figure out how to get league name from the database
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: Text('Join league ' + leaguename +'?'),
          ),
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Join a Moolah Master League', style: Theme.of(context).textTheme.headline2),
      ),
    );
  }
}



