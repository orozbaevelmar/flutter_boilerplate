part of 'profile_bloc.dart';

sealed class ProfileEvent {
  const ProfileEvent();
}

class ProfileGetEvent extends ProfileEvent {}

class ProfileChangeImageEvent extends ProfileEvent {
  String? imagePath;
  ProfileChangeImageEvent({
    required this.imagePath,
  });
}

class ProfileSaveEvent extends ProfileEvent {
  ProfileModel profileModel;
  ProfileModel? oldModel;
  ProfileSaveEvent({
    required this.profileModel,
    required this.oldModel,
  });
}
