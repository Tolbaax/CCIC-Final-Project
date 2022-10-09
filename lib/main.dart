import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/modules/home/cubit/cubit.dart';
import 'package:social_app/modules/home/cubit/states.dart';
import 'package:social_app/modules/splash/splash_screen.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/network/lcoal/cache_helper.dart';
import 'package:social_app/shared/network/remote/dio_helper.dart';
import 'package:social_app/shared/resources/blocObserver.dart';
import 'package:social_app/shared/styles/themes.dart';

void main() async {
  // make sure that everything in methode is finished, then open the app
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'token');
  DioHelper.init();

  runApp(const ProductApp());
}

class ProductApp extends StatelessWidget {
  const ProductApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => ProductCubit()..getProducts(),
          ),
        ],
        child: BlocConsumer<ProductCubit, ProductStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return ScreenUtilInit(
              builder: (context, child) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                home: const SplashScreen(),
              ),
            );
          },
        ));
  }
}
