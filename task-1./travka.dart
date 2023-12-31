enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  int areaInHectare;
  List<String> crops;
  List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  // Переопределяем оператор "==", что бы сравнивать объекты по значению
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};

// отдельная функция суммирует все года каждого трактора  и делит на количество тракторов
double calculateAverage(List<AgriculturalMachinery> machineries) {
  final currentYear = DateTime.now().year;
  int sum = 0;
  for (var machinery in machineries) {
    sum = sum + (currentYear - machinery.releaseDate.year);
  }

  return sum / machineries.length;
}

void main() {
  // пустой список территорий
  List<Territory> allTerritories = [];
  mapBefore2010.values.forEach((list) => allTerritories.addAll(list));
  mapAfter2010.values.forEach((list) => allTerritories.addAll(list));

  // уникальный сет всех машин собраных из территорий
  Set<AgriculturalMachinery> allMachineries = {};
  allTerritories
      .forEach((territory) => allMachineries.addAll(territory.machineries));

  // сет в лист
  List<AgriculturalMachinery> machineriesList = allMachineries.toList();

  // сортировка по дате , сначала старые
  machineriesList.sort((a, b) => a.releaseDate.compareTo(b.releaseDate));

  // средний возраст всех
  double averageAge = calculateAverage(machineriesList);
  print('средний возраст всех ${averageAge.floor()}');

  // половина отсортированных машин
  List<AgriculturalMachinery> halfMachineries =
      machineriesList.sublist(0, (machineriesList.length / 2).floor());

  //
  double averageAgeOldMachineries = calculateAverage(halfMachineries);
  print(
      'средний возраст половины самых старых  ${averageAgeOldMachineries.floor()} ');
}
