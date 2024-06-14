import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:livraison/src/view/screens/favorites/favorites.dart';
import 'package:livraison/src/view/screens/home/home_content.dart';
import 'package:livraison/src/view/screens/localisation/localisation.dart';
import 'package:livraison/src/view/screens/profile/profile.dart';
import '../../../utils/style/color_resources.dart';

var indexRef = StateProvider((ref) => 0);

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = Theme.of(context).primaryColor;
    final greyColor = Colors.grey.shade100;
    return Container(
      color: ColorResources.WHITE_COLOR,
      child:Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            primaryColor,
            greyColor,
            greyColor,
             greyColor,
            ColorResources.WHITE_COLOR
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: IndexedStack(
            index: ref.watch(indexRef),
            children: const [HomeContent(), Favorites(), Localisation(), Profile()],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: primaryColor,
            currentIndex: ref.watch(indexRef),
            unselectedItemColor: ColorResources.GRAY_GHOST_COLOR,
            onTap: (typeIndex) {
              ref.read(indexRef.notifier).state = typeIndex;
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.place), label: 'Localisation'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile')
            ]),
      ),
    ),);
  }
}
