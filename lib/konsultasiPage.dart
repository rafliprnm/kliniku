import 'package:flutter/material.dart';

class Konsultasi extends StatefulWidget {
  const Konsultasi({Key? key}) : super(key: key);

  @override
  _KonsultasiState createState() => _KonsultasiState();
}

class _KonsultasiState extends State<Konsultasi> {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Dr. Andy",
      "spesialis": "Akupuntur",
    },
    {
      "id": 2,
      "name": "Dr. Aragon",
      "spesialis": "Bedah Saraf",
    },
    {
      "id": 3,
      "name": "Dr. Bob",
      "spesialis": "Umum",
    },
    {
      "id": 4,
      "name": "Dr. Barbara",
      "spesialis": "Fisioterapi",
    },
    {
      "id": 5,
      "name": "Dr. Candy",
      "spesialis": "Gigi & Mulut",
    },
    {
      "id": 6,
      "name": "Dr. Colin",
      "spesialis": "Ginjal",
    },
    {
      "id": 7,
      "name": "Dr. Audra",
      "spesialis": "Jantung",
    },
    {
      "id": 8,
      "name": "Dr. Banana",
      "spesialis": "Kandungan",
    },
    {
      "id": 9,
      "name": "Dr. Caversky",
      "spesialis": "Gizi",
    },
    {
      "id": 10,
      "name": "Dr. Becky",
      "spesialis": "Mata",
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
        title: Text('Konsultasi'),
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
                          trailing: Icon(Icons.message),
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
