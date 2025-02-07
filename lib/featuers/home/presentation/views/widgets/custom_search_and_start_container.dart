import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/text_fields/custom_search_text_field.dart';
import 'package:flutter/material.dart';

class CustomSearchAndStartContainer extends StatelessWidget {
  const CustomSearchAndStartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.darkTheme,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: SizedBox(
                height: 10,
              ),
            ),
            Text(
              'Hello 👋 ,',
              style: TextStyles.font20Regular(context)
                  .copyWith(color: Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Mazen El Daly ',
              style: TextStyles.font24Regular(context)
                  .copyWith(color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            CustomSearchTextField(
              onChanged: (value) {},
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
