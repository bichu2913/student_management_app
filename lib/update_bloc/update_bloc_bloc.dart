import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_appdetail/model/database_model.dart';
import '../model/dbfunction.dart';
part 'update_bloc_event.dart';
part 'update_bloc_state.dart';

class UpdateBlocBloc extends Bloc<UpdateBlocEvent, UpdateBlocState> {
  UpdateBlocBloc() : super(UpdateBlocInitial()) {
    on<DetalisShow>((event, emit) {
      List<StudentModel>? value = model.values.toList();
      return emit(UpdateBlocState(values: value, image: null, isNull: false));
    });
    on<UpdateCameraImage>((event, emit) async {
      XFile? result = await takePhoto(ImageSource.camera);
      List<StudentModel>? value = state.values;
      return emit(UpdateBlocState(values: value, image: result, isNull: false));
    });
    on<UpdateGalleryImage>((event, emit) async {
      XFile? result = await takePhoto(ImageSource.gallery);
      List<StudentModel>? value = state.values;
      return emit(UpdateBlocState(values: value, image: result, isNull: false));
    });

    // on<UpdateCameraImage>((event, emit) {});
  }
}

Future<XFile?> takePhoto(ImageSource src) async {
  XFile? pickedFile = await ImagePicker().pickImage(source: src);
  XFile? imagefile = pickedFile;
  return imagefile;
}
