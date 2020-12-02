import 'package:flutter/material.dart';

import '../Game selected/Game.dart';

class MoreContainers extends StatelessWidget {
  //can be changed, when we apply the database.
  String name;
  double rating;
  double maxwidth;
  double maxheight;
  String image;

  @override
  Widget build(BuildContext context) {
    name = 'The Witcher 3';
    rating = 4.5;
    image = 'assets/images/witcher.jpg';
    //the variables allow for modularity
    maxwidth = MediaQuery.of(context).size.width;
    maxheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
        height: 210,
        width: maxwidth / 2.4,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
              height: 210,
              width: maxwidth / 2.4,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 65,
                width: 140,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //single child scroll view to let the text overflow
                    Padding(
                      padding: const EdgeInsets.fromLTRB(9, 10, 9, 5),
                      child: SingleChildScrollView(
                        child: Text(
                          name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(9, 0, 0, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            rating.toString(),
                            style:
                                TextStyle(color: Colors.yellow, fontSize: 18),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.white.withOpacity(0.3),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Game(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
