import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String foodName;
  final int price;
  final String image;

  const OrderPage({
    super.key,
    required this.foodName,
    required this.price,
    required this.image,
  });

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int quantity = 1;
  int totalPrice = 0;
  final TextEditingController _quantityController = TextEditingController();
  bool isSubmitted = false;

  @override
  void initState() {
    super.initState();
    _quantityController.text = "1";
  }

  void _calculateTotal() {
    setState(() {
      int inputQty = int.tryParse(_quantityController.text) ?? 1;
      quantity = (inputQty > 0) ? inputQty : 1;
      totalPrice = widget.price * quantity;
      isSubmitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Order"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(widget.image,
                  width: 200, height: 200, fit: BoxFit.cover),
              const SizedBox(height: 20),
              Text(widget.foodName,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              Text("Harga: Rp ${widget.price}",
                  style: const TextStyle(fontSize: 18, color: Colors.grey)),
              const SizedBox(height: 20),
              TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Masukkan Jumlah",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateTotal,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Submit",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              const SizedBox(height: 20),
              Text(
                "Total Harga: Rp ${isSubmitted ? totalPrice : 0}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
