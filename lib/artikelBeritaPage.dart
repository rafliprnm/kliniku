import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:kliniku/detailBerita.dart';

class ArtikelBerita extends StatefulWidget {
  const ArtikelBerita({Key? key}) : super(key: key);

  @override
  _ArtikelBeritaState createState() => _ArtikelBeritaState();
}

class _ArtikelBeritaState extends State<ArtikelBerita> {
  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Artikel & Berita'),
          backgroundColor: Colors.greenAccent,
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: db.collection('berita').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            }
            var _data = snapshot.data!.docs;

            return ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                var judul_berita = _data[index].data()['judul'];
                var tanggal_berita = _data[index].data()['tanggal'];
                var isi_berita = _data[index].data()['pesan'];
                return InkWell(
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailBerita(
                                judul: judul_berita,
                                tanggal: tanggal_berita,
                                isiBerita: isi_berita,
                                )),
                      );
                    },
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: GFCard(
                      boxFit: BoxFit.cover,
                      titlePosition: GFPosition.start,
                      showImage: true,
                      image: Image.asset(
                        'assets/poster.jpg',
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      title: GFListTile(
                        titleText: judul_berita,
                        subTitleText: tanggal_berita,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
