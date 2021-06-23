import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openscan/Utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';

void launchWebsite(String urlString) async {
  if (await canLaunch(urlString)) {
    await launch(urlString);
  } else {
    print("Couldn't launch the url");
  }
}

class AboutScreen extends StatelessWidget {
  static String route = "AboutScreen";
  final String youtube = "https://www.youtube.com/channel/UC7e2er7vSKvXgJFpt5xsYzA/";
  final String Podcast= "https://anchor.fm/srilluminati";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: primaryColor,
          title: RichText(
            text: TextSpan(
              text: 'About',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: primaryColor),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/scan_g.jpeg',
                    scale: 6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text: 'Japura',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                            text: 'Scanner',
                            style: TextStyle(color: secondaryColor)),
                        TextSpan(
                          text:
                              ' is an app which enables users to scan hard copies of documents and convert it into a PDF file. We don\'t add watermark or label in PDF.',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        //TODO: Content Writing
                        TextSpan(
                          text: '',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Center(
                  child: Text(
                    "More",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ContactCard(
                      name: "Youtube",
                      link: youtube,
                      image: AssetImage('assets/utube.jpeg'),
                    ),
                    ContactCard(
                      name: "Podcast",
                      link: Podcast,
                      image: AssetImage('assets/podcast.jpeg'),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Center(
                  child: Text(
                    "No ads. We don't collect any data.\nBest of luck.\nThank you!",
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String link;
  final String name;
  final AssetImage image;

  const ContactCard({Key key, this.link, this.name, this.image});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => launchWebsite(link),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        elevation: 10.0,
        child: Container(
          margin: EdgeInsets.all(8.0),
          height: size.width * 0.4,
          width: size.width * 0.35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: secondaryColor,
                radius: size.width * 0.13,
                backgroundImage: image,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                'Tap for more',
                style: TextStyle(color: Colors.grey[700], fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
