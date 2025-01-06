import 'package:alrahaala/features/chat/Presentation/widgets/text_field_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class chatViewBody extends StatelessWidget {
 chatViewBody({super.key});
 final FirebaseAuth  _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
        String email = _firebaseAuth.currentUser!.email.toString();
    return bodyCustomChat(email: email);
  }
}