part of 'registro_bloc.dart';

@immutable
abstract class RegistroEvent {}

class PostRegistro extends RegistroEvent {
  final ModeloRegistro? model;
  PostRegistro({this.model});
}
