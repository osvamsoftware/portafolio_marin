// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'skills_row_cubit.dart';

class SkillsRowState extends Equatable {
  final bool animated;
  const SkillsRowState(this.animated);

  @override
  List<Object> get props => [animated];

  SkillsRowState copyWith({
    bool? animated,
  }) {
    return SkillsRowState(
      animated ?? this.animated,
    );
  }
}
