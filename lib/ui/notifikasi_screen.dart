import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
// import 'routes.dart';


class NotifikasiScreen extends StatefulWidget {
  const NotifikasiScreen({Key? key}) : super(key: key);
  @override
  NotifikasiState createState() => NotifikasiState();
}

class NotifikasiState extends State<NotifikasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Widget Notifikasi",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
    AnimatedButton(
      text: 'Info Dialog fixed width and square buttons',
      pressEvent: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.INFO_REVERSED,
          borderSide: const BorderSide(
            color: Colors.green,
            width: 2,
          ),
          width: 400,
          buttonsBorderRadius: const BorderRadius.all(
            Radius.circular(2),
          ),
          dismissOnTouchOutside: true,
          dismissOnBackKeyPress: false,
          onDissmissCallback: (type) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Dismissed by $type'),
              ),
            );
          },
          headerAnimationLoop: false,
          animType: AnimType.BOTTOMSLIDE,
          title: 'INFO',
          desc: 'This Dialog can be dismissed touching outside',
          showCloseIcon: true,
          // btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();
      }
    ),
                  Container(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _showSimpleDialog();
                    },
                    child: const Text('Show Simple Dialog Widget'),
                  ),
                  Container(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _showSnackBar();
                    },
                    child: const Text('Show Snackbar Widget'),
                  ),
                  Container(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _showAlertDialog1();
                    },
                    child: const Text('Show Alert Dialog Widget (Konfirmasi)'),
                  ),
                  Container(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _showAlertDialog2();
                    },
                    child: const Text('Show Alert Dialog Widget (Informasi)'),
                  ),
                  Container(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _showToast();
                    },
                    child: const Text('Show Toast Widget'),
                  ),
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     _showInformationDialog();
                  //   },
                  //   child: const Text('Show Toast Widget'),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showSimpleDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Pilih Program Studi'),
          elevation: 10,
          children: [
            SimpleDialogOption(
              child: const Text('Teknik Informatika'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: const Text('Sistem Informasi'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SimpleDialogOption(
              child: const Text('Komputer Akuntanasi'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          //backgroundColor: Colors.green,
        );
      },
    );
  }

  _showSnackBar() async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Selamat datang di STTI Tanjungpinang"),
    ));
  }

  _showAlertDialog1() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: Text('Apakah anda ingin mengakhiri proses ?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Ya'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _showAlertDialog2() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informasi'),
          content: Text('Data Pengguna berhasil tersimpan.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _showToast() async {
    GFToast.showToast(
      'Hallo, Selamat datang di STTI Tanjungpinang.',
      context,
      toastPosition: GFToastPosition.BOTTOM,
      textStyle: TextStyle(fontSize: 16, color: Colors.white),
      backgroundColor: Colors.red,
    );
  }


  _showInformationDialog() async{
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO_REVERSED,
      borderSide: const BorderSide(
        color: Colors.green,
        width: 2,
      ),
      width: 280,
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: 'INFO',
      desc: 'This Dialog can be dismissed touching outside',
      showCloseIcon: true,
      btnOkOnPress: () {},
    ).show();
  }
}