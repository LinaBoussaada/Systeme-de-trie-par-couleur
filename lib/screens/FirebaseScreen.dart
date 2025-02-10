import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseScreen extends StatelessWidget {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();

  // Fonction pour écrire des données dans Firebase Realtime Database
  void _writeData() async {
    // Référence pour un utilisateur unique
    DatabaseReference userRef = _databaseRef.child('users').push();

    // Écrire des données
    await userRef.set({
      'name': 'Jane Doe',
      'age': 25,
    });

    print('Données écrites avec succès');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Interface'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _writeData,
          child: Text('Écrire dans Firebase'),
        ),
      ),
    );
  }
}
