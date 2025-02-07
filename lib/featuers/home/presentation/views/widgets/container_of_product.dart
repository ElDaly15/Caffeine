import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ContainerOfProduct extends StatelessWidget {
  const ContainerOfProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: w <= 400
          ? MediaQuery.of(context).size.width * 0.44
          : MediaQuery.of(context).size.width * 0.45,
      child: AspectRatio(
        aspectRatio: w <= 400 ? 2 / 3.29 : 2.3 / 3.9,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: IntrinsicHeight(
            // Wrap the Column in IntrinsicHeight
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      Assets.imagesLatte,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Latte',
                    style: TextStyles.font22SemiBold(context).copyWith(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Deep Foam',
                    style: TextStyles.font18Medium(context)
                        // ignore: deprecated_member_use
                        .copyWith(color: Colors.grey.withOpacity(0.8)),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        r'$ 4.53',
                        style: TextStyles.font22SemiBold(context).copyWith(),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.mainColorTheme,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
