import 'dart:io';

import 'package:edu_corner/screen/bottombar/bottom_nav_bar.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class AuthenticationProvider extends ChangeNotifier {
  String _name = "";
  String _email = "";
  String _password = "";
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoggingIn = false;
  bool _isSignIn = false;
  bool isChecked = false;
  String _profileImageUrl = "";

  String get name => _name;
  String get email => _email;
  String get password => _password;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;
  bool get isLoggingIn => _isLoggingIn;
  bool get isSignIn => _isSignIn;
  String get profileImageUrl => _profileImageUrl;
  bool showCheckboxError = false;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setChecked(bool value) {
    isChecked = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  Future<void> uploadProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final fileName = path.basename(pickedFile.path);
      final ref = _storage.ref().child('profile_images').child(fileName);
      final uploadTask = ref.putFile(File(pickedFile.path));

      final snapshot = await uploadTask.whenComplete(() {});
      final url = await snapshot.ref.getDownloadURL();

      _profileImageUrl = url;
      notifyListeners();
    }
  }

  Future<void> saveUserProfile(User user) async {
    await _firestore.collection('users').doc(user.uid).set({
      'uid': user.uid,
      'email': _email,
      'name': _name,
      'profileImageUrl': _profileImageUrl,
    }, SetOptions(merge: true));
  }

  Future<void> userSignIn(BuildContext context) async {
    _isLoggingIn = true;
    notifyListeners();

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      final userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      if (userDoc.exists) {
        _profileImageUrl = userDoc.data()?['profileImageUrl'] ?? "";
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBarScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackBar(
          backgroundColor: Color(0xff407BFF),
          content: Text(
            "User id is not registered",
            style: AppWidget.snackbarTextStyle(),
          ),
        );
      } else if (e.code == 'wrong-password') {
        SnackBar(
          backgroundColor: Color(0xff407BFF),
          content: Text(
            "Your password is wrong! Please try again",
            style: AppWidget.snackbarTextStyle(),
          ),
        );
      }
    } finally {
      _isLoggingIn = false;
      notifyListeners();
    }
  }

  Future<void> registration(BuildContext context, bool isChecked) async {
    if (_email.isEmpty || _password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xff407BFF),
          content: Text(
            "Email and Password cannot be empty",
            style: AppWidget.snackbarTextStyle(),
          ),
        ),
      );
      return;
    }

    _isSignIn = true;
    notifyListeners();

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xff407BFF),
          content: Text(
            "Registered Successfully",
            style: AppWidget.snackbarTextStyle(),
          ),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBarScreen(),
        ),
      );

      await saveUserProfile(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      String errorMessage = '';
      if (e.code == "weak-password") {
        errorMessage = "Provided password is not greater than 8 characters";
      } else if (e.code == "email-already-in-use") {
        errorMessage = "Account is already in use, Please log in";
      } else {
        errorMessage = "An error occurred: ${e.message}";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xff407BFF),
          content: Text(
            errorMessage,
            style: AppWidget.snackbarTextStyle(),
          ),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xff407BFF),
          content: Text(
            error.toString(),
            style: AppWidget.snackbarTextStyle(),
          ),
        ),
      );
    } finally {
      _isSignIn = false;
      notifyListeners();
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        print('User cancelled Google sign-in');
        return;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        final userDoc =
            await _firestore.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          _profileImageUrl = userDoc.data()?['profileImageUrl'] ?? "";
        } else {
          await saveUserProfile(user);
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavBarScreen(),
          ),
        );
      } else {
        print('User is null after sign-in');
      }
    } catch (e, stackTrace) {
      print('Error signing in with Google: $e');
      print(stackTrace);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Failed to sign in with Google. Please try again later.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }
}
