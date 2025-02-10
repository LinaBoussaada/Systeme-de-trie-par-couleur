import 'package:colorproject/constants.dart';
import 'package:colorproject/models/boule.dart';
import 'package:colorproject/ui/screens/widgets/boule_widget.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  final List<Boule> favoritedBoule;
  const FavoritePage({Key? key, required this.favoritedBoule})
      : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritedBoule.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/favorited.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your favorited Boules',
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: widget.favoritedBoule.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Boulewidget(
                        index: index, bouleList: widget.favoritedBoule);
                  }),
            ),
    );
  }
}
