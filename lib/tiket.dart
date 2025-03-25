import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TicketPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class TicketPage extends StatelessWidget {
  final List<Map<String, dynamic>> flights = [
    {
      'airline': 'Batik Air',
      'logo': 'assets/batik.png',
      'departure': '09:20',
      'arrival': '12:10',
      'price': 'Rp 6.350.800',
      'baggage': '30KG'
    },
    {
      'airline': 'Lion Air',
      'logo': 'assets/lion.png',
      'departure': '15:30',
      'arrival': '18:25',
      'price': 'Rp 8.200.000',
      'baggage': '30KG'
    },
    {
      'airline': 'Garuda Indonesia',
      'logo': 'assets/garuda.png',
      'departure': '14:25',
      'arrival': '17:20',
      'price': 'Rp 15.850.300',
      'baggage': '30KG'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/tourist_4.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          leading: IconButton(
            icon: Image.asset('assets/icon_2.png', width: 24, height: 24),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jakarta (JKTA) → Bali (DPS)",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Selasa, 24 Desember 2024 • 1 Pax • Ekstra",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Image.asset('assets/menu-burger.png', width: 24, height: 24),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: flights.length,
        itemBuilder: (context, index) {
          final flight = flights[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TicketDetailPage(flight: flight),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                leading: Image.asset(flight['logo'], width: 50, height: 50),
                title: Text(
                  flight['airline'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${flight['departure']} - ${flight['arrival']}", style: TextStyle(fontSize: 14)),
                    Text("${flight['baggage']} bagasi", style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                trailing: Text(
                  flight['price'],
                  style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Halaman Detail Tiket
class TicketDetailPage extends StatelessWidget {
  final Map<String, dynamic> flight;

  TicketDetailPage({required this.flight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/tourist_4.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          leading: IconButton(
            icon: Image.asset('assets/icon_2.png', width: 24, height: 24),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Informasi", style: TextStyle(color: Colors.black, fontSize: 18)),
          actions: [
            IconButton(
              icon: Image.asset('assets/menu-burger.png', width: 24, height: 24),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(flight['logo'], width: 50, height: 50),
                        SizedBox(width: 10),
                        Text(
                          flight['airline'],
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(flight['departure'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text("CGK", style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        Column(
                          children: [
                            Text(flight['arrival'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text("DPS", style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("📦 ${flight['baggage']} bagasi"),
                    SizedBox(height: 5),
                    Text("👤 1 Orang"),
                    SizedBox(height: 10),
                    Text(
                      flight['price'],
                      style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Nama Lengkap",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: "Metode Pembayaran",
                        border: OutlineInputBorder(),
                      ),
                      items: ["Kartu Kredit", "Transfer Bank", "E-Wallet"]
                          .map((method) => DropdownMenuItem(value: method, child: Text(method)))
                          .toList(),
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Selanjutnya"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
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
