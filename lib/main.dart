
import 'package:flutter/material.dart';

void main() {
  runApp(RumusFisika());
}

class RumusFisika extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanRumus(),
    );
  }
}

class HalamanRumus extends StatefulWidget {
  @override
  State<HalamanRumus> createState() => _HalamanRumusState();
}

class _HalamanRumusState extends State<HalamanRumus> {
  final TextEditingController arus = TextEditingController();
  final TextEditingController hambatan = TextEditingController();

  double hasil = 0;
  bool sudahDihitung = false;

  void hitung() {
    double i = double.tryParse(arus.text) ?? 0;
    double r = double.tryParse(hambatan.text) ?? 0;

    setState(() {
      hasil = i * r;
      sudahDihitung = true;
    });
  }

  @override
  void dispose() {
    arus.dispose();
    hambatan.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rumus Fisika"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.electric_bolt,
                size: 75,
                color: Colors.blue,
              ),
            ),
            Center(
              child: Text(
                "RUMUS TEGANGAN LISTRIK",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nomor Absen: 3"),
                    SizedBox(height: 10),
                    Text("V = Tegangan (Volt)"),
                    Text("I = Arus listrik (Ampere)"),
                    Text("R = Hambatan (Ohm)"),
                    SizedBox(height: 15),
                    Text(
                      "Rumus:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Center(
                      child: Text(
                        "V = I × R",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Masukkan Nilai",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            TextField(
              controller: arus,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Arus listrik (Ampere)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.bolt),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: hambatan,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Hambatan (Ohm)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.electrical_services),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: hitung,
                child: Text("HITUNG TEGANGAN"),
              ),
            ),
            if (sudahDihitung)
              Card(
                color: Colors.green.shade50,
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Text(
                        "Hasil Perhitungan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${hasil.toStringAsFixed(2)} Volt",
                        style: TextStyle(
                          fontSize: 27,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
