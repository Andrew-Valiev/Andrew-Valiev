# Классы эквивалентности и граничные значения

> ## Пароль

<table style='width:100%' >
    <thead>
      <tr align='center'>
        <th >КЛАССЫ ЭКВИВАЛЕНТНОСТИ</th>
        <th>Значения</th>
        <th>Тестовые данные позитивные</th>
        <th>Тестовые данные негативные</th>
      </tr>
      <tr align='center'>
        <th >Требования к паролю </th>
        <th></th>
        <th></th>
        <th></th>
      </tr>
        <tr align='center'>
        <th >Буквы верхнего регистра</th>
        <th>AGB</th>
        <th>Af4&^?:GJ</th>
        <th>ff4&#kds Без верхнего регистра</th>
      </tr>
      <tr align='center'>
        <th >Буквы нижнего регистра</th>
        <th>fgh</th>
        <th>-</th>
        <th>ВА4&^GDFK Без нижнего регистра</th>
      </tr>
      <tr align='center'>
        <th >Цифры</th>
        <th>425</th>
        <th>-</th>
        <th>ВdА&^AGKs Нет цифр</th>
      </tr>
      <tr align='center'>
        <th >Cпециальные символы</th>
        <th>~!@#$%^&*_-+='|\(){}[]:;"<>,.? /</th>
        <th>-</th>
        <th>Af474kdws Нет спец. символов</th>
      </tr>
       <tr align='center'>
        <th >Пробелы</th>
        <th> </th>
        <th>-</th>
        <th>Af4&^  GJ sa</th>
      </tr>
      </tr>
       <tr align='center'>
        <th >Количество символов от 8-12</th>
        <th>-</th>
        <th>-</th>
        <th>Af4^fgd Недостаточно символов</th>
       <tr align='center'>
        <th>ГРАНИЧНЫЕ ЗНАЧЕНИЯ</th>
        <th></th>
        <th></th>
        <th></th>
      </tr>
       <tr align='center'>
        <th >Количество символов 7</th>
        <th>-</th>
        <th>-</th>
        <th>Af4^gds</th>
      </tr>
       <tr align='center'>
        <th >Количество символов 8</th>
        <th>-</th>
        <th>Af4&^Lwa</th>
        <th>-</th>
      </tr>
        <tr align='center'>
        <th >Количество символов 9</th>
        <th>-</th>
        <th>Af4&^lfBm</th>
        <th>-</th>
      </tr>
       <tr align='center'>
        <th >Количество символов 11</th>
        <th>-</th>
        <th>Af4&jg%&hrh</th>
        <th>-</th>
      </tr>
       <tr align='center'>
        <th >Количество символов 12</th>
        <th>-</th>
        <th>Af4&*hesF@hr</th>
        <th>-</th>
      </tr>
        <tr align='center'>
        <th >Количество символов 13</th>
        <th>-</th>
        <th>-</th>
        <th>Af4&_fs!.grhs</th>
      </tr>
  </thead>
</table>  

---

> ## Фильтр диапазон цен

* тестовые данные применять к 2 полям диапазона цен "от и до"

