import 'package:flutter/material.dart';
import 'package:provider_hub/const/utils/consts/app_colors.dart';

successToast(
    {required BuildContext context, required String msg, String? title}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 6.0,
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
    content: Row(
      children: [
         Icon(
          Icons.done,
          size: 50,
          color: Colors.white,
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "Success",
                style:  TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                msg,
                overflow: TextOverflow.ellipsis,
                //textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style:  TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    ),
  ));
}

void errorToast({required BuildContext context, required String msg}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 6.0,
    backgroundColor: Colors.red[400],
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    content: Row(
      children: [
         Icon(
          Icons.error,
          size: 50,
          color: Colors.white,
        ),
        const SizedBox(width: 16),
        Flexible(
          // Wrap the Column in Flexible
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "Error",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                msg,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style:  TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    ),
  ));
}
// void errorToast2({required BuildContext context, required String msg}) {
//   ToastContext().init(context);
//   Toast.show(msg, duration: Toast.lengthLong,backgroundColor: Colors.red,textStyle: TextStyle(color: Colors.white));
// }

showLoaderDialog(BuildContext context, String message) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
         CircularProgressIndicator(backgroundColor: AppColors.appColors),
        Container(margin: EdgeInsets.only(left: 7), child: Text('$message...')),
      ],
    ),
  );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
