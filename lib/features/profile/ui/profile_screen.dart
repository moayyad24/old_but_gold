import 'package:old_but_gold/core/helper/profile_information_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/theme/ui_parameters.dart';
import 'package:old_but_gold/core/widgets/top_gradient_container.dart';
import 'package:old_but_gold/features/profile/data/repos/profile_repo_impl.dart';
import 'package:old_but_gold/features/profile/manager/profile_information_cubit/profile_information_cubit.dart';
import 'package:old_but_gold/features/profile/manager/profile_information_cubit/profile_information_state.dart';
import 'package:old_but_gold/features/profile/ui/widgets/profile/profile_body.dart';
import 'package:old_but_gold/features/profile/ui/widgets/profile/profile_picture_and_name.dart';
import 'package:old_but_gold/features/profile/ui/widgets/profile/profile_top_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var storage = ProfileInformationStorage.load()!;
    return BlocProvider(
      create: (context) =>
          ProfileInformationCubit(getIt.get<ProfileRepoImpl>()),
      child: TopGradientContainer(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: UiParameters.dPadding,
                child: Column(
                  children: [
                    ProfileTopBar(),
                    30.verticalSpace,
                    BlocBuilder<
                      ProfileInformationCubit,
                      ProfileInformationState
                    >(
                      builder: (context, state) {
                        return state is GetProfileInformationLoading
                            ? LinearProgressIndicator()
                            : ProfilePictureAndName(
                                image: storage.photoUrl!,
                                name:
                                    '${storage.firstName} ${storage.lastName}',
                                onTap: () async {
                                  await BlocProvider.of<
                                        ProfileInformationCubit
                                      >(context)
                                      .updateImage();
                                },
                              );
                      },
                    ),
                    40.verticalSpace,
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => ProfileBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
