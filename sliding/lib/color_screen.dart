import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'detail_screen.dart';
import 'custom_app_bar.dart';
import 'data.dart';
import 'dart:async';



class ColorScreen extends StatefulWidget {
  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  bool _isButtonVisible = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startBlinking();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startBlinking() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _isButtonVisible = !_isButtonVisible;
      });
    });
  }

  void navigateToDetailScreen(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          color:  Color(0xFF171308),
          index: index,
          appBar: CustomAppBar(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: CustomAppBar(),
        ),
      ),
      backgroundColor:  Color(0xFF171308),
      body: PageView.builder(
        physics: PageScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: ImageData.imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onLongPress: () {
              navigateToDetailScreen(context, index);
            },
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                ImageData.imagePaths[index],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                              ),
                            ),
                            // Adding title label at the bottom
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 116, 114, 114).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  tr(ImageData.imageTitles[index]),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.center,
                          color: Color(0xFF171308),
                          child: Text(
                            tr(ImageData.imageDescriptions[index]),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.08,
                  right: 0,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 185, 223, 236).withOpacity(0.1),// Changed the background color here
                      borderRadius: BorderRadius.circular(10), // Square background
                    ),
                    child: Center(
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: _isButtonVisible ? 1 : 0,
                        child: IconButton(
                          onPressed: () {
                            navigateToDetailScreen(context, index);
                          },
                          icon: Icon(Icons.arrow_forward),
                          color: Colors.white, // Icon color here
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
