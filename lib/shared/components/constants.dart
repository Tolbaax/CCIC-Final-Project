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

final List<String> imgList = [
  'https://i.pinimg.com/736x/ea/ad/d2/eaadd25afc2289535a13cd1355519ffd.jpg',
  'https://i.pinimg.com/564x/b5/15/a3/b515a3842d4ba9bd036bf7e5acb06480.jpg',
  'https://i.pinimg.com/564x/3d/ec/81/3dec81e1f82ab9577ef4dbc6b0367a1c.jpg',
  'https://i.pinimg.com/564x/55/38/e1/5538e1eb5677e390848ea610839a6dab.jpg',
  'https://i.pinimg.com/564x/df/dd/9c/dfdd9cb159e860687a8841f7930f224f.jpg',
];
