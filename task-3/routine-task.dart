void main() {
  while (true) { 
    if (нужноКудаТоДоехать) { 
      if (леньИдтиПешком) { 
        вызватьТакси(); 
      } else { 
        подготовитьсяКПрогулке();
        дойтиДоНазначенияПешком();
      } 
    } else { 
      continue; 
    } 
  } 
} 

void вызватьТакси() {
  for (var службаТакси in службыТакси) { 
    if (службаТакси.выбрана) { 
      выбратьТипАвтомобиля(); 
      сделатьЗаказ(); 
      break; 
    } else { 
      continue; 
    } 
  } 
} 

void выбратьТипАвтомобиля() {
  switch (потребностиВПоездке) { 
    case нуженКомфорт: 
      выбратьЛюксАвто(); 
      break; 
    case экономия: 
      выбратьЭкономАвто(); 
      break; 
  } 
}
