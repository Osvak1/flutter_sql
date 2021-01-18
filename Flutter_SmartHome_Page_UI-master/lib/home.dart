import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/detailpage.dart';
import 'package:kf_drawer/kf_drawer.dart';

class Home extends KFDrawerContent {
  Home({
    Key key,
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    child: Material(
                      shadowColor: Colors.transparent,
                      color: Colors.transparent,
                      child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                        onPressed: widget.onMenuPressed,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage('images/descarga.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(width: 15)
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Benvingut", style: TextStyle(fontSize: 17)),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text("Joan Vizcaino",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15),
                    Text(
                      "CD Projekt vuelve a hacerlo, a ir más lejos que nadie y a sentar las bases de la excelencia para los próximos años.",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 30),
                    Text("Fotos",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                    SizedBox(height: 15),
                    Container(
                        height: 300,
                        width: double.infinity,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            listItem('images/cyber.jpg'),
                            new SizedBox(width: 15),
                            listItem('images/cyber2.jpg'),
                            new SizedBox(width: 15),
                            listItem('images/cyber3.jpg'),
                          ],
                        )),
                    SizedBox(height: 15),
                    Text("Stats",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Color.fromRGBO(31, 58, 47, 1.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    listItemStats('images/creative.png', "Mantis", false),
                    listItemStats('images/air-conditioner.png', "Hack", true),
                    listItemStats(
                        'images/washing-machine.png', "Weapons", false)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listItem(String imgpath) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(
                  imgPath: imgpath,
                )));
      },
      child: Container(
        width: 325,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(image: AssetImage(imgpath), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget listItemStats(String imgpath, String name, bool value) {
    return Container(
      width: 110,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color:
              value == true ? Colors.white : Color.fromRGBO(75, 97, 88, 1.0)),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Image(
              image: AssetImage(imgpath),
              width: 45,
              height: 45,
              color: value == true ? Colors.black : Colors.white),
          SizedBox(height: 15),
          Text(name,
              style: TextStyle(
                  fontSize: 13,
                  color: value == true ? Colors.black : Colors.white)),
          SizedBox(height: 5),
          Switch(
            value: value,
            onChanged: (newVal) {
              setState(() {
                value = newVal;
                print(newVal);
              });
            },
            activeColor: Colors.green,
          )
        ],
      ),
    );
  }
}
