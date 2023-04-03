import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kliniku/detailDokter.dart';

class JadwalDokter extends StatefulWidget {
  const JadwalDokter({Key? key}) : super(key: key);

  @override
  _JadwalDokterState createState() => _JadwalDokterState();
}

class _JadwalDokterState extends State<JadwalDokter> {

  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Dr. Andy",
      "spesialis": "Akupuntur",
      "lokasi": "Rs. Bandung"
    },
    {
      "id": 2,
      "name": "Dr. Aragon",
      "spesialis": "Bedah Saraf",
      "lokasi": "Rs. Bandung"
    },
    {"id": 3, "name": "Dr. Bob", "spesialis": "Umum", "lokasi": "Rs. Bandung"},
    {
      "id": 4,
      "name": "Dr. Barbara",
      "spesialis": "Fisioterapi",
      "lokasi": "Rs. Bandung"
    },
    {
      "id": 5,
      "name": "Dr. Candy",
      "spesialis": "Gigi & Mulut",
      "lokasi": "Rs. Bandung"
    },
    {
      "id": 6,
      "name": "Dr. Colin",
      "spesialis": "Ginjal",
      "lokasi": "Rs. Bandung"
    },
    {
      "id": 7,
      "name": "Dr. Audra",
      "spesialis": "Jantung",
      "lokasi": "Rs. Bandung"
    },
    {
      "id": 8,
      "name": "Dr. Banana",
      "spesialis": "Kandungan",
      "lokasi": "Rs. Bandung"
    },
    {
      "id": 9,
      "name": "Dr. Caversky",
      "spesialis": "Gizi",
      "lokasi": "Rs. Bandung"
    },
    {
      "id": 10,
      "name": "Dr. Becky",
      "spesialis": "Mata",
      "lokasi": "Rs. Bandung"
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Dokter'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: Colors.white,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: Image.asset(
                              'assets/doctor.png',
                              width: 40,
                              height: 40,
                            ),
                            backgroundColor: Colors.greenAccent,
                          ),
                          title: Text(_foundUsers[index]['name'],
                              style: TextStyle(color: Colors.black)),
                          subtitle: Text(_foundUsers[index]['spesialis'],
                              style: TextStyle(color: Colors.grey)),
                          trailing: Text(_foundUsers[index]['lokasi'],
                              style: TextStyle(color: Colors.grey)),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailDokter()),
                            );
                          },
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
