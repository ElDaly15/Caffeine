import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class ContainerOfCafePickUp extends StatefulWidget {
  const ContainerOfCafePickUp(
      {super.key, required this.isChecked, required this.onChanged});
  final bool isChecked;
  final VoidCallback onChanged;

  @override
  State<ContainerOfCafePickUp> createState() => _ContainerOfCafePickUpState();
}

class _ContainerOfCafePickUpState extends State<ContainerOfCafePickUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xffEDEDED), width: 2),
      ),
      child: Row(
        children: [
          Icon(
            IconlyBold.location,
            color: AppColors.mainColorTheme,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Cafe 1', style: TextStyles.font18SemiBold(context)),
                    Spacer(),
                    MSHCheckbox(
                      size: 22,
                      value: widget.isChecked,
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        uncheckedColor: AppColors.mainColorTheme,
                        checkedColor: AppColors.mainColorTheme,
                      ),
                      style: MSHCheckboxStyle.stroke,
                      onChanged: (_) => widget.onChanged(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Jl. Kpg Sutoyo No. 620, Bilzen, Tanjungbalai.',
                  style: TextStyles.font14Regular(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
