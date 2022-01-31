import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String image =
    'https://imageio.forbes.com/specials-images/imageserve/5f47d4de7637290765bce495/0x0.jpg';

class StatusUser extends StatelessWidget {
  const StatusUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _MyStatus(),
            _contentText('Recent Updates'),
            _RecentUpdatesStatus(),
            _contentText('Viewed Updates'),
            _ViewedUpdatesStatus(),
          ],
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

  Widget _contentText(String text) => Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.grey.shade700),
          ),
        ),
      );
}

class _MyStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.green,
        child: Icon(Icons.add_box_outlined, color: Colors.white),
      ),
      title: const Text('My Status',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
      subtitle: const Text('Tap to add status update'),
      trailing: IconButton(
        icon: const Icon(Icons.more_horiz_outlined),
        onPressed: () {},
      ),
      onTap: () {},
    );
  }
}

class _RecentUpdatesStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      separatorBuilder: (_, i) {
        return ListTile(
          leading: CircleAvatar(
            // cambiar a gris cuando lo vio.
            backgroundColor: Colors.green,
            maxRadius: 28.0,
            child: Container(
              margin: const EdgeInsets.all(3.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                image: DecorationImage(image: NetworkImage(image)),
              ),
            ),
          ),
          title: const Text('Elonk Musk',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
          subtitle: const Text('Today, 15:30pm'),
          onTap: () {},
        );
      },
      itemBuilder: (_, i) => const Divider(
        indent: 80.0,
        thickness: 0.5,
      ),
    );
  }
}

class _ViewedUpdatesStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 4,
      separatorBuilder: (_, i) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            maxRadius: 28.0,
            child: Container(
              margin: const EdgeInsets.all(3.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                image: DecorationImage(image: NetworkImage(image)),
              ),
            ),
          ),
          title: const Text('Elonk Musk',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
          subtitle: const Text('Today, 15:30pm'),
          onTap: () {},
        );
      },
      itemBuilder: (_, i) => const Divider(
        indent: 80.0,
        thickness: 0.5,
      ),
    );
  }
}
