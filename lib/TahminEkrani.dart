import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guessnumber/Sonucekrani.dart';


class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key}) : super(key: key);

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tf_controller=TextEditingController();
  int  random_sayi=0;
  int kalanHak=5;
  String Geribildirim="";


  @override
  void initState() {
    super.initState();
    random_sayi=Random().nextInt(101);
    print("Rasgele Sayi:${random_sayi}");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oyun Ekranı",style: TextStyle(color: Colors.black),)
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("last $kalanHak right ",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.black),),
            Text("Help:$Geribildirim",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.black87),),
            SizedBox(
              height: 50,
              width: 330,
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                controller:tf_controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black,
                  labelText: "Guess",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                  ),
                ),

              ),
            ),
            SizedBox(
              height: 50,
              width: 330,
              child: ElevatedButton(
                child: Text("Guess",style: TextStyle(fontSize: 21,color: Colors.white,fontWeight: FontWeight.bold),),
                onPressed: () {


                  int tahmin = int.parse(tf_controller.text);

                  setState(() {
                    if(tahmin != null){
                      kalanHak--;
                    } else{
                      Geribildirim = "Lütfen sayı giriniz";
                    }
                  });

                  if( tahmin==random_sayi){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>SonucEkrani(sonuc: true,)));
                    return;
                  }
                  if (tahmin>random_sayi){
                    setState(() {
                      Geribildirim="A bit lower";
                    });
                  }
                  if(tahmin<random_sayi){
                    setState(() {
                      Geribildirim="A bit higher";
                    });
                  }
                  if(kalanHak==0){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>SonucEkrani( sonuc:false,)));

                  }
                  tf_controller.text="";



                } ,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                    side: BorderSide(
                      width: 2
                    )
                  )
                ),
              ),
            ),


          ],
        ),
      ),
    );


  }
}
