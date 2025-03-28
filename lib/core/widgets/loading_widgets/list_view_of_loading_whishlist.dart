import 'package:caffeine/featuers/product/data/model/product_model.dart';
import 'package:caffeine/featuers/settings/whishlist/presentation/views/widgets/whishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListViewOfWhishListItem extends StatelessWidget {
  const ListViewOfWhishListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        duration: const Duration(seconds: 1),
      ),
      enabled: true,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 5, // You can adjust the count dynamically based on your data
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: WhishlistItem(
              productModel: ProductModel(
                productNameAr: 'كافيه لاتيه',
                ratingUserModel: [],
                productNameEn: 'Caffe Latte',
                productDescriptionAr:
                    'استمتع بمذاق كافيه لاتيه الغني والمخملي، حيث يلتقي الإسبرسو القوي مع الحليب الكريمي لصنع مشروب متوازن ومثالي لكل الأوقات. بفضل قوامه الناعم ورغوته الفاتنة، يمنحك كافيه لاتيه لحظة من الدفء والراحة في كل رشفة.سواء كنت تبدأ يومك بنشاط أو تأخذ استراحة هادئة، فإن كافيه لاتيه هو الخيار الأمثل لمحبي القهوة الذين يفضلون المذاق الغني مع لمسة ناعمة من الحلاوة الطبيعية للحليب. 🌿☕متوفر ساخنًا أو مثلجًا، ليناسب جميع الأذواق!',
                productDescriptionEn:
                    'Enjoy the rich and velvety taste of Caffè Latte, where bold espresso meets creamy milk to create a perfectly balanced and delightful drink. With its smooth texture and luxurious froth, every sip brings warmth and comfort.Whether \'re starting your day with energy or taking a relaxing break, Caffè Latte is the perfect choice for coffee lovers who appreciate a rich flavor with a naturally sweet, milky touch. 🌿☕Available hot or iced to suit every preference!',
                productPriceS: '51',
                productPriceM: '51',
                productPriceL: '51',
                productCode: '',
                productImage:
                    'https://www.caffesociety.co.uk/assets/recipe-images/latte-small.jpg',
                productCategory: '',
                productInfo: '',
                favIds: [],
                rating: 0,
                ratingCount: 0,
              ),
              onSwiped: (value) {},
            ),
          );
        },
      ),
    );
  }
}
