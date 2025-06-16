import 'package:flutter/widgets.dart';
import 'package:old_but_gold/features/home/ui/widgets/home_body.dart';
import 'package:old_but_gold/features/home/ui/widgets/home_search_bar.dart';

class HomeSliverBody extends StatelessWidget {
  const HomeSliverBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 1,
        (context, index) => Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [HomeBody(), HomeSearchBar()],
        ),
      ),
    );
  }
}
