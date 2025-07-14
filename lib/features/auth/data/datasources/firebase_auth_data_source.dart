import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_data_source.g.dart'; // Run `build_runner` to generate this

class AuthDataSource {
  final FirebaseAuth _firebaseAuth;
  AuthDataSource(this._firebaseAuth);

  // Stream to listen to auth state changes
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Sign In with Email
  Future<void> signInWithEmail(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // Sign Up with Email
  Future<void> signUpWithEmail(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // Sign Out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

// Riverpod provider to make FirebaseAuth instance available
@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

// Riverpod provider for our AuthDataSource
@riverpod
AuthDataSource authDataSource(AuthDataSourceRef ref) {
  return AuthDataSource(ref.watch(firebaseAuthProvider));
}

// Riverpod provider to expose the auth state stream
@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(authDataSourceProvider).authStateChanges;
}
