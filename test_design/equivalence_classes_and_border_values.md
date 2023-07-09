# Классы эквивалентности и граничные значения

> ## Пароль

<table style='width:100%' >
    <thead>
      <tr align='center'>
        <th >Классы Эквивалентности</th>
        <th>Значения</th>
        <th>Тестовые данные позитивные</th>
        <th>Тестовые данные негативные</th>
      </tr>
      <thead>
      <tr align='center'>
        <th >Требования к паролю </th>
        <th></th>
        <th></th>
        <th></th>
      </tr>
        <tr align='center'>
        <th >Буквы верхнего регистра</th>
        <th>AGB</th>
        <th>Af4&^㊞㊢ ♞♚</th>
        <th>ff4&^㊞㊢ ♞♚ Без верхнего регистра</th>
      </tr>
      <tr align='center'>
        <th >Буквы нижнего регистра</th>
        <th>fgh</th>
        <th>-</th>
        <th>ВА4&^㊞㊢ ♞♚ Без нижнего регистра</th>
      </tr>
      <tr align='center'>
        <th >Цифры</th>
        <th>425</th>
        <th>-</th>
        <th>ВdА&^㊞㊢ ♞♚	Нет цифр</th>
      </tr>
      <tr align='center'>
        <th >Cпециальные символы</th>
        <th>~!@#$%^&*_-+='|\(){}[]:;"<>,.? /</th>
        <th>-</th>
        <th>Af4㊞㊢ ♞♚	Нет спец. символов</th>
      </tr>
       <tr align='center'>
        <th >Символы др. языка</th>
        <th>㊞㊢㊥㊧㊰</th>
        <th>-</th>
        <th>Af4&^ ♞♚ Нет символов др. языка</th>
      </tr>
       <tr align='center'>
        <th >Пробелы</th>
        <th> </th>
        <th>-</th>
        <th>Af4&^㊞㊢♞♚	Нет пробела</th>
      </tr>
        <tr align='center'>
        <th >Эмодзи</th>
        <th>✞♡♞♚</th>
        <th>-</th>
        <th>Af4&^㊞㊢ Нет эмодзи</th>
      </tr>
       <tr align='center'>
        <th >Количество символов от 8-12</th>
        <th>-</th>
        <th>-</th>
        <th>Af4^㊢ ♚Недостаточно символов</th>
      </tr>
       <tr align='center'>
        <th >Граничные значения</th>
        <th></th>
        <th></th>
        <th></th>
      </tr>
       <tr align='center'>
        <th >Количество символов 7</th>
        <th>-</th>
        <th>-</th>
        <th>Af4^㊞ ♞</th>
      </tr>
       <tr align='center'>
        <th >Количество символов 8</th>
        <th>-</th>
        <th>Af4&^㊞ ♞</th>
        <th>-</th>
      </tr>
        <tr align='center'>
        <th >Количество символов 9</th>
        <th>-</th>
        <th>Af4&^㊞㊢ ♞</th>
        <th>-</th>
      </tr>
       <tr align='center'>
        <th >Количество символов 11</th>
        <th>-</th>
        <th>Af4&^㊞㊢ ♞♚h</th>
        <th>-</th>
      </tr>
       <tr align='center'>
        <th >Количество символов 12</th>
        <th>-</th>
        <th>Af4&^㊞㊢ ♞♚hr</th>
        <th>-</th>
      </tr>
        <tr align='center'>
        <th >Количество символов 13</th>
        <th>-</th>
        <th>-</th>
        <th>Af4&^㊞㊢ ♞♚rhs</th>
      </tr>
