import 'package:flutter/material.dart';
import 'package:livraison/src/utils/style/color_resources.dart';
import 'package:livraison/src/view/screens/home/components/delivery.dart';
import 'package:livraison/src/view/screens/widgets/category_widget.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.all(16.0),
      child:  Column(
        children: [
          const Delivery(),
          const SizedBox(height: 32,),
          SearchBar(
            leading: const Icon(Icons.search),
            hintText: 'Rechercher',
            backgroundColor: MaterialStateProperty.all(ColorResources.WHITE_COLOR),
          ),
          SizedBox(height:  32,),
          CategoryWidget(),
        ],
      ),
    );
  }
}
