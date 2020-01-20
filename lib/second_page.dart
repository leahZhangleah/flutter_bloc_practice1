import 'package:flutter/material.dart';
import 'counter_bloc.dart';
import 'bloc_provider.dart';
class SecondPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SecondPageState();
  }

}

class SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    CounterBloc bloc = BlocProvider.of(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("second page"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        initialData: 0,
        stream: bloc.num,
          builder: (context,AsyncSnapshot<int> snapshot){
            if(snapshot.hasData){
              int count = snapshot.data;
              return Center(
                child: Text("$count"),
              );
            }
            else{
              return Container(
                child: Text("page 2"),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            bloc.reduceBtn();
          }),
    );
  }
}