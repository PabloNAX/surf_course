typedef Strategy = double Function(List, List);

class PokerPlayer {
  /// Список текущих карт в руке у игрока
  List _currentHand = ['King of clubs', 'Nine of hearts'];

  /// Субъективная оценка выигрыша
  double _surenessInWin = 0;

  /// Вычислить шансы на выигрыш
  void calculateProbabilities(List cardOnDesk, Strategy strategy) {
    _surenessInWin = strategy(cardOnDesk, _currentHand);
  }
}

void main() {
  final opponent = PokerPlayer();
  final Strategy fakeStrategy = (p0, p1) {
    print(p0);
    return 1;
  };
  opponent.calculateProbabilities(
      ['Nine of diamonds', 'king of hearts'], fakeStrategy);
}
