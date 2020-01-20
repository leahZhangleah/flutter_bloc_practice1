import 'package:flutter/material.dart';
import 'second_page.dart';
import 'counter_bloc.dart';
import 'bloc_provider.dart';
class CounterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CounterPageState();
  }

}

class CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    CounterBloc bloc = BlocProvider.of(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("counter page"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          initialData: 0,
          stream: bloc.num,
          builder: (context,AsyncSnapshot<int> snapshot){
            if(snapshot.hasData){
              int count = snapshot.data;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text("$count"),
                  ),
                  RaisedButton(
                      child: Text("next page"),
                      onPressed: (){
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (context){
                              return SecondPage();
                            }));
                      })
                ],
              );
            }else{
              return Container(
                child: Text("page 1"),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            bloc.addBtn();
          }),
    );
  }
}