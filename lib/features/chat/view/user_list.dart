import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_exports.dart';
import 'convo_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOutUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Chats',
          style: AppStyle.h2Dark500.copyWith(
            fontSize: 24,
            color: Pallete.neutral,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: signOut,
              child: const Icon(Iconsax.logout_copy),
            ),
          ),
        ],
      ),
      body: _userList(),
    );
  }
}

Widget _userList() {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('users').snapshots(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return const Text('No connection');
        case ConnectionState.waiting:
          return const CircularProgressIndicator(); //! custom loader here
        case ConnectionState.active:
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildListTile(doc))
                .toList(),
          );
        case ConnectionState.done:
          return const Text('Stream ended');
      }
    },
  );
}

Widget _buildListTile(DocumentSnapshot document) {
  final auth = FirebaseAuth.instance.currentUser;
  MapString data = document.data()! as MapString;
  if (auth!.email != data['email']) {
    String email = data['email'];
    String uid = data['uid'];
    String f = email[0].toUpperCase();
    String l = email[2].toUpperCase();

    return ListTile(
      onTap: () => AppRouter.push(
        ConvoView(receiverId: uid, email: email, initials: email.initials),
      ),
      // initials: '$f$l',
      leading: CircleAvatar(radius: 24, child: Text('$f$l')),
      title: Text(
        email,
        style: AppStyle.bDark400.copyWith(fontSize: 18),
      ),
      // subtitle: Text(email, style: AppStyle.sDark400),
    );
  }
  return const SizedBox.shrink();
}
