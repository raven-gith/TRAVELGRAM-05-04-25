import 'package:flutter/material.dart';

class TiketBusPage extends StatelessWidget {
  const TiketBusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Image.asset(
          'assets/tourist_2.png',
          fit: BoxFit.cover,
        ),
        leading: IconButton(
          icon: Image.asset('assets/icon_2.png', width: 24),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/menu-burger.png', width: 24),
            onPressed: () {},
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Jakarta → Semarang', style: TextStyle(color: Colors.black)),
            const Text('Selasa, 24 Desember 2024 • 1 Orang',
                style: TextStyle(fontSize: 12, color: Colors.black54)),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildTicketItem(
            context,
            name: 'Lorena',
            type: 'Terminal Pulo Gebang',
            departure: '10.00',
            arrival: '17.00',
            price: 'Rp 350.800',
          ),
          _buildTicketItem(
            context,
            name: 'Sumber Alam',
            type: 'Terminal Pasar Rebo',
            departure: '13.00',
            arrival: '20.00',
            price: 'Rp 400.000',
          ),
        ],
      ),
    );
  }

  Widget _buildTicketItem(BuildContext context,
      {required String name, required String type, required String departure, required String arrival, required String price}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentPage(ticketName: name, price: price)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(type, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                Row(
                  children: [
                    Text(departure),
                    const Text('  ——  '),
                    Text(arrival),
                  ],
                ),
              ],
            ),
            Text(price, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  final String ticketName;
  final String price;

  const PaymentPage({super.key, required this.ticketName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pembayaran')), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.payment, size: 80, color: Colors.blue),
                    const SizedBox(height: 10),
                    Text(ticketName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Text(price, style: const TextStyle(fontSize: 20, color: Colors.orange, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Pilih Metode Pembayaran', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.credit_card, color: Colors.green),
                    title: const Text('Kartu Kredit/Debit'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  Divider(height: 1, color: Colors.grey[300]),
                  ListTile(
                    leading: const Icon(Icons.account_balance_wallet, color: Colors.purple),
                    title: const Text('E-Wallet'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  Divider(height: 1, color: Colors.grey[300]),
                  ListTile(
                    leading: const Icon(Icons.attach_money, color: Colors.orange),
                    title: const Text('Transfer Bank'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Bayar Sekarang', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
