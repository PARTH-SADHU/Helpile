import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super( HomeBloc() as HomeState) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
