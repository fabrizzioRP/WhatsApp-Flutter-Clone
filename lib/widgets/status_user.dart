// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:whatsapp_flu/services/usuarios_services.dart';
import 'package:whatsapp_flu/widgets/show_history.dart';

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
  int previousValue = 0;
  @override
  Widget build(BuildContext context) {
    final userImage = Provider.of<User>(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: userImage.isViewedHistory ? Colors.grey : Colors.green,
        maxRadius: 28.0,
        child: userImage.image.isNotEmpty
            ? Container(
                margin: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  image: DecorationImage(
                    image:
                        FileImage(userImage.image[userImage.image.length - 1]),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : const CircleAvatar(
                radius: 28.0,
                backgroundColor: Colors.green,
                child: Icon(Icons.add_box_outlined, color: Colors.white),
              ),
      ),
      title: const Text('My Status',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
      subtitle: const Text('Tap to add status update'),
      trailing: IconButton(
        icon: const Icon(Icons.more_horiz_outlined),
        onPressed: () {},
      ),
      onTap: () {
        previousValue = userImage.image.length;
        showDialog(
          context: context,
          builder: (context) => ShowHistoryScreen(userImage: userImage.image),
        );
        userImage.isViewedHistory = true;
      },
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
