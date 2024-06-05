import 'package:flutter/material.dart';

class ImportFavorites extends StatelessWidget {
  const ImportFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Import Favorites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Your existing widgets here...
            NewWidget(),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weincode:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 391.0,
              height: 44.0,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Add more space
            Text(
              'Name der Liste:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 391.0,
              height: 44.0,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Add more space
            Align(
              alignment: Alignment.centerRight,
              child: FractionallySizedBox(
                widthFactor: 1 / 3,
                child: Container(
                  height: 30.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        StadiumBorder(),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Importieren',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
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
