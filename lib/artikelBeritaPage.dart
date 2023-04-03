import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ArtikelBerita extends StatefulWidget {
  const ArtikelBerita({Key? key}) : super(key: key);

  @override
  _ArtikelBeritaState createState() => _ArtikelBeritaState();
}

class _ArtikelBeritaState extends State<ArtikelBerita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Artikel & Berita'),
          backgroundColor: Colors.greenAccent,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: (Column(
              children: [
                GFCard(
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
                    titleText: 'Pola Hidup Sehat',
                    subTitleText: '10 Januari 2020',
                  ),
                ),
                GFCard(
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
                    titleText: 'Pola Hidup Sehat',
                    subTitleText: '10 Januari 2020',
                  ),
                ),
                GFCard(
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
                    titleText: 'Pola Hidup Sehat',
                    subTitleText: '10 Januari 2020',
                  ),
                ),
              ],
            )),
          ),
        ));
  }
}
