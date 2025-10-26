import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

    final GoogleSignIn _googleSignIn = GoogleSignIn.instance;


  Stream<User?> get user => _auth.authStateChanges();

  Future<User?> signInWithGoogle() async {
    await _googleSignIn.initialize(
      serverClientId:
      '1052065410624-4gdov1il5jiq7lnd96bqd6fhtb8tfnt4.apps.googleusercontent.com',
    );

    try {
      // Mở popup đăng nhập Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate();

      if (googleUser == null) return null; // Người dùng hủy đăng nhập

      // Lấy authentication
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      // Tạo credential với Firebase
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Đăng nhập vào Firebase
      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print('Lỗi đăng nhập Google: $e');
      return null;
    }
  }

  // Đăng xuất
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // Lấy thông tin user hiện tại
  User? getCurrentUser() => _auth.currentUser;
}
