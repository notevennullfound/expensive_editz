import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:download/download.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'dart:html';

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return IconButton(
        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
        icon: FaIcon(FontAwesomeIcons.gamepad),
        onPressed: () {
          print("Pressed");
        });
  }
}

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(color: Colors.grey.shade300,
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 7,
                  child: Text('EXPENSIVE EDITZ',
                      style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Futura',
                          fontWeight: FontWeight.bold)),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.search))
                /*Expanded(
                  flex: 3,
                  child: Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                )*/
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 2,
                ),
                Text(
                  'LIGHTROOM PRESETS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: _height * .7,
              child: ScrollConfiguration(
                behavior: MyCustomScrollBehavior(),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,

                  physics: BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(

                        children: [
                          Container(
                            height: _height / 2,
                            child: Image.asset(
                              'assets/PRESET_1.jpg',
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            margin: EdgeInsets.all(0),

                            child: ElevatedButton(

                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber),
                              onPressed: () {
                                const _url = "http://www.expensiveeditz.online/Documents/LR_PRESET_1.dng";
                                downloadFileFromDownloadableLink(_url, 'LR_PRESET_1.dng');

                              },
                              child: Text('DOWNLOAD DNG',
                                style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(

                        children: [
                          Container(
                            height: _height / 2,

                            child: Image.asset(
                              'assets/PRESET_2.jpg',
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            margin: EdgeInsets.all(0),
                            child: ElevatedButton(

                              style: ElevatedButton.styleFrom(

                                backgroundColor: Colors.amber,
                              ),
                              onPressed: () {
                                const _url = "http://www.expensiveeditz.online/Documents/LR_PRESET_2.dng";
                                downloadFileFromDownloadableLink(_url, 'LR_PRESET_2.dng');

                              },
                              child: Text('DOWNLOAD DNG',
                                style: GoogleFonts.ubuntu(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),),
                            ),
                          ),
                        ],
                      ),
                    ),



                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bhavin ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Futura',
                            fontSize: 25),
                      ),
                      IconButton(
                          onPressed: () {
                            launchUrl(Uri.parse("tel://8866308736"));
                          },
                          icon: FaIcon(FontAwesomeIcons.phone,)),
                      IconButton(
                          onPressed: () {
                           // _launchInstagram();
                            _launchSocialMediaAppIfInstalled(
                              url: 'https://www.instagram.com/expensive_editz', // Twitter
                            );
                          },
                          icon: FaIcon(FontAwesomeIcons.instagram)),
                      IconButton(
                          onPressed: () {
                            _launchSocialMediaAppIfInstalled(
                              url: 'https://twitter.com/expensive_editz', // Twitter
                            );
                          },
                          icon: FaIcon(FontAwesomeIcons.twitter)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('© 2023 Expensive Editz - Powered by Bhavin Parmar'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_launchInstagram() async {
  var nativeUrl = "instagram://user?username=expensive_editz";
  var webUrl = "https://www.instagram.com/expensive_editz";

  print(nativeUrl);
  print(webUrl);

  try {
    await launchUrlString(nativeUrl, mode: LaunchMode.externalApplication);
  } catch (e) {
    print(e);
    await launchUrlString(webUrl, mode: LaunchMode.platformDefault);
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}


Future<void> _launchSocialMediaAppIfInstalled({
  required String url,
}) async {
  try {
    bool launched = await launch(url, forceSafariVC: false); // Launch the app if installed!

    if (!launched) {
      launch(url); // Launch web view if app is not installed!
    }
  } catch (e) {
    launch(url); // Launch web view if app is not installed!
  }
}




void downloadFileFromDownloadableLink(String url, String fileName) {
  AnchorElement anchorElement = AnchorElement(href: url);
  anchorElement.download = "F";
  anchorElement.click();
}