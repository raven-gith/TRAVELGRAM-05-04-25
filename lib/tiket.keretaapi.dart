import 'package:flutter/material.dart';

class TiketKeretaApiScreen extends StatefulWidget {
  @override
  _TiketKeretaApiScreenState createState() => _TiketKeretaApiScreenState();
}

class _TiketKeretaApiScreenState extends State<TiketKeretaApiScreen> {
  String? selectedTrain;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isBooking = false;

  void proceedToPayment() {
    setState(() {
      isBooking = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Image.asset('assets/icon_2.png'),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Jakarta → Semarang"),
        flexibleSpace: Image.asset(
          'assets/tourist_3.png',
          fit: BoxFit.cover,
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/menu-burger.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: isBooking ? buildBookingForm() : buildTrainList(),
    );
  }

  Widget buildTrainList() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ListTile(
          title: Text("KA Lodaya"),
          subtitle: Text("07.00 - 12.10"),
          trailing: Text("Rp 600.000/pax", style: TextStyle(color: Colors.orange)),
          onTap: () {
            setState(() {
              selectedTrain = "KA Lodaya";
            });
            proceedToPayment();
          },
        ),
        ListTile(
          title: Text("KA Taksaka"),
          subtitle: Text("08.20 - 13.12"),
          trailing: Text("Rp 800.000/pax", style: TextStyle(color: Colors.orange)),
          onTap: () {
            setState(() {
              selectedTrain = "KA Taksaka";
            });
            proceedToPayment();
          },
        ),
      ],
    );
  }

  Widget buildBookingForm() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pesan Tiket: $selectedTrain", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Nama Lengkap"),
          ),
          SizedBox(height: 16),
          TextField(
            controller: addressController,
            decoration: InputDecoration(labelText: "Alamat"),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentScreen()),
              );
            },
            child: Text("Lanjut ke Pembayaran"),
          ),
        ],
      ),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pembayaran")),
      body: Center(
        child: Text("Menu Pembayaran (Implementasi lanjut)"),
      ),
    );
  }
}
