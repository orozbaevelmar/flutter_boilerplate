part of 'profile_bloc.dart';

sealed class ProfileEvent {
  const ProfileEvent();
}

class ProfileGetEvent extends ProfileEvent {}

class ProfileSetImageEvent extends ProfileEvent {
  XFile? file;
  ProfileSetImageEvent({
    required this.file,
  });
}

class ProfileSaveEvent extends ProfileEvent {
  XFile? imageFile;
  ProfileModel profileModel;
  ProfileSaveEvent({
    required this.profileModel,
    required this.imageFile,
  });
}
