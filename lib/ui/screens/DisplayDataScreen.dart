import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class DisplayDataScreen extends StatefulWidget {
  const DisplayDataScreen({Key? key}) : super(key: key);

  @override
  State<DisplayDataScreen> createState() => _DisplayDataScreenState();
}

class _DisplayDataScreenState extends State<DisplayDataScreen> {
  final DatabaseReference _databaseRef =
      FirebaseDatabase.instance.ref(); // Référence Firebase
  List<Map<String, dynamic>> _dataList = []; // Stocke les données récupérées
  bool _isLoading = true; // Pour afficher un indicateur de chargement

  @override
  void initState() {
    super.initState();
    _fetchData(); // Récupération des données
  }

  Future<void> _fetchData() async {
    try {
      final DataSnapshot snapshot = await _databaseRef.child('users').get();

      if (snapshot.exists) {
        // Convertir les données en une liste d'objets
        Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
        _dataList = data.entries.map((entry) {
          return {
            'id': entry.key,
            'name': entry.value['name'],
            'age': entry.value['age'],
          };
        }).toList();
      }
    } catch (e) {
      print('Erreur lors de la récupération des données : $e');
    }

    setState(() {
      _isLoading = false; // Arrêter l'indicateur de chargement
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Données Firebase'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator()) // Chargement
          : _dataList.isEmpty
              ? const Center(
                  child: Text('Aucune donnée trouvée.')) // Pas de données
              : ListView.builder(
                  itemCount: _dataList.length,
                  itemBuilder: (context, index) {
                    final item = _dataList[index];
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(item['age'].toString()), // Affiche l'âge
                      ),
                      title: Text(item['name']), // Affiche le nom
                      subtitle: Text('ID : ${item['id']}'), // Affiche l'ID
                    );
                  },
                ),
    );
  }
}
