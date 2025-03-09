import 'package:caffeine/core/utils/app_styles.dart';

String checkDescription(String info) {
  if (info == 'Hot') {
    return isArabic() ? 'ساخن' : 'Hot';
  } else if (info == 'Ice') {
    return isArabic() ? 'بارد' : 'Ice';
  } else {
    return isArabic() ? 'ساخن / بارد' : 'Hot/Ice';
  }
}
