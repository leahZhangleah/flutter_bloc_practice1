import 'dart:async';

class CounterBloc{
  int count;
  StreamController<Action> _actionController;
  StreamController<int> _numController;

  Stream<int> get num => _numController.stream;
  Sink<Action> get _action => _actionController.sink;

  CounterBloc(){
    count = 0;
    //_numController.sink.add(count);
    _actionController = StreamController();
    _numController = StreamController.broadcast();
    _actionController.stream.listen(addNum);
  }

  void getPersonalInfo(){

  }

  void addNum(Action event) {
    if(event is Add){
        _numController.sink.add(count++);
    }else{
        _numController.sink.add(count--);
    }

  }

  void addBtn(){
    _action.add(new Add());
  }

  void reduceBtn(){
     _action.add(new Reduce());
  }

  void dispose(){
    _actionController.close();
    _numController.close();
  }




}

class Add extends Action{}
class Reduce extends Action{}
abstract class Action{}