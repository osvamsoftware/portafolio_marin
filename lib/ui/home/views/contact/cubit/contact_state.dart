// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'contact_cubit.dart';

enum MessageState { initial, sending, sended, error }

class ContactState extends Equatable {
  final bool animated;
  final MessageState messageState;
  const ContactState(this.animated, this.messageState);

  @override
  List<Object> get props => [animated, messageState];

  ContactState copyWith({bool? animated, MessageState? messageState}) {
    return ContactState(animated ?? this.animated, messageState ?? this.messageState);
  }
}
