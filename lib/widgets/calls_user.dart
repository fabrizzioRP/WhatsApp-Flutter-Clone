import 'package:flutter/material.dart';

class CallUserHistory extends StatelessWidget {
  const CallUserHistory({Key? key}) : super(key: key);

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
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Icons.south_west llamada perdida
                //
                Transform.rotate(
                    angle: 7.0,
                    child: const Icon(Icons.arrow_upward,
                        color: Colors.green, size: 18)),
                const Text('11 Apr, 5:40pm'),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.history, size: 25),
              onPressed: () {},
            ),
          );
        },
        itemBuilder: (_, i) => const Divider(
          indent: 80.0,
          thickness: 0.5,
        ),
      ),
    );
  }
}
