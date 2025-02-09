import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerOfProductDetails extends StatelessWidget {
  const ContainerOfProductDetails({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Color(0xffEDEDED)),
      child: SvgPicture.asset(
        image,
        height: 40,
        width: 40,
      ),
    );
  }
}
