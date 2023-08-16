import 'package:flutter/material.dart';

class DialogUtil {
  //! Dialog with header and default
  static normalDialog({
    required BuildContext context,
    String? dialogText,
    String? dialogHeader,
    String? btnText,
    VoidCallback? onTap,
  }) {
    showDialog(
      //? Can't exit the dialog by pressing anywhere on the screen
      barrierDismissible: false,
      //? Barrier Color is for unfocused bg color
      // barrierColor: Colors.grey,
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(dialogHeader ?? 'Dialog Header'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.all(8),
        children: [
          SimpleDialogOption(
            child: Column(
              children: [
                Text(dialogText ?? 'Default Text'),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: onTap,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      color: Colors.deepOrangeAccent,
                      child: Text(
                        btnText ?? 'Button',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

//! custom Dailog
  static customDialog({
    required BuildContext context,
    String? dialogText,
    String? btnText,
    Color? btnColor,
    Color? btnTextColor,
    VoidCallback? onTap,
  }) {
    showDialog(
      // Can't exit the dialog by pressing anywhere on the screen
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(dialogText ?? 'Custom dialog text'),
              const SizedBox(height: 40),
              InkWell(
                onTap: onTap,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    color: btnColor ?? Colors.grey,
                    child: Text(
                      btnText ?? 'Button',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //! Alert Dialog

  static alertDialog({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(radius: 30),
            SizedBox(height: 30),
            Text('This is supposed to be a text'),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: () {},
            child: const Text('Yes'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('No'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('No'),
          ),
        ],
      ),
    );
  }

  static modalSheet({required BuildContext context, Widget? child}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
            // height: 500,
            width: double.maxFinite,
            // color: Colors.deepPurpleAccent,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: child,
            ));
      },
    );
  }
}