<table style='width:100%'>
<tbody>
<tr>
<td>КЛАССЫ ЭКВИВАЛЕНТНОСТИ</td>
<td> Значения</td>
<td> Тестовые данные позитивные</td>
<td> Тестовые данные негативные</td>
</tr>
<tr>
<td>Буквы верхнего регистра</td
><td> AGB</td>
<td> -</td>
<td> КЕН</td>
</tr>
<tr>
<td>Буквы нижнего регистра</td>
<td> fgh</td>
<td> -</td>
<td> djkf</td>
</tr>
<tr>
<td>Цифры</td>
<td> 425</td>
<td> 50-60</td>
<td> -100 - -50</td>
</tr>
<tr>
<td>Cпециальные символы</td>
<td> ~!@#$%^&*_-+='|\(){}[]:;"<>.?/ </td>
<td>- </td><td> +10</td></tr>
<tr>
<td>Пробелы</td>
<td> </td>
<td> 15 пробел в конце и в начале</td>
<td> -</td>
</tr>
<tr>
<td>Диапазон цен</td
><td> 7455</td>
<td> 1000-7000</td>
<td> 3000-1000</td>
</tr>
<tr>
<td>Количество символов от 1-8</td>
<td>-</td>
<td>-</td>
<td> -</td>
</tr>
<tr>
<td>ГРАНИЧНЫЕ ЗНАЧЕНИЯ </td>
<td> </td>
<td> </td>
<td> </td>
</tr>
<tr>
<td>Количество символов 0</td>
<td>-</td>
<td>-</td>
<td>-</td>
</tr>
<tr>
<td>Количество символов 1</td>
<td>-</td>
<td> 5-6</td>
<td> -5 - -6</td>
</tr>
<tr>
<td>Количество символов 2</td>
<td>-</td>
<td> 50-98</td>
<td> -50 - -98</td>
</tr>
<tr>
<td>Количество символов 5</td>
<td>-</td>
<td> 50842-98786</td>
<td> -50753 - -98753</td>
</tr>
<tr>
<td>Количество символов 7</td>
<td>-</td>
<td> 5084275-9878642</td>
<td> -5075342 - -9875375</td>
</tr>
<tr>
<td>Количество символов 8</td>
<td>-</td>
<td> 50842759-98786424</td>
<td> -50753422 - -91875375</td>
</tr>
<tr>
<td>Количество символов 9</td>
<td>-</td>
<td>-</td>
<td> 507534422-918675375</td>
</tr>
</tbody>
</table>

> ## Email

<table style='width:100%'>
<tbody>
<tr><td>КЛАССЫ ЭКВИВАЛЕНТНОСТИ</td><td> Значения</td><td> Тестовые данные позитивные</td><td> Тестовые данные негативные</td></tr>
<tr><td>Буквы верхнего регистра</td><td> A-Z</td><td> PION@GOOGLE.COM</td><td>-</td></tr>
<tr><td>Буквы нижнего регистра</td><td> a-z</td><td> pion@google.com</td><td>-</td></tr>
<tr><td>Цифры</td><td> 0-9</td><td> pion2356@google.com</td><td>-</td></tr>
<tr><td>Cпециальные символы</td><td> !#$%&'*+-/=?^_`{|}~ </td><td> pion-cs@google.com <br> "()<>[]:;@\\"!#$%&'-/=?^_`{}| ~.a"@google.com </td><td> pion\cs@google.com <br> a"b(c)de:f;gi[j\k]l@example.com <br> (ни один из специальных символов в локальной части не разрешен вне кавычек)</td></tr>
<tr><td>Пробелы</td><td> </td><td> pion@google.com <br> пробел в конце или в начале</td><td> pion cs@google.com</td>
</tr>
<tr><td>Точка</td><td> .</td><td> pion.cs@google.com</td><td> pion..cs@google.com <br> pion.cs@google..com <br> pion@googlecom</td></tr>
<tr><td>Символ @</td><td>@</td> <td> pion@google.com</td><td> piongoogle.com <br> pion@@google.com</td></tr>
<tr><td>Домен первого уровня</td><td> com</td><td> pion@google.com</td><td> pion@google.</td></tr>
<tr><td>домен второго уровня</td><td> google</td><td> pion@google.com</td><td> pion@.com</td></tr>
<tr><td>Количество символов от 12-30</td><td>-</td><td>-</td><td> -</td></tr>
<tr><td>ГРАНИЧНЫЕ ЗНАЧЕНИЯ </td><td> </td><td> </td><td> </td></tr>
<tr><td>Количество символов 11</td><td>-</td><td>-</td><td>@google.com</td></tr>
<tr><td>Количество символов 12</td><td>-</td><td>p@google.com</td><td>-</td></tr>
<tr><td>Количество символов 13</td><td>-</td><td> pi@google.com</td><td>-</td></tr>
<tr><td>Количество символов 20</td><td>-</td><td> pion-cswer@google.com</td><td>-</td></tr>
<tr><td>Количество символов 29</td><td>-</td><td> pion-cswer100ersdqp@google.com</td><td>-</td></tr>
<tr><td>Количество символов 30</td><td>-</td><td> pion-cswer100ersedqp@google.com</td><td>-</td></tr>
<tr><td>Количество символов 31</td><td>-</td><td>-</td><td>pion-cswer100erseddqp@google.com</td></tr>
</tbody>
</table>