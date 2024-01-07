// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'services_cubit.dart';

class ServicesState extends Equatable {
  final double height;
  final double width;
  const ServicesState(this.height, this.width);

  @override
  List<Object> get props => [height, width];

  ServicesState copyWith({
    double? height,
    double? width,
  }) {
    return ServicesState(
      height ?? this.height,
      width ?? this.width,
    );
  }
}
