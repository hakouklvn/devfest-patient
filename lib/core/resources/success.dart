import 'package:equatable/equatable.dart';

abstract class Success extends Equatable {
  @override
  List<Object?> get props => [];
}

class GoodResponse extends Success {
  final String msg;
  GoodResponse(this.msg);
}
