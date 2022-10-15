import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/product.dart';
import 'package:social_app/modules/home/cubit/states.dart';
import 'package:social_app/shared/network/remote/dio_helper.dart';
import 'package:social_app/shared/network/remote/end_points.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());
  static ProductCubit get(context) => BlocProvider.of(context);

  ProductModel? productModel;
  void getProducts() async {
    emit(ProductLoadingState());
    final resp = await DioHelper.getData(path: PRODUCT);
    if (resp.statusCode == 200 && resp.data['status']) {
      productModel = ProductModel.fromJson(resp.data);
      emit(ProductSuccessState());
    } else {
      emit(
        ProductErrorState(msg: resp.data['msg']),
      );
    }
  }

  void checkConnectivity() async {
    await Connectivity().checkConnectivity();
  }
}
