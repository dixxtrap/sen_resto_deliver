import 'package:flutter/material.dart';
import 'package:livraison/src/utils/style/color_resources.dart';
import 'package:livraison/src/view/models/food_category.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({super.key, required this.category,required this.onTap});
  final FoodCategory category;
final VoidCallback onTap;
  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
   bool categoryState = false;
  @override
  Widget build(BuildContext context) {
       final width = MediaQuery.of(context).size.width;
    return   GestureDetector(
            // onTap: () {
            //   setState(() {
            //     categoryState = !categoryState;
            //   });
            // },
            onTap: widget.onTap,
            
            child: Container(
              height: 120,
              width: width / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: width / 12,
                    backgroundColor: categoryState == true
                        ? ColorResources.BLUE_COLOR
                        : null,
                    child: Icon(widget.category.iconData,color: categoryState ? ColorResources.WHITE_SMOKE : null,),
                  ),
                 Text(
                    widget.category.name, style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          );
  }
}


