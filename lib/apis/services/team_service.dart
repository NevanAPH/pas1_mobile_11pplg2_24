import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg2_24/apis/api.dart';
import 'package:pas1_mobile_11pplg2_24/apis/models/team_model.dart';
import 'package:pas1_mobile_11pplg2_24/models/team_model.dart';

class TeamService {
  static Future<List<Team>> fetchTeam() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/search_all_teams.php?l=English Premier League')
      );

      // Parse the response
      TeamResponse userResponse = getTeamResponseFromJson(response.body);  // Debugging

      // Return the response
      return userResponse.teams;
      
    } on Error catch (e) {
      throw ApiTeamException(500, e.toString());
    }
  }
}

class ApiTeamException implements ApiException {
  @override
  String cause;
  int code;

  ApiTeamException(this.code, this.cause);
}
