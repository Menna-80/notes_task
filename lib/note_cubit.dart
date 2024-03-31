import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/note_model.dart';

class NoteCubit extends Cubit<List<Note>>{
  NoteCubit():super([]);


  void AddNote(Note note){
    state.add(note);
    emit(List.from(state));
  }
}