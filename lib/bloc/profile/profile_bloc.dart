import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/model/profile.dart';
import 'package:flutter_boilerplate/repository/profile.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late ProfileRepository repository;
  ProfileBloc() : super(ProfileState()) {
    repository = ProfileRepository();
    on<ProfileGetEvent>(_getUser);
  }

  _setImage(ProfileSetImageEvent event, emit) async {
    emit(state.copyWith(imageFile: event.file));
  }

  _save(ProfileSaveEvent event, emit) async {
    await repository.saveUser(event.profileModel, event.imageFile);
    var result = await repository.getUser();
    if (result is ProfileModel) {
      emit(state.copyWith(profileModel: result));
    }
  }

  _getUser(ProfileGetEvent event, emit) async {
    var result = await repository.getUser();
    if (result is ProfileModel) {
      emit(state.copyWith(profileModel: result));
    }
  }
}
