// import 'dart:convert';
// import 'package:contacts_01/ui/new_note_page.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:contacts_01/models/note.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Notes App',
//       theme: ThemeData(
//         primarySwatch: Colors.amber,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const MyHomePage(title: 'Notes App'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<NoteModel> notes = <NoteModel>[];

//   late SharedPreferences sharedPreferences;

//   void removeNote(NoteModel note) {
//     notes.remove(note);
//     saveData();
//     setState(() {});
//     saveData();
//   }

//   Widget noteItemView(NoteModel note) {
//     return Card(
//       child: InkWell(
//         onTap: () {
//           openNewNote(noteModel: note);
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   note.content,
//                   maxLines: 1,
//                   softWrap: true,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(fontSize: 20),
//                 ),
//               ),
//               Expanded(
//                 child: Container(),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.remove_circle_outline),
//                 onPressed: () => removeNote(note),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildNotesList() {
//     return ListView.builder(
//       itemBuilder: (_context, index) => noteItemView(notes[index]),
//       itemCount: notes.length,
//     );
//   }

//   void insertNewNote() {
//     notes.add(NoteModel(content: 'New note '));
//     setState(() {});
//     saveData();
//   }

//   void openNewNote({NoteModel? noteModel}) {
//     NoteModel _note = noteModel ??
//         NoteModel(
//           content: 'New Note',
//           checked: false,
//         );
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => NewNotePage(_note)),
//     ).then((value) {
//       if (noteModel == null) {
//         notes.add(_note);
//         saveData();
//       }
//       saveData();

//       setState(() {});
//     });
//   }

//   @override
//   void initState() {
//     initSharedPreferences();
//     super.initState();
//   }

//   initSharedPreferences() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     loadData();

//     /// print('hello');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: buildNotesList(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: openNewNote,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   void loadData() {
//     List<String>? listString = sharedPreferences.getStringList('list');
//     if (listString != null) {
//       notes = listString
//           .map((item) => NoteModel.fromMap(json.decode(item)))
//           .toList();

//       setState(() {});
//     }
//   }

//   void saveData() {
//     List<String> stringList =
//         notes.map((item) => json.encode(item.toMap())).toList();
//     sharedPreferences.setStringList('list', stringList);
//     //print(stringList);
//   }
// }
