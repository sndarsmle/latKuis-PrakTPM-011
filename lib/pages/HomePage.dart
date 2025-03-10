import 'package:flutter/material.dart';
import 'package:latkuis_011/auth/LoginPage.dart';
import 'package:latkuis_011/pages/OrderPage.dart';

class MyHome extends StatelessWidget {
  final String username;
  MyHome({super.key, required this.username});

  final List<Map<String, dynamic>> menuList = [
    {"name": "Nasi Goreng", "price": 10000, "image": "assets/images/nasigoreng.jpg"},
    {"name": "Mie Goreng", "price": 9000, "image": "assets/images/miegoreng.jpg"},
    {"name": "Ayam Goreng", "price": 10000, "image": "assets/images/ayamgoreng.jpg"},
    {"name": "Sate Ayam", "price": 12000, "image": "assets/images/sateayam.jpg"},
    {"name": "Soto Ayam", "price": 9000, "image": "assets/images/sotoayam.jpg"},
    {"name": "Bakso", "price": 12000, "image": "assets/images/bakso.jpg"},
    {"name": "Nasi Kuning", "price": 8000, "image": "assets/images/nasikuning.jpg"},
    {"name": "Nasi Uduk", "price": 8000, "image": "assets/images/nasiuduk.jpg"},
    {"name": "Nasi Padang", "price": 13000, "image": "assets/images/nasipadang.jpg"},
    {"name": "Nasi Rames", "price": 10000, "image": "assets/images/nasirames.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo $username",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              "Mau Order Apa Hari ini",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bannerImage(), // Banner dari link
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Daftar Menu:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            _menuGrid(), // GridView makanan
          ],
        ),
      ),
    );
  }

  Widget _bannerImage() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/warteg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _menuGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: menuList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final menu = menuList[index];
            return _menuItem(menu["name"], menu["price"], menu["image"]);
          }),
    );
  }

  Widget _menuItem(String name, int price, String image) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    formatRupiah(price),
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Builder(
                    builder: (BuildContext newContext) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            newContext,
                            MaterialPageRoute(
                              builder: (context) => OrderPage(
                                foodName: name,
                                price: price,
                                image: image,
                              ),
                            ),
                          );
                        },
                        child: Text("Pesan"),
                      );
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }

  String formatRupiah(int price) {
    return "Rp${price.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        )}";
  }
}
