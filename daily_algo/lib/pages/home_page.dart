import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // brightness: Brightness.dark,
        // textTheme: GoogleFonts.poppinsTextTheme(Typography.whiteCupertino),
      ),
      title: "Daily Algo",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Daily Algo",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 1,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(10),
                  ),
                )),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: const Icon(
        //     Icons.add,
        //   ),
        // ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 102, 132, 156),
                ),
                child: Text(
                  "Daily Algo",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: const Text("Home"),
                leading: const Icon(Icons.home),
                onTap: () {},
              ),
              ListTile(
                title: const Text("About"),
                leading: const Icon(Icons.info),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Contact"),
                leading: const Icon(Icons.contact_mail),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Settings"),
                leading: const Icon(Icons.settings),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Log out"),
                leading: const Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text('Hello World!!'),
        ),
      ),
    );
  }
}
