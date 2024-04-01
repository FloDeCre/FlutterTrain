import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Liste Page"
        ),
      ),
      body : const Center(
        child: Text(
          "TextListePage"
        ),
      )
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scratch"),
        backgroundColor: const Color(0x7000FF00),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                "assets/images/logo_flutter.svg",
              width:90 ,
            ),
            const Padding(
              padding: EdgeInsets.only(top:50.0),
              child: Text(
                "Welcome in the body",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Arcade",
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Text(
              "Little demo app\n To handle awesome flutter",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
                onPressed: ()=> Navigator.push(
                    context,
                    PageRouteBuilder(pageBuilder: (_,__,___)=>const ListPage())),
                child: const Text(
                  "List Page",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
