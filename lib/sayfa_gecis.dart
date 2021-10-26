import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anasayfaya dön',

      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xfffce4ec),

      appBar: AppBar(
        title: const Text('Günün Sözü Anasayfa'),

        backgroundColor: Color(0xfff48fb1),
      ),

      body: const Center(



        child: SelectionButton(),
      ),
    );

  }
}




class SelectionButton extends StatelessWidget {
  const SelectionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      style: ElevatedButton.styleFrom(
          primary: Color(0xffec407a),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          textStyle:
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),


      child: const Text('Günün sözünü gör'),



    );
  }



  void _navigateAndDisplaySelection(BuildContext context) async {

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SelectionScreen()),
    );


    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bu sözü beğendiniz mi?'),
        backgroundColor: Color(0xfff48fb1),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.asset("resimler/mochi-peachcat-mochi.gif",width: ekranGenisligi/1.5,),
            Text("Anlamak masraflı iştir.\nEmek ister, gayret ister, samimiyet ister.\nYanlış anlamak kolaydır oysa.\nBiraz kötü niyet, biraz da cahillik kâfidir...",
              style:TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: ekranGenisligi/25,
              ),
                textAlign: TextAlign.center),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {

                  Navigator.pop(context, 'Güzel yorumunuz için teşekkürler :)');
                },

                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                child: const Text('Beğendim'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {

                  Navigator.pop(context, 'Uygulamamızı geliştirmeye devam edeceğiz');
                },

                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),

                child: const Text('Beğenmedim'),
              ),
            )
          ],

        ),
      ),

    );
  }
}