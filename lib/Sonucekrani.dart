import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {

  bool sonuc;
  SonucEkrani({required this.sonuc});


  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Ekranı",style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            widget.sonuc? Image.asset("Resimler/mutlu_resim.png"):Image.asset("Resimler/uzgun_resim.png"),
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child:
              widget.sonuc? Text("You Won",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.black),):Text("You Lost",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.black),),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: SizedBox(
                height: 70,
                width: 270,
                child: ElevatedButton(
                  child: Text("Try Again"),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
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
            SizedBox(height: 50,),



          ],
        ),
      ),
    );
  }
}
