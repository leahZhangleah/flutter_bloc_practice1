import 'package:flutter/widgets.dart';
import 'counter_bloc.dart';

class BlocProvider extends InheritedWidget {
  final CounterBloc counterBloc;

  BlocProvider({
    Key key,
    CounterBloc counterBloc,
    Widget child,
  })  : counterBloc = counterBloc ?? CounterBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CounterBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
          .counterBloc;
}

class BaseProvider extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BaseProviderState();
  }

}

class BaseProviderState extends State<BaseProvider> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
