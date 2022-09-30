import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cupom_event.dart';
part 'cupom_state.dart';

class CupomBloc extends Bloc<CupomEvent, CupomState> {
  CupomBloc() : super(CupomInitial()) {
    on<CupomEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
