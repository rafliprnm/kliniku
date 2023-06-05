import 'package:flutter/material.dart';

class DetailBerita extends StatefulWidget {
  final String judul;
  final String tanggal;
  final String isiBerita;
  const DetailBerita(
      {Key? key,
      required this.judul,
      required this.tanggal,
      required this.isiBerita})
      : super(key: key);

  @override
  _DetailBeritaState createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.judul}'),
          backgroundColor: Colors.greenAccent,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/poster.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              '${widget.isiBerita}',
              style: TextStyle(
                fontSize: 17,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        )));
  }
}
