import 'dart:convert';

import 'package:pas1_mobile_11pplg2_24/models/team_model.dart';

TeamResponse getTeamResponseFromJson(String str) => TeamResponse.fromJson(json.decode(str));

String getTeamResponseToJson(TeamResponse data) => json.encode(data.toJson());

class TeamResponse {
    List<Team> teams;

    TeamResponse({
        required this.teams,
    });

    factory TeamResponse.fromJson(Map<String, dynamic> json) => TeamResponse(
        teams: List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "teams": List<dynamic>.from(teams.map((x) => x.toJson())),
    };
}