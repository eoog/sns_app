

import '../../../../core/utils/error/error_response.dart';
import '../../../../presentation/pages/main/cubit/mall_type_cubit.dart';
import '../../../model/common/result.dart';
import '../../../repository/display.repository.dart';
import '../../base/remote.usecase.dart';

class GetMenusUsecase extends RemoteUsecase<DisplayRepository> {
  final MallType malltype;

  GetMenusUsecase({required this.malltype});

  @override
  Future call(DisplayRepository repository) async {
    final result = await repository.getMenusByMallType(mallType: malltype);

    return (result.status == 'SUCCESS')
        ? Result.Success(result.data ?? [])
        : Result.failure(
        ErrorResponse(
            status: result.status,
            code: result.code,
            message: result.message
        )
    );
  }
}
