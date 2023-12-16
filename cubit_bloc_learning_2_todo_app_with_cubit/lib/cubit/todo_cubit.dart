import 'package:cubit_bloc_learning_2_todo_app_with_cubit/models/todo_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//i have to specify what state my cubit would be
class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError('Title cannot be empty');
      return;
    }
    final todo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );

    state.add(todo);

    emit([
      ...state
    ]); //we have to do this because without the 3 dot emit will think that state has only one element
    //we can also write emit([...state,todo]), now we don't have to write state.add(todo).because we are telling that  it is a new list and also adding this todo
  }

  //for keeping track of block.will help a lot in debugging
  @override
  void onChange(Change<List<Todo>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

//to handle error more precisely
  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
  }
}
