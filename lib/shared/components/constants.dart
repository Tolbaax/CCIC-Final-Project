// save token when user log in and use it in all app not token in shared preferences;
import 'package:social_app/modules/login/login_screen.dart';
import 'package:social_app/shared/components/widgets/navigation.dart';
import 'package:social_app/shared/network/lcoal/cache_helper.dart';

String? token;

RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(context, const LoginScreen());
    }
  });
}
