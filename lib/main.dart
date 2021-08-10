import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List imagesUrl=[
    "images/s1.jpg",
    "images/s3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Image Slider"),
      ),
      body: Center(
                child: CarouselSlider(
                  items: imagesUrl.map(
                          (img) {
                            return Container(
                              width: double.infinity,
                              // margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(img.toString(),fit:BoxFit.fill ,),
                            );
                          }
                            ).toList(),
                  options: CarouselOptions(
                      height:200,//image slider طول
                    initialPage: 0,//الصورة التي يبدأ بها
                      enlargeCenterPage:true,//يجعل الصور الموجودة في المنتصف كبيرة
                    autoPlay: true,//يجعل الصورة تتحرك تلقائيا
                    autoPlayInterval: Duration(seconds: 2),//مدة الإنتقال من صورة لصورة
                    enableInfiniteScroll: false,//عند انتهاء الصور يرجع للصورة الأولى
                    pauseAutoPlayOnTouch: false,//يجعل الصور تتحرك عند الضغط على الصورة  لعكس الأمر ضع ترو بدل فولس
                      onPageChanged:(index , _){
                        setState(() {
                          print("index: $index");
                        });
                      }
                  ),
                ),
      ),

    );
  }
}
