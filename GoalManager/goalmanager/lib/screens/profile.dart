import 'package:goalmanager/screens/components/appbar.dart';
import 'package:goalmanager/services/auth_service.dart';
import 'package:goalmanager/services/google_auth.dart';
import 'package:goalmanager/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String? email, photoUrl, name;

  const Profile(
      {required this.email,
      required this.name,
      required this.photoUrl,
      super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    if (widget.photoUrl != null) {
      return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(title: 'Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  foregroundImage: NetworkImage(widget.photoUrl!),
                  radius: 70,
                  child: const Text('Loading'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.name ?? '',
                  style: const TextStyle(fontSize: 24, color: Colors.green),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.email ?? '',
                  style: TextStyle(color: Colors.green.shade900),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: myButtonStyle,
                  onPressed: () {
                    Navigator.pop(context);
                    if (FirebaseAuth
                            .instance.currentUser?.providerData[0].providerId ==
                        "google.com") {
                      GoogleAuthentication().googleLogout();
                    } else {
                      _authService.logout();
                    }
                  },
                  child: const Text('Logout'),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(title: 'Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  foregroundImage: Image.asset('lib/assets/error.png').image,
                  radius: 70,
                  child: const Text('Loading'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.name ?? '',
                  style: const TextStyle(fontSize: 24, color: Colors.green),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.email ?? '',
                  style: TextStyle(color: Colors.green.shade900),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: myButtonStyle,
                  onPressed: () {
                    Navigator.pop(context);
                    if (FirebaseAuth
                            .instance.currentUser?.providerData[0].providerId ==
                        "google.com") {
                      GoogleAuthentication().googleLogout();
                    } else {
                      _authService.logout();
                    }
                  },
                  child: const Text('Logout'),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
