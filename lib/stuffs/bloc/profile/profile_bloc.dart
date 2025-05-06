import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/stuffs/constants/constants.dart';
import 'package:flutter_boilerplate/stuffs/model/profile.dart';
import 'package:flutter_boilerplate/stuffs/repository/profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late ProfileRepository repository;
  ProfileBloc() : super(ProfileInitial()) {
    repository = ProfileRepository();
    on<ProfileGetEvent>(_getUser);
    on<ProfileSaveEvent>(_save);
    on<ProfileChangeImageEvent>(_changeImage);
  }

  _changeImage(ProfileChangeImageEvent event, emit) async {
    emit(ProfileInitial());
    final response = await repository.changeImage(event.imagePath);
    response.fold(
      (l) => {
        MToast().showRed(l),
      },
      (r) => {
        emit(ProfileLoaded().copyWith(profileModel: r)),
        MToast().showRed('Ваши данные успешно изменены'),
      },
    );
  }

  _save(ProfileSaveEvent event, emit) async {
    emit(ProfileInitial());

    final response = await repository.saveUser(event.profileModel);
    response.fold(
      (l) => {
        MToast().showRed(l),
        emit(
          ProfileLoaded().copyWith(profileModel: event.oldModel),
        ),
      },
      (r) => {
        emit(
          ProfileLoaded().copyWith(profileModel: r),
        ),
        MToast().showRed('Ваши данные успешно изменены'),
      },
    );
  }

  _getUser(ProfileGetEvent event, emit) async {
    var result = await repository.getUser();
    if (result is ProfileModel) {
      emit(ProfileLoaded().copyWith(profileModel: result));
    } else {
      emit(ProfileError(message: 'Не удалось загрузить профиль'));
    }
  }
}
