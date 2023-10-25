import 'package:flutter/material.dart';
import 'package:flutter_application_sw2/screens/chatmodel.dart';
import 'package:flutter_application_sw2/screens/home.dart';

class ChatPage extends StatelessWidget {
  final int index;
  final String name;
  final String icon;
  const ChatPage(
      {super.key, required this.name, required this.icon, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          leadingWidth: 30,
          title: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(icon),
              ),
              const SizedBox(width: 10),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(225, 51, 144, 236),
          actions: [
            SizedBox(
              height: 200,
              child: PopupMenuButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                color: Colors.white,
                position: PopupMenuPosition.under,
                itemBuilder: (ctx) => [
                  const PopupMenuItem(
                      height: 40,
                      child: Row(
                        children: [
                          Icon(
                            Icons.volume_mute,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Text('Mute Messages'),
                          ),
                        ],
                      )),
                  const PopupMenuItem(
                      height: 40,
                      child: Row(
                        children: [
                          Icon(
                            Icons.videocam,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Text('Video Call'),
                          ),
                        ],
                      )),
                  const PopupMenuItem(
                      height: 40,
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Text('Search'),
                          ),
                        ],
                      )),
                  const PopupMenuItem(
                      height: 40,
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_add_alt_outlined,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Text('Share My Contact'),
                          ),
                        ],
                      )),
                  PopupMenuItem(
                      height: 40,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.brush_outlined,
                            color: Colors.black,
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Text('Set Wallpaper'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Transform.scale(
                              scale: 0.7,
                            ),
                          )
                        ],
                      )),
                  PopupMenuItem(
                      height: 40,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.cleaning_services_rounded,
                            color: Colors.black,
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Text('Clear History'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Transform.scale(
                              scale: 0.7,
                            ),
                          )
                        ],
                      )),
                  PopupMenuItem(
                      onTap: () {
                        showAlertBox(context);
                      },
                      height: 40,
                      child: const Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: Text('Delete Chat'),
                          ),
                        ],
                      )),
                ],
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: const SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 35,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.emoji_emotions_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: TextField(
                          textAlignVertical: TextAlignVertical(y: -0.5),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 0.5,
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.send,
                          color: Color.fromARGB(225, 51, 144, 236)),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void showAlertBox(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const SingleChildScrollView(
              child: SizedBox(
                  height: 30,
                  child: Text(
                    'Do you want to Delete this chat.',
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
                deleteChat(ctx);
                Navigator.of(context).pop();
                Navigator.of(ctx).push(MaterialPageRoute(builder: (context) {
                  return const ScreenHome(showSnackbar: true);
                }));
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  void deleteChat(context) {
    users.removeAt(index);
  }
}
