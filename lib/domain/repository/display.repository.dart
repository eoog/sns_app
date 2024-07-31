

import 'package:eoog/domain/model/display/view_module/view_module.model.dart';
import 'package:eoog/domain/repository/repository.dart';
import 'package:eoog/presentation/pages/main/cubit/mall_type_cubit.dart';

import '../../data/dto/common/response_wrapper/response_wrapper.dart';
import '../model/display/menu/menu.model.dart';


abstract class DisplayRepository extends Repository {
  Future<ResponseWrapper<List<Menu>>> getMenusByMallType({
    required MallType mallType,
});

  Future<ResponseWrapper<List<ViewModule>>> getViewModultByTabId({
    required int tabId,
  });
}