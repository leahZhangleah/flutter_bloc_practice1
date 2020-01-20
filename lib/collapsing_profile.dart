import 'package:flutter/material.dart';
import 'sliver_container.dart';
class CollapsingProfile extends StatefulWidget{
  final String title;

  CollapsingProfile({this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CollapsingProfileState();
  }

}

class CollapsingProfileState extends State<CollapsingProfile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Builder(
          builder: (context){
            return SliverContainer(
              floatingActionButton: new Container(
                height: 60.0,
                width: 60.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: new DecorationImage(
                      image: new ExactAssetImage("assets/images/light_house.jpg"),
                      fit: BoxFit.cover
                  ),
                  border: Border.all(color: Colors.black,width: 2.0)
                ),
              ),
              expandeHeight: 256.0,
              slivers: <Widget>[
                new SliverAppBar(
                  iconTheme: IconThemeData(color: Colors.white),
                  expandedHeight: 256.0,
                  pinned: true,
                  flexibleSpace: new FlexibleSpaceBar(
                    title: Text("Developer Libs",style:TextStyle(color: Colors.white)),
                    background: Image.asset("assets/images/light_house.jpg",fit: BoxFit.fill,),
                  ),
                ),
                new SliverList(
                    delegate: new SliverChildListDelegate(
                      List.generate(30, (index){
                        return new ListTile(title: Text("Item $index"),);
                      })
                    ),
                )
              ],
            );
          }),
    );
  }
}