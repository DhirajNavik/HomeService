// import 'package:fluttertoast/fluttertoast.dart';

// class CommonSnackbar {
//   String? text;
//   static bool _isToastShowing = false;

//   CommonSnackbar({this.text});


//   void showToast() {
//     if (_isToastShowing) return;

//     _isToastShowing = true;
//     Fluttertoast.showToast(
//       msg: text ?? 'Try again in some time',
//       toastLength: Toast.LENGTH_LONG,
//       timeInSecForIosWeb: 3,
//       gravity: ToastGravity.BOTTOM,
//     ).then((_) {
//       _isToastShowing = false;
//     });
//   }

//   }
