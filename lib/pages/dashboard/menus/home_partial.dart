import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/controllers/like_controller.dart';
import 'package:pas1_mobile_11pplg2_24/controllers/team_controller.dart';
import 'package:pas1_mobile_11pplg2_24/models/team_model.dart';
import 'package:pas1_mobile_11pplg2_24/utils/theme.dart';
import 'package:pas1_mobile_11pplg2_24/widgets/itemlist_widget.dart';
import 'package:pas1_mobile_11pplg2_24/widgets/spinner_widget.dart';

class HomePartialPage extends StatelessWidget {

  final TeamController teamController = Get.put(TeamController());
  final LikeController likeController = Get.put(LikeController());

  HomePartialPage({super.key});

  @override
  Widget build(BuildContext context) {
    teamController.fetchTeams();
    likeController.loadLikes();
    return Obx(() => teamController.isLoading.value
      ? const Center(child: SpinnerWidget(
          color: AppTheme.primaryColor,
          size: SpinnerSize.large,
      ))
      : SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: teamController.teams.length,
                    itemBuilder: (context, index) {
                      Team team = teamController.teams[index];
                      return Obx(() => ItemList(
                        onClick: () => Get.toNamed('/detail', arguments: team),
                        onLike: () => likeController.toggleLike(team),
                        team: team,
                        liked: likeController.isLiked(team),
                      ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
