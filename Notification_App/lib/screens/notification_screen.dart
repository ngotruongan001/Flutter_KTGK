import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notification_app/card_notification.dart';
import 'package:notification_app/models/push_notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<PushNotification> _listNotification  = [];

  void registerNotification() async {
    await Firebase.initializeApp();
    FirebaseMessaging.instance.getToken().then((token){
      print('FCM TOKEN');
      print(token);
      print('end.');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.title);
      print(event.notification!.body);
      PushNotification newNotification = PushNotification(
        title: event.notification?.title,
        body: event.notification?.body,
      );
      setState(() {
        _listNotification = List.from(_listNotification)
          ..add(newNotification);
      });

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Notification"),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  child: const Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  void removeItem(var index){
    List<PushNotification> _newList = _listNotification;
    var n = _newList.removeAt(index);
    // print(n.title);
    setState(() {
      _listNotification = _newList;
    });
  }

  void removeItemAll(){
    print("Clear Notification");
    setState(() {
      _listNotification = [];
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    registerNotification();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thông báo'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () { Scaffold.of(context).openDrawer(); },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'a',
            onPressed: () {
              // handle the press
            },
          ),
        ],),
      backgroundColor: Colors.transparent,
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8),
        itemCount: _listNotification.length,
        itemBuilder: (BuildContext context, int index) {
          return CardNotification(_listNotification[index].title, _listNotification[index].body, index, removeItem);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () => removeItemAll(),
        backgroundColor: Colors.lime,
        child: const Icon(Icons.remove_circle_outline),
      ),
    );
  }
}
