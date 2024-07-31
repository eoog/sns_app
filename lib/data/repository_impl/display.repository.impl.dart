



import 'package:eoog/data/mapper/common.mapper.dart';
import 'package:eoog/data/mapper/display.mapper.dart';

import '../../domain/model/display/menu/menu.model.dart';
import '../../domain/model/display/view_module/view_module.model.dart';
import '../../domain/repository/display.repository.dart';
import '../../presentation/pages/main/cubit/mall_type_cubit.dart';
import '../data_source/remote/display.api.dart';
import '../dto/common/response_wrapper/response_wrapper.dart';

class DisplayRepositoryImpl implements DisplayRepository {
  final DisPlayApi _disPlayApi;

  DisplayRepositoryImpl(this._disPlayApi);

  @override
  Future<ResponseWrapper<List<Menu>>> getMenusByMallType (
      {required MallType mallType}) async {
    final reponse = await _disPlayApi.getMenusByMallType(mallType.name);

    return reponse.toModel<List<Menu>>(
      reponse.data?.map((dto) => dto.toModel()).toList() ?? [],
    );
  }

  @override
  Future<ResponseWrapper<List<ViewModule>>> getViewModultByTabId({required int tabId}) async {
    final response = await _disPlayApi.getViewModulesByTabId(tabId);

    return response.toModel<List<ViewModule>> (
      response.data?.map((viewModulDto) => viewModulDto.toModel()).toList() ?? []);
    throw UnimplementedError();
  }




}
