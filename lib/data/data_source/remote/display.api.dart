import 'package:dio/dio.dart';
import 'package:eoog/data/dto/display/menu/menu.dto.dart';
import 'package:eoog/data/dto/display/view_module/view_module.dto.dart';
import 'package:retrofit/retrofit.dart';
import '../../dto/common/response_wrapper/response_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';
part 'display.api.g.dart';

@RestApi()
abstract class DisPlayApi {
  factory DisPlayApi(Dio dio, {String baseUrl}) = _DisPlayApi;

  @GET("/api/menus/{mall_type}")
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(@Path('mall_type') String mallType);

  @GET("/api/view-modules/{tab_id}")
  Future<ResponseWrapper<List<ViewModuleDto>>> getViewModulesByTabId(@Path('tab_id') int mallType);
}
