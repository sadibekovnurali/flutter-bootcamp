import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_cubit_app/data.dart';
import 'package:http_cubit_app/data_model.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _data = Data();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _data.getPosts());
}