import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/MoreContainers.dart';

class More extends StatelessWidget {
  String TitleMore;
  //this will enable the more page
  //to be modular
  //just pass in the selected name of the String

  @override
  Widget build(BuildContext context) {
    TitleMore = 'Favourites'; //dummy data for change in the future
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //text about the more page
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  TitleMore,
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Wrap(
                  children: [
                    MoreContainers(),
                    MoreContainers(),
                    MoreContainers(),
                    MoreContainers(),
                    MoreContainers(),
                    MoreContainers(),
                    MoreContainers(),
                    MoreContainers(),
                    MoreContainers(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
