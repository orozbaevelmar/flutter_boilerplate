// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState {
  ProfileModel? profileModel;
  XFile? imageFile;
  ProfileState({
    this.profileModel,
    this.imageFile,
  });

  ProfileState copyWith({
    ProfileModel? profileModel,
    XFile? imageFile,
  }) {
    return ProfileState(
      profileModel: profileModel ?? this.profileModel,
      imageFile: imageFile,
    );
  }
}
