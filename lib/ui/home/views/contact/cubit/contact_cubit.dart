import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio_marin/domain/repository/contact_repository/contact_repository.dart';
import 'package:portfolio_marin/domain/sources/contact_datasource/contact_datasource.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  //this implementation is a exception and no the best practice but, in this case, i use for time reason
  final ContactRepository _contactRepository = ContactRepository(ContactDataSourceImpl());
  ContactCubit() : super(ContactState(false, MessageState.initial));

  void startAnimation() {
    emit(state.copyWith(animated: true));
  }

  void stopAnimation() {
    // for (var i in animationControllerList) {
    //   i.reset();
    // }
    emit(state.copyWith(animated: false));
  }

  sendMessage() async {
    emit(state.copyWith(messageState: MessageState.sending));
    final messageRequest = await _contactRepository.sendMessage();
    if (messageRequest == true) {
      emit(state.copyWith(messageState: MessageState.sended));
    } else {
      emit(state.copyWith(messageState: MessageState.error));
    }
  }
}
