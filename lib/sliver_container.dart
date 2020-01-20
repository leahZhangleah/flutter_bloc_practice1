import 'package:flutter/material.dart';
class SliverContainer extends StatefulWidget{
  final List<Widget> slivers;
  final Widget floatingActionButton;
  final double expandeHeight,marginRight,topScalingEdge;

  SliverContainer({@required this.slivers, @required
  this.floatingActionButton,
    this.expandeHeight = 256.0,
    this.marginRight = 16.0,
    this.topScalingEdge = 96.0});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SliverFabState();
  }

}

class SliverFabState extends State<SliverContainer> {
  ScrollController scrollController;
  double scale = 1.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener(() => setState(() {
      var offset = scrollController.offset;
      print("collapsing profile, scrollcontroller offset: $offset");
      print("collapsing profile, the scale is $scale");
    }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        new CustomScrollView(
          controller: scrollController,
          slivers: widget.slivers,
        ),
       _buildFab()
      ],
    );
  }

  Widget _buildFab() {
    final topMarginAdjustVal = Theme.of(context).platform== TargetPlatform.iOS?12.0:-4.0;
    final double defaultTopMargin = widget.expandeHeight + topMarginAdjustVal;
    double top = defaultTopMargin;
    //double scale = 1.0;
    if(scrollController.hasClients){
      double offset = scrollController.offset;
      top -= offset > 0?offset:0;
      if(offset < defaultTopMargin - widget.topScalingEdge){
        scale = 1.0;
      }else if(offset < defaultTopMargin - widget.topScalingEdge /2){
        scale = (defaultTopMargin - widget.topScalingEdge/2 - offset)/(widget.topScalingEdge/2);
      }else{
        scale = 0.0;
      };
    }

    return new Positioned(
      top: top,
      right: widget.marginRight,
      child: new Transform(
          transform: new Matrix4.identity()..scale(scale,scale),
          alignment: Alignment.center,
          child: widget.floatingActionButton,
      ),
    );
  }
}
























