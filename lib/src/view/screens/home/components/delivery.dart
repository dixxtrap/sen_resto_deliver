import 'package:flutter/material.dart';
import 'package:livraison/src/utils/style/color_resources.dart';
import 'package:livraison/src/utils/style/dimensions.dart';
import 'package:livraison/src/utils/style/style.dart';

class Delivery extends StatelessWidget {
  const Delivery({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "livraison à",
          style: TextStyle(
              color: ColorResources.GRAY_COLOR,
              fontSize: Dimensions.FONT_SIZE_SMALL),
        ),
        Row(
          children: [
           const  Icon(
              Icons.place,
              size: Dimensions.FONT_SIZE_DEFAULT,
              color: ColorResources.BLUE_ACCENT_COLOR,
            ),
            Text(
              "Zac Mbao",style: AppStyle.montserratBold(),
            ),
            const Icon(Icons.arrow_drop_down,
                size: Dimensions.FONT_SIZE_DEFAULT,
                color: ColorResources.BLUE_ACCENT_COLOR),
          ],
        )
      ],
    );
  }
}
