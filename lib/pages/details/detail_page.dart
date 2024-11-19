import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/models/team_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Team team = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          team.strTeam,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 72, left: 24, right: 24, bottom: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(team.strBadge,
                    width: 220, height: 220, fit: BoxFit.contain),
              ],
            ),
            const SizedBox(height: 32),
            Text(team.strTeam, style: Theme.of(context).textTheme.titleMedium),
            Text(team.strLeague, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (team.strFacebook.isNotEmpty)
                  IconButton(
                      onPressed: () => {},
                      icon: Image.asset('assets/icons/facebook.png', width: 32, height: 32,)),
                if (team.strTwitter.isNotEmpty)
                  IconButton(
                      onPressed: () => {},
                      icon: Image.asset('assets/icons/twitter.png', width: 32, height: 32,)),
                if (team.strInstagram.isNotEmpty)
                  IconButton(
                      onPressed: () => {},
                      icon: Image.asset('assets/icons/instagram.png', width: 32, height: 32,)),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              team.strDescriptionEn,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
