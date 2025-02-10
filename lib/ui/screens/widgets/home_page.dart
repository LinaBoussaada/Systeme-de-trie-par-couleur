import 'package:colorproject/constants.dart';
import 'package:colorproject/models/boule.dart';
import 'package:colorproject/ui/screens/widgets/boule_widget.dart';
import 'package:colorproject/ui/screens/widgets/detailsPage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Boule> _bouleList = Boule.bouleList;

    List<String> _bouleTypes = [
      'Nombre Total',
      'Statistique',
      'News',
    ];

    //Toggle Favorite button
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  width: size.width * .9,
                  decoration: BoxDecoration(
                    color: Constants.primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black54.withOpacity(.6),
                      ),
                      const Expanded(
                          child: TextField(
                        showCursor: false,
                        decoration: InputDecoration(
                          hintText: 'Search Boule',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      )),
                      Icon(
                        Icons.mic,
                        color: Colors.black54.withOpacity(.6),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 50.0,
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _bouleTypes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _bouleTypes[index],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? Constants.primaryColor
                              : Constants.blackColor,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: size.height * .3,
            child: ListView.builder(
                itemCount: _bouleList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: DetailPage(
                                bouleId: _bouleList[index].bouleId,
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
            child: const Text(
              'Last updates about the system',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: size.height * .5,
            child: ListView.builder(
                itemCount: _bouleList.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DetailPage(
                                    bouleId: _bouleList[index].bouleId),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Boulewidget(index: index, bouleList: _bouleList));
                }),
          ),
        ],
      ),
    ));
  }
}
