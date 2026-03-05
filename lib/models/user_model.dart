class UserModel {
  String id;
  String name;
  String email;
  List<Reward> rewards;

  UserModel({required this.id, required this.name, required this.email, this.rewards = const []});

  void addReward(Reward reward) {
    rewards.add(reward);
  }
}

class Reward {
  String rewardId;
  String description;
  DateTime dateClaimed;

  Reward({required this.rewardId, required this.description, required this.dateClaimed});
}