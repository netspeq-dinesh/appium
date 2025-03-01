// import 'package:flutter/material.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
//
// class InternetWrapper extends StatefulWidget {
//   final Widget child;
//
//   const InternetWrapper({Key? key, required this.child}) : super(key: key);
//
//   @override
//   _InternetWrapperState createState() => _InternetWrapperState();
// }
//
// class _InternetWrapperState extends State<InternetWrapper> {
//   bool _isConnected = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _checkConnectivity();
//     _listenToConnectivity();
//   }
//
//   // Initial Check for Connectivity and Internet Access
//   void _checkConnectivity() async {
//     final connectivityResult = await Connectivity().checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       setState(() {
//         _isConnected = false;
//       });
//     } else {
//       // Check actual internet connectivity
//       _isConnected = await _hasInternetAccess();
//       setState(() {});
//     }
//   }
//
//   // Listen to Changes in Connectivity
//   void _listenToConnectivity() {
//     Connectivity().onConnectivityChanged.listen((connectivityResult) async {
//       if (connectivityResult == ConnectivityResult.none) {
//         setState(() {
//           _isConnected = false;
//         });
//       } else {
//         // Check actual internet connectivity
//         _isConnected = await _hasInternetAccess();
//         setState(() {});
//       }
//     });
//   }
//
//   // Verify if the device has actual Internet Access
//   Future<bool> _hasInternetAccess() async {
//     try {
//       final response = await http.get(Uri.parse('https://www.google.com')).timeout(
//         const Duration(seconds: 5), // Timeout if the connection takes too long
//       );
//       if (response.statusCode == 200) {
//         return true; // Internet access is available
//       } else {
//         return false; // Connected but no internet
//       }
//     } catch (_) {
//       return false; // Exception indicates no internet access
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _isConnected
//         ? widget.child
//         : MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Animated WiFi Icon
//                 Icon(
//                   Icons.wifi_off,
//                   size: 100,
//                   color: Colors.blueGrey.withOpacity(0.8),
//                 ),
//                 const SizedBox(height: 20),
//
//                 // Title
//                 Text(
//                   "No Internet Connection",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blueGrey.shade800,
//                     letterSpacing: 1.2,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 10),
//
//                 // Subtitle
//                 Text(
//                   "Please check your internet connection and try again.",
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.blueGrey.shade600,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 30),
//
//                 // Retry Button
//                 // ElevatedButton(
//                 //   onPressed: _checkConnectivity,
//                 //   style: ElevatedButton.styleFrom(
//                 //     backgroundColor: Colors.blueAccent,
//                 //     padding: const EdgeInsets.symmetric(
//                 //       horizontal: 30,
//                 //       vertical: 15,
//                 //     ),
//                 //     shape: RoundedRectangleBorder(
//                 //       borderRadius: BorderRadius.circular(10),
//                 //     ),
//                 //   ),
//                 //   child: const Text(
//                 //     "Retry",
//                 //     style: TextStyle(
//                 //       fontSize: 18,
//                 //       fontWeight: FontWeight.bold,
//                 //       color: Colors.white,
//                 //     ),
//                 //   ),
//                 // ),
//
//                 const SizedBox(height: 20),
//
//                 // Loading Indicator
//                 SpinKitThreeBounce(
//                   color: Colors.blueAccent,
//                   size: 30,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// //how to use
//
// // home: InternetWrapper(
// // child: DashboardPage(), // Wrap the DashboardPage
// // ),
//
//
// //flutter pub add flutter_spinkit
// //flutter pub add connectivity_plus+