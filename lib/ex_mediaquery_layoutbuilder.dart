// import 'package:flutter/material.dart';
//
// main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: TestMediaQueryWidget(),
//       ),
//     );
//   }
// }
//
// class TestMediaQueryWidget extends StatelessWidget {
//   const TestMediaQueryWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final MediaQueryData data = MediaQuery.of(context);
//     return Stack(children: [
//       const LayoutBuilderIndicator(color: Colors.deepPurple),
//       const DeviceScreenIndicator(),
//       Opacity(
//           opacity: 0.25, child: HorizontalSizeIndicator(mediaQueryData: data)),
//       Opacity(opacity: 0.25, child: VerticalSizeIndicator(mediaQueryData: data))
//     ]);
//   }
// }
//
// class LayoutBuilderIndicator extends StatelessWidget {
//   const LayoutBuilderIndicator({super.key, required this.color});
//
//   final Color color;
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       left: 100,
//       right: 170,
//       top: 100,
//       bottom: 200,
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: color, width: 10),
//         ),
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             var maxWidth = constraints.maxWidth;
//             var maxHeight = constraints.maxHeight;
//             return Stack(
//               children: [
//                 const ChildLayoutBuilderIndicator(color: Colors.orange,),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Text(
//                       'LayoutBuilder',
//                       style: TextStyle(color: color, fontSize: 10),
//                     ),
//                   ),
//                 ),
//                 VerticalSizeConstraintsIndicator(
//                     color: color, maxWidth: maxWidth, maxHeight: maxHeight),
//                 HorizontalSizeConstraintsIndicator(maxWidth: maxWidth, maxHeight: maxHeight, color: color)
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// class ChildLayoutBuilderIndicator extends StatelessWidget {
//
//   final Color color;
//   const ChildLayoutBuilderIndicator({Key? key, required this.color }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//         left: 130,
//         right: 130,
//         top: 50,
//         bottom: 50,
//         child: Container(
//             decoration: BoxDecoration(
//                 border: Border.all(
//                     color: color,
//                     width: 10
//                 )
//             ),
//             child: LayoutBuilder(
//                 builder: (context, constraints) {
//
//                   var childMaxWidth = constraints.maxWidth;
//                   var childMaxHeight = constraints.maxHeight;
//
//                   return Stack(
//                       children: [
//                         Align(
//                             alignment: Alignment.topLeft,
//                             child: Padding(
//                               padding: const EdgeInsets.all(20.0),
//                               child: Text('Child LayoutBuilder', style: TextStyle(color: color, fontSize: 20)),
//                             )
//                         ),
//                         VerticalSizeConstraintsIndicator(maxWidth: childMaxWidth, maxHeight: childMaxHeight, color: color),
//                         HorizontalSizeConstraintsIndicator(maxWidth: childMaxWidth, maxHeight: childMaxHeight, color: color)
//                       ]
//                   );
//                 }
//             )
//         )
//     );
//   }
// }
// class DeviceScreenIndicator extends StatelessWidget {
//   const DeviceScreenIndicator({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     DeviceType deviceBreakpoint = Utils.getDeviceType(context);
//     DeviceDescription deviceDesc =
//     Utils.deviceTypes[deviceBreakpoint] as DeviceDescription;
//     IconData icon = deviceDesc.icon;
//     String label = deviceDesc.label;
//
//     return Align(
//       alignment: Alignment.topLeft,
//       child: Container(
//         margin: const EdgeInsets.all(50),
//         child: Column(mainAxisSize: MainAxisSize.min, children: [
//           Icon(icon, color: Colors.blueAccent, size: 70),
//           const SizedBox(height: 20),
//           Text(label,
//               style: const TextStyle(color: Colors.blueAccent, fontSize: 10)),
//         ]),
//       ),
//     );
//   }
// }
//
// class HorizontalSizeConstraintsIndicator extends StatelessWidget {
//   const HorizontalSizeConstraintsIndicator(
//       {super.key,
//         required this.maxWidth,
//         required this.maxHeight,
//         required this.color});
//
//   final Color color;
//   final double maxWidth;
//   final double maxHeight;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           top: maxHeight / 2,
//           left: -6,
//           child: Icon(
//             Icons.west,
//             color: color,
//             size: 80,
//           ),
//         ),
//         Positioned(
//           top: maxHeight / 2,
//           right: -6,
//           child: Icon(
//             Icons.east,
//             color: color,
//             size: 80,
//           ),
//         ),
//         Positioned(
//           top: (maxHeight / 2) + 36,
//           left: 0,
//           right: 0,
//           child: Container(
//             height: 8,
//             color: color,
//             margin: const EdgeInsets.only(left: 12, right: 12),
//           ),
//         ),
//         Align(
//             alignment: Alignment.centerLeft,
//             child: Container(
//                 margin: const EdgeInsets.only(left: 50, bottom: 3),
//                 child: Text(
//                   '${maxWidth.floor()}',
//                   style: TextStyle(fontSize: 25, color: color),
//                 )))
//       ],
//     );
//   }
// }
//
// class VerticalSizeConstraintsIndicator extends StatelessWidget {
//   const VerticalSizeConstraintsIndicator(
//       {super.key,
//         required this.color,
//         required this.maxWidth,
//         required this.maxHeight});
//
//   final Color color;
//   final double maxWidth;
//   final double maxHeight;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       Positioned(
//           top: -6, right: 24, child: Icon(Icons.north, color: color, size: 80)),
//       Positioned(
//           bottom: -6,
//           right: 24,
//           child: Icon(Icons.south, color: color, size: 80)),
//       Align(
//         alignment: Alignment.centerRight,
//         child: Container(
//             width: 8,
//             color: color,
//             margin: const EdgeInsets.only(top: 12, bottom: 12, right: 60)),
//       ),
//       Align(
//           alignment: Alignment.topRight,
//           child: Transform.rotate(
//               angle: -1.55,
//               child: Container(
//                   margin: const EdgeInsets.only(bottom: 30, right: 100),
//                   child: Text('${maxHeight.floor()}',
//                       style: TextStyle(fontSize: 25, color: color)))))
//     ]);
//   }
// }
//
// class HorizontalSizeIndicator extends StatelessWidget {
//   const HorizontalSizeIndicator({super.key, required this.mediaQueryData});
//
//   final MediaQueryData mediaQueryData;
//
//   @override
//   Widget build(BuildContext context) {
//     var height = mediaQueryData.size.height;
//     var width = mediaQueryData.size.width;
//     return Stack(
//       children: [
//         Positioned(
//           top: height / 2,
//           left: -6,
//           child: const Icon(
//             Icons.west,
//             color: Colors.green,
//             size: 80,
//           ),
//         ),
//         Positioned(
//           top: height / 2,
//           right: -6,
//           child: const Icon(
//             Icons.east,
//             color: Colors.green,
//             size: 80,
//           ),
//         ),
//         Positioned(
//           top: (height / 2) + 36,
//           left: 0,
//           right: 0,
//           child: Container(
//             height: 8,
//             color: Colors.green,
//             margin: const EdgeInsets.only(left: 12, right: 12),
//           ),
//         ),
//         Align(
//             alignment: Alignment.centerLeft,
//             child: Container(
//                 margin: const EdgeInsets.only(left: 50, bottom: 3),
//                 child: Text(
//                   '${width.floor()}',
//                   style: const TextStyle(fontSize: 60, color: Colors.green),
//                 )))
//       ],
//     );
//   }
// }
//
// class VerticalSizeIndicator extends StatelessWidget {
//   const VerticalSizeIndicator({super.key, required this.mediaQueryData});
//
//   final MediaQueryData mediaQueryData;
//
//   @override
//   Widget build(BuildContext context) {
//     var height = mediaQueryData.size.height;
//
//     return Stack(children: [
//       const Positioned(
//           top: -6,
//           right: 24,
//           child: Icon(Icons.north, color: Colors.red, size: 80)),
//       const Positioned(
//           bottom: -6,
//           right: 24,
//           child: Icon(Icons.south, color: Colors.red, size: 80)),
//       Align(
//         alignment: Alignment.centerRight,
//         child: Container(
//             width: 8,
//             color: Colors.red,
//             margin: const EdgeInsets.only(top: 12, bottom: 12, right: 60)),
//       ),
//       Align(
//           alignment: Alignment.topRight,
//           child: Transform.rotate(
//               angle: -1.55,
//               child: Container(
//                   margin: const EdgeInsets.only(bottom: 30, right: 100),
//                   child: Text('${height.floor()}',
//                       style:
//                       const TextStyle(fontSize: 60, color: Colors.red)))))
//     ]);
//   }
// }
//
// enum DeviceType {
//   mobile,
//   tablet,
//   laptop,
// }
//
// class DeviceDescription {
//   final IconData icon;
//   final String label;
//
//   DeviceDescription({required this.icon, required this.label});
// }
//
// class Utils {
// // Step #1: add the device screen size breakpoints
//   static const int mobileMaxWidth = 480;
//   static const int tabletMaxWidth = 768;
//   static const int laptopMaxWidth = 1024;
//
//   static Map<DeviceType, DeviceDescription> deviceTypes = {
//     DeviceType.mobile:
//     DeviceDescription(icon: Icons.phone_iphone, label: 'Mobile'),
//     DeviceType.tablet: DeviceDescription(icon: Icons.tablet, label: 'Tablet'),
//     DeviceType.laptop: DeviceDescription(icon: Icons.laptop, label: 'Laptop'),
//   };
//
//   static DeviceType getDeviceType(BuildContext context) {
//     MediaQueryData data = MediaQuery.of(context);
//     DeviceType bk = DeviceType.mobile;
//     if (data.size.width < Utils.tabletMaxWidth) {
//       bk = DeviceType.mobile;
//     } else if (data.size.width > Utils.mobileMaxWidth &&
//         data.size.width <= Utils.tabletMaxWidth) {
//       bk = DeviceType.tablet;
//     } else if (data.size.width > Utils.tabletMaxWidth) {
//       bk = DeviceType.laptop;
//     }
//     return bk;
//   }
// }
