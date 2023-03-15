import 'package:flutter/material.dart';

import 'TahminEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.dark,

        primarySwatch: Colors.blue,
      ),
      home: AnaSayfa()
    );
  }
}

class AnaSayfa extends StatefulWidget {


  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage",style: TextStyle(color: Colors.black),),
      ),
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Text("Guessing Game",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Image.asset("Resimler/zar_resim.png"),

            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: SizedBox(
                height: 70,
                width: 270,
                child: ElevatedButton(
                  child: Text("Start Game"),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>TahminEkrani()));
                    });

                  } ,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(22)),

                    )
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
