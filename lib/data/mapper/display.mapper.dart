



import '../../domain/model/display/menu/menu.model.dart';
import '../../domain/model/display/view_module/view_module.model.dart';
import '../dto/display/menu/menu.dto.dart';
import '../dto/display/view_module/view_module.dto.dart';

extension MenuX on MenuDto {
  /// TODO : 메뉴 DTO를 메뉴로 변환
  Menu toModel() {
      return Menu(tabId: tabId ?? -1, title: title ?? '');
  }
}

extension ViewMouduleX on ViewModuleDto {
  ViewModule toModel() {
    return ViewModule(type: type ?? '', title: title ?? '', subtitle: subtitle ?? '', imageUrl: imageUrl ?? '');
  }
}