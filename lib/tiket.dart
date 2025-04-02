import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'amadeus_service.dart';

class TicketPage extends StatefulWidget {
  final String origin;
  final String destination;
  final String departureDate;

  const TicketPage({
    super.key,
    required this.origin,
    required this.destination,
    required this.departureDate,
  });

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  final amadeus = AmadeusService();
  List<dynamic> flights = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadFlights();
  }

  Future<void> loadFlights() async {
    try {
      final results = await amadeus.searchFlights(
        origin: widget.origin,
        destination: widget.destination,
        date: widget.departureDate,
      );
      setState(() {
        flights = results;
        isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hasil Pencarian Tiket")),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : flights.isEmpty
              ? const Center(child: Text("Tidak ada hasil ditemukan"))
              : ListView.builder(
                  itemCount: flights.length,
                  itemBuilder: (context, index) {
                    final offer = flights[index];
                    final flight = offer['itineraries'][0]['segments'][0];
                    final airline = flight['carrierCode'];
                    final departure = flight['departure']['at'].substring(11, 16);
                    final arrival = flight['arrival']['at'].substring(11, 16);
                    final price = offer['price']['total'];

                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: CircleAvatar(child: Text(airline)),
                        title: Text('$airline'),
                        subtitle: Text('$departure - $arrival'),
                        trailing: Text('Rp $price'),
                      ),
                    );
                  },
                ),
    );
  }
}
