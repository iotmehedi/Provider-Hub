import 'package:flutter/material.dart';

void errorToast({required BuildContext context, required String msg,  Color? color, Color? iconColor, Color? headingTextColor, Color? valueTextColor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 6.0,
    backgroundColor: color ??  Colors.red[400],
    behavior: SnackBarBehavior.floating,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    content: Row(
      children: [
         Icon(
          Icons.error,
          size: 50,
          color: iconColor ?? Colors.white,
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
                  color: headingTextColor ?? Colors.white,
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
                style:  TextStyle(color: valueTextColor ?? Colors.white),
              ),
            ],
          ),
        ),
      ],
    ),
  ));
}

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
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                msg,
                overflow: TextOverflow.ellipsis,
                //textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    ),
  ));
}


