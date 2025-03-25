import 'package:flutter/material.dart';

class TiketHotelPage extends StatefulWidget {
  @override
  _TiketHotelPageState createState() => _TiketHotelPageState();
}

class _TiketHotelPageState extends State<TiketHotelPage> {
  bool showBookingForm = false; // Untuk menampilkan form booking
  String? selectedPayment;
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/tourist_4.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Image.asset("assets/icon_2.png", width: 24, height: 24),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: Image.asset("assets/menu-burger.png", width: 24, height: 24),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Hotel
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/3.png',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),

            // Informasi Hotel
            Text("De Aguero Hotel", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Bandung, Jawa Barat", style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 8),

            // Rating dan Review
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 18),
                SizedBox(width: 4),
                Text("4.8 (1020 reviews)", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
              ],
            ),
            SizedBox(height: 8),

            // Harga Hotel
            Text("Rp 875.000", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange)),
            SizedBox(height: 16),

            // Tombol Pesan Sekarang
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    showBookingForm = !showBookingForm; // Toggle form booking
                  });
                },
                child: Text("Pesan Sekarang", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),

            // Form Booking (Hanya Ditampilkan Setelah Klik "Pesan Sekarang")
            if (showBookingForm) ...[
              SizedBox(height: 16),
              Text("Nama Pemesan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Masukkan nama Anda",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              SizedBox(height: 16),

              Text("Metode Pembayaran", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),

              Column(
                children: [
                  buildPaymentOption("Transfer Bank"),
                  buildPaymentOption("e-Wallet"),
                  buildPaymentOption("Kartu Kredit"),
                ],
              ),
              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (nameController.text.isEmpty) {
                      showMessage("Masukkan nama pemesan!");
                    } else if (selectedPayment == null) {
                      showMessage("Pilih metode pembayaran!");
                    } else {
                      showMessage("Pembayaran berhasil dengan ${selectedPayment!}");
                    }
                  },
                  child: Text("Konfirmasi Pembayaran", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOption(String paymentMethod) {
    return ListTile(
      title: Text(paymentMethod),
      leading: Radio<String>(
        value: paymentMethod,
        groupValue: selectedPayment,
        onChanged: (String? value) {
          setState(() {
            selectedPayment = value;
          });
        },
      ),
    );
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
