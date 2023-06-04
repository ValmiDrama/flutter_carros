// ignore_for_file: avoid_print, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_carros/pages/login/user_model.dart';
import 'package:flutter_carros/utils/push.dart';

import 'pages/login/login_page.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  UserAccountsDrawerHeader _header(Usuario user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.nome ?? ""),
      accountEmail: Text(user.email ?? ''),
      currentAccountPicture: user.urlFoto != null
          ? CircleAvatar(
              backgroundImage: NetworkImage(user.urlFoto ?? ''),
            )
          : const FlutterLogo(),
    );
  }

  // UserAccountsDrawerHeader _header(FirebaseUser user) {
  //   return UserAccountsDrawerHeader(
  //     accountName: Text(user.displayName ?? ""),
  //     accountEmail: Text(user.email),
  //     currentAccountPicture: user.photoUrl != null
  //         ? CircleAvatar(
  //             backgroundImage: NetworkImage(user.photoUrl),
  //           )
  //         : const FlutterLogo(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // Future<FirebaseUser> future = FirebaseAuth.instance.currentUser();
    Future<Usuario?> future = Usuario.get();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            // FutureBuilder<FirebaseUser>(
            FutureBuilder<Usuario?>(
              future: future,
              builder: (context, snapshot) {
                // FirebaseUser user = snapshot.data;
                Usuario? user = snapshot.data;

                return user != null ? _header(user) : Container();
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Favoritos"),
              subtitle: const Text("mais informações..."),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text("Ajuda"),
              subtitle: const Text("mais informações..."),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Logout"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
            )
          ],
        ),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
    // Usuario.clear();
    // FirebaseService().logout();
    Navigator.pop(context);
    push(context, const LoginPage(), replace: true);
  }
}
