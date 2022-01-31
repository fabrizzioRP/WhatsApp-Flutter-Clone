import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_flu/services/usuarios_services.dart';
import 'package:whatsapp_flu/utils/init_camera.dart';
import 'package:whatsapp_flu/widgets/calls_user.dart';
import 'package:whatsapp_flu/widgets/camera_user.dart';
import 'package:whatsapp_flu/widgets/chat_user.dart';
import 'package:whatsapp_flu/widgets/status_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> tabBarList = const [
    Tab(
      icon: Icon(Icons.camera_alt_sharp),
    ),
    Tab(
      text: 'CHATS',
    ),
    Tab(
      text: 'STATUS',
    ),
    Tab(
      text: 'CALLS',
    ),
  ];
  int _currentIndex = 1;

  @override
  void initState() {
    _tabController = TabController(
      length: tabBarList.length,
      vsync: this,
      initialIndex: 1,
    );
    _tabController.addListener(_listenEventIndex);
    super.initState();
  }

  _listenEventIndex() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final consumeTheme = Provider.of<User>(context);
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp', style: TextStyle(fontSize: 22)),
          actions: [
            IconButton(
              icon: const Icon(Icons.dark_mode),
              onPressed: () => consumeTheme.isModeDark =
                  consumeTheme.isModeDark ? false : true,
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert_outlined),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorColor:
                consumeTheme.isModeDark ? Colors.green.shade700 : Colors.white,
            indicatorWeight: 3.0,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            labelColor:
                consumeTheme.isModeDark ? Colors.green.shade700 : Colors.white,
            unselectedLabelColor: consumeTheme.isModeDark
                ? Colors.grey.shade500
                : Colors.grey.shade300,
            tabs: tabBarList,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: const BouncingScrollPhysics(),
          children: const [
            CameraUserScreen(),
            ListChatUser(),
            StatusUser(),
            CallUserHistory(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (_currentIndex == 2)
              FloatingActionButton(
                mini: true,
                elevation: 0,
                backgroundColor: Colors.grey,
                child: const Icon(Icons.edit, size: 20, color: Colors.white),
                onPressed: () {},
              ),
            const SizedBox(height: 5),
            if (_currentIndex > 0)
              FloatingActionButton(
                child: changeIconFloatingBtn(_currentIndex),
                elevation: 0,
                onPressed: () => onPressedFloatingBtn(context, _currentIndex),
              ),
          ],
        ),
      ),
    );
  }

  Widget changeIconFloatingBtn(int currentIndex) => (_currentIndex == 1)
      ? const Icon(Icons.message_rounded, color: Colors.white)
      : (_currentIndex == 2)
          ? const Icon(Icons.camera_alt, color: Colors.white)
          : const Icon(Icons.add_call, color: Colors.white);

  void onPressedFloatingBtn(BuildContext context, int currentIndex) async {
    if (currentIndex == 2) {
      functionCamera(context);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController.removeListener(_listenEventIndex);
    super.dispose();
  }
}
