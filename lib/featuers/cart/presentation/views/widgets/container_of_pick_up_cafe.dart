import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/cart/data/model/branch_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class ContainerOfCafePickUp extends StatefulWidget {
  const ContainerOfCafePickUp(
      {super.key,
      required this.isChecked,
      required this.onChanged,
      required this.branchModel,
      required this.onBranchSelected});
  final bool isChecked;
  final BranchModel branchModel;
  final VoidCallback onChanged;
  final void Function(BranchModel branchModel) onBranchSelected;

  @override
  State<ContainerOfCafePickUp> createState() => _ContainerOfCafePickUpState();
}

class _ContainerOfCafePickUpState extends State<ContainerOfCafePickUp> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color:
                widget.isChecked ? AppColors.mainColorTheme : Color(0xffEDEDED),
            width: widget.isChecked ? 1.5 : 2),
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
                    Text(
                        isArabic()
                            ? widget.branchModel.branchnameAr
                            : widget.branchModel.branchnameEn,
                        style: TextStyles.font18SemiBold(context)),
                    Spacer(),
                    MSHCheckbox(
                      size: 22,
                      value: widget.isChecked,
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        uncheckedColor: AppColors.mainColorTheme,
                        checkedColor: AppColors.mainColorTheme,
                      ),
                      style: MSHCheckboxStyle.stroke,
                      onChanged: (_) {
                        widget.onChanged();
                        widget.onBranchSelected(widget.branchModel);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${isArabic() ? widget.branchModel.streetAr : widget.branchModel.streetEn}, ${isArabic() ? widget.branchModel.cityAr : widget.branchModel.cityEn}, ${isArabic() ? widget.branchModel.countryAr : widget.branchModel.countryEn}',
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
