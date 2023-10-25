import 'package:flutter/material.dart';
import 'package:flutter_application_sw2/screens/Chatpage.dart';
import 'package:flutter_application_sw2/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_sw2/screens/chatmodel.dart';

class ScreenHome extends StatefulWidget {
  final bool showSnackbar;
 const ScreenHome({super.key,required this.showSnackbar});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
    if (widget.showSnackbar) {
      Future.delayed(Duration.zero, () {
        final scaffoldMessenger = ScaffoldMessenger.of(context);
        scaffoldMessenger.showSnackBar(
          const SnackBar(
            content: Text('The Chat have deleted successfully!'),
          ),
        );
      });
    }
  }

  
  bool _isSwitched = false;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        forceMaterialTransparency: true,
        leading: SizedBox(
          height: 200,
          child: PopupMenuButton(
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            color: Colors.white,
            position: PopupMenuPosition.under,
            itemBuilder: (ctx) => [
              const PopupMenuItem(
                  height: 40,
                  child: Row(
                    children: [
                      Icon(Icons.bookmark_outline),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text('Saved Messages'),
                      ),
                    ],
                  )),
              const PopupMenuItem(
                  height: 40,
                  child: Row(
                    children: [
                      Icon(Icons.archive_outlined),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text('Archived Chats'),
                      ),
                    ],
                  )),
              const PopupMenuItem(
                  height: 40,
                  child: Row(
                    children: [
                      Icon(Icons.person_outline_outlined),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text('Contacts'),
                      ),
                    ],
                  )),
              const PopupMenuItem(
                  height: 40,
                  child: Row(
                    children: [
                      Icon(Icons.settings_outlined),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text('Settings'),
                      ),
                    ],
                  )),
              PopupMenuItem(
                  height: 40,
                  child: Row(
                    children: [
                      const Icon(Icons.dark_mode_outlined),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text('Dark Mode'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Transform.scale(
                          scale: 0.7,
                          child: Switch(
                              activeColor: Colors.black,
                              value: _isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  _isSwitched = value;
                                });
                              }),
                        ),
                      )
                    ],
                  )),
              PopupMenuItem(
                  height: 40,
                  child: Row(
                    children: [
                      const Icon(Icons.animation),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text('Animations'),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Transform.scale(
                          scale: 0.7,
                          child: Switch(
                              activeColor: Colors.black,
                              value: _isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  _isSwitched = value;
                                });
                              }),
                        ),
                      )
                    ],
                  )),
              const PopupMenuItem(
                  height: 40,
                  child: Row(
                    children: [
                      Icon(Icons.cast_for_education_rounded),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text('Telegram Features'),
                      ),
                    ],
                  )),
              const PopupMenuItem(
                  height: 40,
                  child: Row(
                    children: [
                      Icon(Icons.bug_report_outlined),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text('Report Bug'),
                      ),
                    ],
                  )),
              const PopupMenuItem(
                  height: 40,
                  child: Row(
                    children: [
                      Icon(Icons.switch_access_shortcut_rounded),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text('Switch to A version'),
                      ),
                    ],
                  )),
              PopupMenuItem(
                  onTap: () {
                    showAlertBox(context);
                  },
                  height: 40,
                  child: const Row(
                    children: [
                      Icon(Icons.send_to_mobile),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text('Sign Out'),
                      ),
                    ],
                  )),
            ],
            child: const Icon(Icons.menu),
          ),
        ),
        title: SizedBox(
          height: 40,
          child: Center(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintStyle: TextStyle(fontSize: 17),
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Color.fromRGBO(133, 129, 129, 1),
                  contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  hintText: 'Search',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(
                        width: 1, color: Color.fromRGBO(133, 129, 129, 1)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide(
                      width: 2,
                      color: Color.fromARGB(225, 51, 144, 236),
                    ),
                  )),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showAlertBox(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text(
                      users[index].name,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return ChatPage(name: users[index].name,icon:users[index].icon,index:index);
                      }));
                    },
                    subtitle: Text(
                      users[index].currentMessage,
                      style: const TextStyle(fontFamily: 'RobotoMono'),
                    ),
                    leading: Container(
                      child: (index % 2 == 0)
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(users[index].icon),
                              radius: 30,
                            )
                          : SizedBox(
                              height: 60.0,
                              width: 60.0,
                              child: Image.network(
                                users[index].icon,
                                scale: 1,
                              ),
                            ),
                    ),
                    trailing: Column(
                      children: [
                        Text(users[index].time),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                    height: 0,
                  ),
              itemCount: users.length)
              ),
    );
  }

  signOut(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) =>const ScreenLogin(showSnackBarLogin:true)), (route) => false);
  }

  void showAlertBox(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content:const SingleChildScrollView(
              child: SizedBox(
                  height: 30,
                  child: Text(
                    'Do you want to Sign Out',
                    style: TextStyle(fontSize: 15),
                  ))),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                signOut(ctx);
                Navigator.of(context).pop();
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
  



}

// getShape(int index) {
//   if (index % 2 == 0) {
//     return CircleAvatar();
//   } else {
//     return SizedBox();
//   }
// }
