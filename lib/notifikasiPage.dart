import 'package:flutter/material.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({Key? key}) : super(key: key);

  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
        backgroundColor: Colors.greenAccent,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Image.asset(
                    'assets/mail.png',
                    width: 40,
                    height: 40,
                  ),
                  backgroundColor: Colors.greenAccent,
                ),
                title: Text('Update Aplikasi'),
                subtitle: Text('Segera update apliksi kliniku ke versi 1.1.0'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
