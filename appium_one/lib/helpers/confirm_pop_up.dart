import 'package:flutter/material.dart';

Future<void> showSubmitConfirmationDialog({
  required BuildContext context,
  required VoidCallback onConfirm,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        elevation: 10, // Shadow
        backgroundColor: Colors.white,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.blue.shade50, Colors.white], // Gradient background
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Fit content
            children: [

              Icon(
                Icons.info_outline,
                size: 50,
                color: Colors.orange.shade600,
              ),
              SizedBox(height: 16),


              Text(
                "Confirm Submission",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
              SizedBox(height: 10),


              Text(
                "Once submitted, you will not be able to make any changes.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      backgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ),

                  // Submit Button
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      onConfirm();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}


//how to use call example


// showSubmitConfirmationDialog(
//   context: context,
//   onConfirm: () {
//   Fluttertoast.showToast(msg: "Please Wait");
//   postApplication();
//   setState(() {
//   isLoading = true;
//     });
//    },
//   );