import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/controllers/like_controller.dart';
import 'package:pas1_mobile_11pplg2_24/models/team_model.dart';
import 'package:pas1_mobile_11pplg2_24/utils/theme.dart';
import 'package:pas1_mobile_11pplg2_24/widgets/itemlist_widget.dart';
import 'package:pas1_mobile_11pplg2_24/widgets/spinner_widget.dart';

class FavoritePartialPage extends StatelessWidget {
  final LikeController likeController = Get.put(LikeController());

  FavoritePartialPage({super.key});

  @override
  Widget build(BuildContext context) {
    likeController.loadLikes();
    return Obx(
      () => likeController.isLoading.value
          ? const Center(
              child: SpinnerWidget(
              color: AppTheme.primaryColor,
              size: SpinnerSize.large,
            ))
          : likeController.likes.isEmpty
          ? Center(
              child: Text(
                'No favorite team yet.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),)
          : SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Obx(() => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: likeController.likes.length,
                          itemBuilder: (context, index) {
                            Team team = likeController.likes[index];
                            return ItemList(
                              onClick: () => Get.toNamed('/detail', arguments: team),
                              onLike: () => likeController.toggleLike(team),
                              team: team,
                              liked: true,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
