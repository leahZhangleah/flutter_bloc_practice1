import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice1/tab_screen.dart';
class CollapsingTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CollapsingTabState();
  }

}

class CollapsingTabState extends State<CollapsingTab> {
  ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    var flexibleSpaceWidget = new SliverAppBar(
      expandedHeight: 200.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text("Developer Libs",style: TextStyle(color: Colors.white,fontSize: 16.0),),
        background: Image.asset("assets/images/light_house.jpg",fit: BoxFit.fill),
      ),
      actions: <Widget>[
        new Padding(
          padding: EdgeInsets.all(5.0),
          child: _buildActions(),
        )
      ],
    );
    return Scaffold(
      body: new DefaultTabController(
          length: 3,
          child: NestedScrollView(
              controller: scrollController,
              headerSliverBuilder: (context,innerBoxIsScrolled){
                return <Widget>[
                  flexibleSpaceWidget,
                  SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(
                        TabBar(
                            labelColor: Colors.black87,
                            unselectedLabelColor: Colors.black26,
                            tabs: [
                              Tab(
                                icon: Icon(Icons.account_box),
                                text: "Detail",
                              ),
                              Tab(icon: Icon(Icons.add_location), text: "Address"),
                              Tab(icon: Icon(Icons.monetization_on), text: "Earning"),
                            ])
                      ),
                      pinned: true,)
                ];
              },
              body: new TabBarView(
                  children: <Widget>[
                    new TabScreen("Detail"),
                    new TabScreen("Address"),
                    new TabScreen("Earning"),
                  ]))),
    );
  }

  Widget _buildActions(){
    Widget profile = new GestureDetector(
      onTap: ()=>showProfile(),
      child: new Container(
        height: 30,
        width: 45,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/light_house.jpg")),
            border: Border.all(color: Colors.black,width: 2)
        ),
      ),
    );
    double scale;
    if(scrollController.hasClients){
      scale = scrollController.offset/300;
      print("The scrollcontroller offset devided by 300 is: $scale");
      scale = scale * 2;
      if(scale > 1){
        scale = 1.0;
      }
    }else{
      scale = 0.0;
    }

    return new Transform(
      transform: new Matrix4.identity()..scale(scale,scale),
      alignment: Alignment.center,
      child: profile,
    );
  }



  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener((){
      setState(() {
      });
    });
  }

  showProfile() {
    Navigator.pushNamed(context, '/profile');
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate{
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(child: _tabBar,);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent =>  _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }

}