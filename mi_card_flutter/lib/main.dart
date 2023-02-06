import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/kendrick_lamar.jpg'),
            ),
            const Text(
              'Kendrick Lamar',
              style: TextStyle(
                fontFamily: 'Pacifico',
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'HIP-HOP ARTIST',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(
              width: 200,
              height: 20,
              child: Divider(
                color: Colors.teal[100],
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  '+251 91 234 5678',
                  style: TextStyle(
                    color: Colors.teal[900],
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
              child: ListTile(
                leading: const Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: Text(
                  'kendrick.lamar@gmail.com',
                  style: TextStyle(
                    color: Colors.teal[900],
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
