
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomePageWidget extends StatefulWidget {
//   const HomePageWidget({Key? key}) : super(key: key);

//   @override
//   _HomePageWidgetState createState() => _HomePageWidgetState();
// }

// class _HomePageWidgetState extends State<HomePageWidget> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 64, 186, 235),
//         automaticallyImplyLeading: false,
//         title: Text(
//           'Page Title',
//           style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 22),
//               ),
        
//         actions: [],
//         centerTitle: false,
//         elevation: 2,
//       ),
//       backgroundColor: Colors.blue,
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * 1,
//             decoration: BoxDecoration(
//               color: Color(0xFFEEEEEE),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.25,
//                   decoration: BoxDecoration(
//                     color: Color(0xFFEEEEEE),
//                   ),
//                   child: Align(
//                     alignment: AlignmentDirectional(0, 0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Align(
//                           alignment: AlignmentDirectional(0.1, 0),
//                           child: Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(39, 39, 39, 39),
//                             child: Container(
//                               width: 100,
//                               height: 100,
//                               decoration: BoxDecoration(
//                                 color: Color(0xFFEEEEEE),
//                               ),
//                               child: Align(
//                                 alignment: AlignmentDirectional(-0.05, 0),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(45),
//                                   child: Image.network(
//                                     'https://picsum.photos/seed/973/600',
//                                     width: 100,
//                                     height: 100,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: AlignmentDirectional(0, 0),
//                           child: Padding(
//                             padding:
//                                 EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
//                             child: Container(
//                               width: 100,
//                               height: 100,
//                               decoration: BoxDecoration(
//                                 color: Color(0xFFEEEEEE),
//                               ),
//                               child: ListView(
//                                 padding: EdgeInsets.zero,
//                                 scrollDirection: Axis.vertical,
//                                 children: [
//                                   Text(
//                                     'Hello World',
//                                     style: TextStyle(
//                                                       fontSize: 15,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     )
//                                   ),
//                                   Text(
//                                     'Hello World',
//                                     style:
//                                         TextStyle(
//                                                       fontSize: 15,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     )
//                                   ),
//                                   Text(
//                                     'Hello World',
//                                     style: TextStyle(
//                                                       fontSize: 15,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     )
//                                   ),
//                                   Text(
//                                     'Hello World',
//                                     style: TextStyle(
//                                                       fontSize: 15,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     )
//                                   ),
//                                   Text(
//                                     'Hello World',
//                                     style: TextStyle(
//                                                       fontSize: 15,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     )
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 340,
//                   height: 41,
//                   decoration: BoxDecoration(
//                     color: Color(0xFFEEEEEE),
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       print('Button pressed ...');
//                     },

//                     child: const Text('Ver comentarios'),
                    
//                   ),
//                 ),
//               ],
//             ),
//           ),
        
        
//         ),
//       ),
//     );
//   }
// }
