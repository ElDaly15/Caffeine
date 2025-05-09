import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
import 'package:caffeine/featuers/home/data/models/ads_model.dart';
import 'package:caffeine/featuers/product/data/model/product_model.dart';

List<ProductModel> loadingList() => List.generate(
    4,
    (index) => ProductModel(
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
          rating: 4,
          ratingCount: 4,
        ));

List<AdsModel> loadingListAds() => List.generate(
    4,
    (index) => AdsModel(
          id: '',
          title: '',
          url: 'https://i.imgur.com/Hveh20Q.png',
        ));

List<CartModel> loadingListCart() => List.generate(
      4,
      (index) => CartModel(
        productCategory: '',
        productCode: '',
        orderProductCode: '',
        productNameAr: 'كافيه لاتيه',
        productNameEn: 'caffe Latte',
        productImage: 'https://i.imgur.com/Hveh20Q.png',
        productPriceL: '120',
        productPriceM: '120',
        productPriceS: '120',
        quantity: 0,
        sizeAr: 'صغير',
        sizeEn: 'S',
      ),
    );
