// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  ProfileModel? profileModel;

  ProfileLoaded({
    this.profileModel,
  });

  ProfileLoaded copyWith({
    ProfileModel? profileModel,
  }) {
    return ProfileLoaded(
      profileModel: profileModel ?? this.profileModel,
    );
  }
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError({
    required this.message,
  });
}
