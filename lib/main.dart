import 'package:flutter/material.dart';
import 'login/login.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ImuniZapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> imgList = [
    Image.asset("assets/vacina1.jpg", fit: BoxFit.cover, width: double.infinity, color: Colors.black.withOpacity(0.5), colorBlendMode: BlendMode.darken),
    Image.asset("assets/vacina2.jpg", fit: BoxFit.cover, width: double.infinity, color: Colors.black.withOpacity(0.5), colorBlendMode: BlendMode.darken),
    Image.asset("assets/vacina3.jpg", fit: BoxFit.cover, width: double.infinity, color: Colors.black.withOpacity(0.5), colorBlendMode: BlendMode.darken),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-Vindo'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF089488),
              ),
              child: Text(
                'Duvidas? Nos contate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              viewportFraction: 1.0,
              enlargeCenterPage: false,
            ),
            items: imgList.map((item) => Container(
              child: item,
            )).toList(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bem-Vindo ao ImuniZapp!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF11B39B),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Seu aplicativo de imunização',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF089488),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Organize suas vacinas facilmente',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF01E1DA),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Veja as vacinas disponíveis',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF01E1DA),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'ImuniZapp, Sua saúde é nossa prioridade!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF01E1DA),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                "assets/logo.png",
                height: 120,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Ir para tela de login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
