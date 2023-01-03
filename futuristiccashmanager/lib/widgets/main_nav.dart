import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:futuristiccashmanager/utils/custom_indicator.dart';
import 'package:futuristiccashmanager/utils/extensions.dart';
import 'package:futuristiccashmanager/utils/magic_strings.dart';
import 'package:go_router/go_router.dart';

class MainNav extends StatefulWidget {
  final Widget child;
  const MainNav({super.key, required this.child});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  List<Tab> get screenTabs => [
        Tab(
          icon: const Icon(Icons.home),
          text: RouteName.home.titleCase,
        ),
        Tab(
          icon: const Icon(Icons.credit_card),
          text: RouteName.payments.titleCase,
        ),
        Tab(
          icon: const Icon(Icons.chat_rounded),
          text: RouteName.dialogs.titleCase,
        ),
        Tab(
          icon: const Icon(Icons.dashboard),
          text: RouteName.services.titleCase,
        ),
        Tab(
          icon: const Icon(Icons.location_on),
          text: RouteName.atms.reverseTitleCase,
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7, sigmaY: 5),
                child: Container(
                  color: Colors.white.withOpacity(0.15),
                  child: TabBar(
                    labelColor: Theme.of(context).colorScheme.secondary,
                    unselectedLabelColor: Colors.grey,
                    controller: controller,
                    indicator: CustomIndicator(context),
                    onTap: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                      switch (value) {
                        case 0:
                          context.goNamed(RouteName.home.name);
                          break;
                        case 1:
                          context.goNamed(RouteName.payments.name);
                          break;
                        case 2:
                          context.goNamed(RouteName.dialogs.name);
                          break;
                        case 3:
                          context.goNamed(RouteName.services.name);
                          break;
                        default:
                          context.goNamed(RouteName.atms.name);
                      }
                    },
                    tabs: screenTabs
                        .map<Widget>((e) => SafeArea(top: false, child: e))
                        .toList(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
