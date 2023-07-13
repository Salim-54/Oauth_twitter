import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(ProfileScreen());
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [],
  );

  String _name = '';
  String _email = '';
  String _dob = '';
  String _profileImage = '';

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  Future<void> _getUserDetails() async {
    try {
      GoogleSignInAccount? user = await _googleSignIn.signIn();
      setState(() {
        _name = user?.displayName ?? '';
        _email = user?.email ?? '';
        _dob = '01 09 2000';
        _profileImage = user?.photoUrl ?? '';
      });
    } catch (error) {
      print('Error retrieving user details: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          _name,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _profileImage.isNotEmpty
                ? CircleAvatar(
                    radius: 80.0,
                    backgroundImage: NetworkImage(_profileImage),
                  )
                : Container(),
            const SizedBox(height: 20.0),
            Text(
              _name,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              _email,
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'DOB: $_dob',
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
