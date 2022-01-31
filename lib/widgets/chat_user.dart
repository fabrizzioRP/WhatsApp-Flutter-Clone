import 'package:flutter/material.dart';

class ListChatUser extends StatelessWidget {
  const ListChatUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        separatorBuilder: (_, i) {
          return ListTile(
            leading: const CircleAvatar(
              maxRadius: 28.0,
              backgroundImage: NetworkImage(
                  'https://imageio.forbes.com/specials-images/imageserve/5f47d4de7637290765bce495/0x0.jpg'),
            ),
            title: const Text('Elonk Musk',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
            subtitle: const Text('Hola'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '9:13pm',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
                // CONDITION
                Icon(Icons.volume_off_rounded),
              ],
            ),
          );
        },
        itemBuilder: (_, i) => const Divider(
          indent: 80.0,
          thickness: 0.5,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   heroTag: 'contactos',
      //   backgroundColor: Colors.green,
      //   child: const Icon(Icons.message_rounded),
      //   elevation: 0,
      //   onPressed: () {},
      // ),
    );
  }
}
