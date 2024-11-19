import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/apis/services/team_service.dart';
import 'package:pas1_mobile_11pplg2_24/controllers/user_controller.dart';
import 'package:pas1_mobile_11pplg2_24/models/team_model.dart';

class TeamController extends GetxController {
  UserController authController = Get.find();

  RxList<Team> teams = <Team>[].obs;
  Rx<bool> isLoading = true.obs;

  // Fetch team data (from API)
  Future<List<Team>> fetchTeams() async {

    // Fetch team data
    var result = await TeamService.fetchTeam();

    teams.value = result;
    isLoading.value = false;
    return result;
  }
}
