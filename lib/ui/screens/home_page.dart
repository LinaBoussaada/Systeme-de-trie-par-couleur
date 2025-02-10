import 'package:colorproject/constants.dart';
import 'package:colorproject/models/boule.dart';
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

    List<Boule> _bouleList = Boule.bouleList;

    List<String> _Types = [
      'News',
      'statistique',
      'details',
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
            // Search Bar Placeholder
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              child: SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    filled: true,
                    fillColor: Constants.primaryColor.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),

            // Navigation Tabs
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _Types.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        _Types[index],
                        style: TextStyle(
                          fontSize: 16,
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
                },
              ),
            ),

            // Vertical Item List
            ListView.builder(
              itemCount: _bouleList.length,
              physics:
                  const NeverScrollableScrollPhysics(), // Désactive le scrolling interne.
              shrinkWrap:
                  true, // Permet à la liste de s'adapter à la hauteur disponible.
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: DetailPage(
                          bouleId: _bouleList[index].bouleId,
                        ),
                        type: PageTransitionType.bottomToTop,
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Background
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: ColoredBox(
                            color: Constants.primaryColor.withOpacity(0.8),
                            child: SizedBox(
                              height: 150,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        // Favorite Icon
                        Positioned(
                          top: 10,
                          right: 20,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                bool isFavorited = toggleIsFavorated(
                                    _bouleList[index].isFavorated);
                                _bouleList[index].isFavorated = isFavorited;
                              });
                            },
                            icon: Icon(
                              _bouleList[index].isFavorated
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // Image
                        Positioned(
                          left: 20,
                          top: 20,
                          bottom: 20,
                          child: Image.asset(
                            _bouleList[index].imageURL,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        // Label
                        Positioned(
                          top: 20,
                          left: 140,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _bouleList[index].color,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                "Description here",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
