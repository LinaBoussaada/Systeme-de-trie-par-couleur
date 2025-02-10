/**import 'package:colorproject/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Chart App',
      home: StatisticsWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StatisticsWidget extends StatefulWidget {
  const StatisticsWidget({Key? key}) : super(key: key);

  @override
  _StatisticsWidgetState createState() => _StatisticsWidgetState();
}

class _StatisticsWidgetState extends State<StatisticsWidget> {
  final DatabaseReference _databaseRef = FirebaseDatabase.instance.ref(
      "https://systeme-de-tri-par-couleur-default-rtdb.firebaseio.com/Compteur"); // Reference to the root of your data
  List<BarChartGroupData> _chartData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final snapshot = await _databaseRef.get();
      if (snapshot.exists) {
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        _chartData = data.entries.map((entry) {
          final index = data.keys.toList().indexOf(entry.key); // Get the index
          final value = entry.value as int;
          return BarChartGroupData(
            x: index, // Use the correct index here
            barRods: [
              BarChartRodData(toY: value.toDouble(), color: Colors.blue),
            ],
          );
        }).toList();
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Statistics"),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : BarChart(
                BarChartData(
                  barGroups: _chartData,
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
**/