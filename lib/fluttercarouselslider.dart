import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlutterCarouselSlider());
}

class FlutterCarouselSlider extends StatelessWidget {
  const FlutterCarouselSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepageforcarouselslider(),
    );
  }
}

class Homepageforcarouselslider extends StatefulWidget {
  const Homepageforcarouselslider({Key? key}) : super(key: key);

  @override
  State<Homepageforcarouselslider> createState() =>
      _HomepageforcarouselsliderState();
}

class _HomepageforcarouselsliderState extends State<Homepageforcarouselslider> {
  getData() {
    return FirebaseFirestore.instance
        .collection('flutter_carouselslider_images')
        .get();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Flutter Carousel Slider'),
              centerTitle: true,
            ),
            body: FutureBuilder(
                future: getData(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  return CarouselSlider.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, i, j) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[i];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.network(
                            documentSnapshot['image_url'],
                            height: MediaQuery.of(context).size.height * 0.7,
                            width: MediaQuery.of(context).size.width * 0.7,
                          ),
                        );
                      },
                      options: CarouselOptions());
                })));
  }
}
