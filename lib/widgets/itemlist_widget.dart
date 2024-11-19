
import 'package:pas1_mobile_11pplg2_24/models/team_model.dart';
import 'package:pas1_mobile_11pplg2_24/utils/theme.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {

  final VoidCallback onClick;
  final VoidCallback onLike;
  final Team team;
  final bool liked;

  const ItemList({
    super.key, 
    required this.onClick,
    required this.onLike,
    required this.liked,
    required this.team
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(
              enableFeedback: true,
              maximumSize: const Size(double.infinity, 92),
              padding: EdgeInsets.zero,
              backgroundColor: AppTheme.backgroundLightColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
          child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: team.strBadge == null
                        ? null
                        : Image.network(team.strBadge),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(team.strTeam,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(height: 1.0),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false),
                        Text(team.strLeague,
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false)
                      ],
                    ),
                  ),
                  const SizedBox(width: 16,),
                  IconButton(
                    onPressed: onLike,
                    iconSize: 28, 
                    icon: Icon(
                      liked == true
                      ? Icons.favorite 
                      : Icons.favorite_border,
                    ),
                    color: liked == true
                      ? AppTheme.errorColorLight
                      : AppTheme.white50,
                  )
                ],
              ),
            ),
          ),
    );
  }
}
