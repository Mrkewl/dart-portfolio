import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as Http;
import 'package:portfolio/screens/home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// Future<String> fetchAlbum() async {
//   Http.Response response =
//       await Http.get(Uri.parse('http://127.0.0.1:8000/api/user'));
//   print(response.body);
//   return response.body;
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // fetchAlbum();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
