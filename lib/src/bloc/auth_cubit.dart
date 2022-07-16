import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workbot_servicios/src/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepositoryBase _authRepository;
  late StreamSubscription _authSubscription;
  AuthCubit(this._authRepository) : super(AuthInitialState());

  Future<void> init() async {
    _authSubscription =
        _authRepository.onAuthStateChange.listen(_authStateChange);
  }

  Future<void> reset() async => emit(AuthInitialState());

  void _authStateChange(AuthUser? user) =>
      user == null ? emit(AuthSignedOut()) : emit(AuthSingedIn(user));

  Future<void> sigInAnonymously() =>
      _signIn(_authRepository.signInAnonymously());

  Future<void> signInWithGoogle() =>
      _signIn(_authRepository.signInWithGoogle());

  Future<void> signInWithFacebook() =>
      _signIn(_authRepository.signInWithFacebook());

  Future<void> createUserWithEmailAndPassword(String email, String password) =>
      _signIn(_authRepository.createUserWithEmailandPassword(email, password));

  Future<void> signInWithEmailAndPassword(String email, String password) =>
      _signIn(_authRepository.signInWithEmailandPassword(email, password));

  Future<void> _signIn(Future<AuthUser?> auxUser) async {
    try {
      emit(AuthSigninIn());
      final user = await auxUser;
      if (user == null) {
        emit(AuthError('Erro desconocido, intente mas tarde'));
      } else {
        emit(AuthSingedIn(user));
      }
    } catch (e) {
      emit(AuthError('Error: ${e.toString()}'));
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(AuthSignedOut());
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthSignedOut extends AuthState {}

class AuthSigninIn extends AuthState {}

class AuthError extends AuthState {
  final String mesage;

  AuthError(this.mesage);
  @override
  List<Object?> get props => [mesage];
}

class AuthSingedIn extends AuthState {
  final AuthUser user;

  AuthSingedIn(this.user);
  @override
  List<Object?> get props => [user];
}
