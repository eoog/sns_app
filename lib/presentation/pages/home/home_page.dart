
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/dialog/common_dialog.dart';
import '../../../domain/usecase/display/display.usecase.dart';
import '../../../service_locator.dart';
import '../main/cubit/mall_type_cubit.dart';
import 'bloc/menu_bloc/menu_bloc.dart';
import 'component/global_nav/global_nav_bar.dart';
import 'component/global_nav/global_nav_bar_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MallTypeCubit, MallType>(builder: (context, state) {
      return BlocProvider(
        create: (_) =>
            MenuBloc(locator<DisplayUsecase>())..add(MenuIntiialized(state)),
        child: HomePageView(),
      );
    });
  }
}
class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<MallTypeCubit, MallType>(
      listener: (context, state) =>
          context.read<MenuBloc>().add(MenuIntiialized(state)),
      listenWhen: (prev, curr) => prev.index != curr.index,
      child: BlocConsumer<MenuBloc, MenuState>(
        builder: (_, state) {
          switch (state.status) {
            case Status.initial:
              return const Center(child: CircularProgressIndicator(),);
            case Status.loading:
              return DefaultTabController(
                length: state.menus.length,
                key: ValueKey<MallType>(state.mallType),
                child: Column(
                  children: [
                    GlobalNavBar(state.menus),
                    GlobalNavBarView(state.menus,state.mallType),
                  ],
                ),
              );
            case Status.success:
              return DefaultTabController(
                length: state.menus.length,
                key: ValueKey<MallType>(state.mallType),
                child: Column(
                  children: [
                    GlobalNavBar(state.menus),
                    GlobalNavBarView(state.menus,state.mallType),
                  ],
                ),
              );
            case Status.error:
              return Center(child: Text("error"));
          }
        },
        listener: (context, state) async {
          if (state.status == Status.error) {
            // 에러일때만 실행

            final bool result =
                (await CommonDialog.errorDialog(context, state.error) ?? false);

            if (result) {
              context.read<MenuBloc>().add(MenuIntiialized(MallType.market));
            }
          }
        },
        listenWhen: (prev, curr) => prev.status != curr.status,
      ),
    );
  }
}
