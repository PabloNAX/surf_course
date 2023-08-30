/// Задание — Спорт это классно!
///
abstract class Human {
  final String name;
  Human({required this.name});

  void printInfo();
}

class Gamer extends Human implements GameRole {
  final int playCount;
  final Team team;
  final int trophysCount;
  final String role;
  final PlayStyle playStyle;
  Gamer(
    this.playCount,
    this.team,
    this.trophysCount,
    this.role,
    this.playStyle, {
    required super.name,
  });

  @override
  void printGameRoleInfo() {
    print('role: ' + role);
  }

  @override
  void printInfo() {
    print('name: ' + name);
    print('role: ' + role);
    print('playCount: ' + playCount.toString());
  }
}

class Coach extends Human {
  final int trophysCount;
  final Team team;
  Coach(
    this.trophysCount,
    this.team, {
    required super.name,
  });

  @override
  void printInfo() {
    print('name: ' + name);
    print('trophysCount: ' + trophysCount.toString());
  }
}

class Team {
  final String name;
  final String country;
  final int trophysCount;
  final int totalTeamMemebers;
  Team(
    this.name,
    this.country,
    this.trophysCount,
    this.totalTeamMemebers,
  );
}

abstract class GameRole {
  void printGameRoleInfo();
}

enum PlayStyle {
  veryAgressive,
  agressive,
  passive,
  neutral,
}
