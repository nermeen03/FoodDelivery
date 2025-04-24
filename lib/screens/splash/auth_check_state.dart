part of 'auth_check_cubit.dart';

@immutable
sealed class AuthCheckState {}

final class AuthCheckInitial extends AuthCheckState {}
final class Authenticated extends AuthCheckState {}
final class UnAuthenticated extends AuthCheckState {}
