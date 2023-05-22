# ![bash][linkBash]

## Язык обработки данных `awk`

---

>### Вызов `awk`

* запись это строка в файле
* поле это слово в строке
* ключи командной строки awk
* `-F` `fs` — позволяет указать символ-разделитель для полей в записи
* `-f` `file` — указывает имя файла, из которого нужно прочесть awk-скрипт
* `-v` `var=value` — позволяет объявить переменную и задать её значение по умолчанию, которое будет использовать awk
* `-mf` `N` — задаёт максимальное число полей для обработки в файле данных
* `-mr` `N` — задаёт максимальный размер записи в файле данных
* `-W` `keyword` — позволяет задать режим совместимости или уровень выдачи предупреждений awk

>### Чтение `awk-скриптов` из командной строки

* скрипты `awk`, можно писать прямо в командной строке `'{}'`
* `awk '{print "Welcome to awk command tutorial"}'`
* чтобы завершить работу awk, нужно передать ему символ конца файла (EOF, End-of-File)
* или сочетание клавиш `CTRL + D`

>### Позиционные переменные, хранящие данные полей

* по умолчанию `awk` назначает следующие переменные каждому полю данных, обнаруженному им в записи
  * `$0` — представляет всю строку текста (запись)
  * `$1` — первое поле
  * `$2` — второе поле
  * `$n` — n-ное поле
* поля выделяются из текста с использованием символа-разделителя
* по умолчанию — это пробелы или символа табуляции
* `awk '{print $1}' d00.txt` каждому первому слову, до пробела в строке будет присвоено значение `$1`
* `awk '{print $1 $2 $3}' d00.txt` вывод полей со значениями `$1 $2 $3`
* `awk -F# '{print $1}' d00.txt` `-F#` в качестве разделителя поля используется `#`, но может быть и любой другой

>### Использование нескольких команд `;`

* `echo "My name is Tom" | awk '{$4="Adam"; print $0}'` первая команда записывает новое значение в переменную $4, а вторая выводит на экран всю строку

>### Чтение скрипта `awk` из файла `-f`

* `{print $1 " has a  home directory at " $2}` создаем файл `d0.txt`
* `awk -F: -f d0.txt d00.txt` вызовем `awk`, указав `d0.txt` файл в качестве источника команд
* или в файл `d0.txt` можно записать и в таком формате

```bash
{
text = " has a  home directory at "
print $1 text $2
}
```

>### Выполнение команд до начала обработки данных `BEGIN`

* `awk 'BEGIN {print "Hello World!"}'` команды, которые следуют за `BEGIN`, будут исполнены до начала обработки данных
* `awk 'BEGIN {print "The File Contents:"}`\
`{print $0}' d00.txt` немного более сложный пример
* будьте внимательны с одинарными кавычками, используя подобные конструкции в командной строке

>### Выполнение команд после окончания обработки данных `END`

* `awk 'BEGIN {print "The File Contents:"}`\
`{print $0}`\
`END {print "End of File"}' d00.txt`
* создаем файл `d0.txt`

```bash
BEGIN {
print "The latest list of users and shells"
print " UserName \t HomePath" # \t знак табуляции 4 пробела на tab 
print "-------- \t -------"
FS=":" # в этом же разделе мы указываем символ-разделитель
}
{
print $1 " \t " $6
}
END {
print "The end"
}
```

* `awk -f d0.txt  /etc/passwd` запустим скрипт

>### Встроенные переменные: настройка процесса обработки данных

* `FIELDWIDTHS` — разделённый пробелами список чисел, определяющий точную ширину каждого поля данных с учётом разделителей полей
  * позволяет читать записи без использования символа-разделителя полей
  * в некоторых случаях, вместо использования разделителя полей, данные в пределах записей расположены в колонках постоянной ширины
  * в подобных случаях необходимо задать переменную `FIELDWIDTHS` таким образом, чтобы её содержимое соответствовало особенностям представления данных
  * при установленной переменной `FIELDWIDTHS` `awk` будет игнорировать переменную `FS`
* `FS` — позволяющая задавать символ-разделитель полей
* `RS` — переменная, которая позволяет задавать символ-разделитель записей
* `OFS` — разделитель полей на выводе awk-скрипта в терминале
  * по умолчанию переменная OFS настроена на использование пробела
  * используется для отображения разделителя в терминале
* `ORS` — разделитель записей на выводе awk-скрипта

* `awk 'BEGIN{FS=":"; OFS="-"} {print $1,$6,$7}' /etc/passwd`

* создаем файл `d0.txt`
  * 1235.9652147.91\
927-8.365217.27\
36257.8157492.5
* известно, что внутренняя организация этих данных соответствует шаблону 3-5-2-5, то есть, первое поле имеет ширину 3 символа, второе — 5, и так далее
* `awk 'BEGIN{FIELDWIDTHS="3 5 2 5"}{print $1,$2,$3,$4}' d0.txt`

* по умолчанию `RS` и `ORS` установлены на символ перевода строки
* `awk` воспринимает каждую новую строку текста как новую запись и выводит каждую запись с новой строки
* создаем файл `d2.txt` с кодировкой `UTF-8` `LF`
  * Person Name\
123 High Street\
(222) 466-1234

  * Another person\
487 High Street\
(523) 643-8754
* `awk 'BEGIN{FS="\n"; RS=""} {print $1,$2,$3}' d2.txt`
* в `FS` надо записать символ перевода строки
* это укажет `awk` на то, что каждая строка в потоке данных является отдельным полем
* в `RS` пустую строку
* в файле блоки данных о разных людях разделены пустой строкой
* в результате `awk` будет считать пустые строки разделителями записей

>### Встроенные переменные: сведения о данных и об окружении

* `ARGC` — общее число аргументов командной строки
* `ARGV` — массив с аргументами командной строки
* `ARGIND` — индекс текущего обрабатываемого файла в массиве ARGV
* `ENVIRON` — ассоциативный массив с переменными окружения и их значениями
* `ERRNO` — код системной ошибки, которая может возникнуть при чтении или закрытии входных файлов
* `FILENAME` — имя входного файла с данными
* `FNR` — покажет число записей, обработанных в текущем файле
* `IGNORECASE` — если эта переменная установлена в ненулевое значение, при обработке игнорируется регистр символов
* `NF` — общее число полей данных в текущей записи
* `NR` — общее число обработанных записей

* `awk 'BEGIN{print ARGC,ARGV[1]}' d2.txt` узнаем, что
  * `ARGC` общее число аргументов командной строки — 2
  * индекс 1 в массиве `ARGV` записано имя обрабатываемого файла
  * массив с индексом 0 в данном случае будет `«awk»`

* переменная `ENVIRON` представляет собой ассоциативный массив с переменными среды
* `awk '`\
`BEGIN{` \
`print ENVIRON["HOME"]`\
`print ENVIRON["PATH"]`\
`}'`
* или так
* `echo | awk -v home=$HOME '{print "My home is " home}'`

* переменная `NF` позволяет обращаться к последнему полю данных в записи, не зная его точной позиции
* `awk 'BEGIN{FS=":"; OFS=":"} {print $1,$NF}' /etc/passwd` `NF` добавит к первому полю самое последнее поле в строке

* переменная `FNR` покажет число записей, обработанных в текущем файле
  * передача одного и того же файла дважды равносильна передаче двух разных файлов
  * обратите внимание на то, что `FNR` сбрасывается в начале обработки каждого файла
  * `awk 'BEGIN{FS=","}{print $1,"FNR="FNR}' d2.txt d2.txt` `FNR` пронумерует строки

* переменная `NR` хранит общее число обработанных записей
  * `awk '`\
`BEGIN {FS=","}`\
`{print $1,"FNR="FNR,"NR="NR}`\
`END{print "There were",NR,"records processed"}' d2.txt d2.txt`

>### Пользовательские переменные `awk`

* имена переменных могут включать в себя буквы, цифры, символы подчёркивания
* и они не могут начинаться с цифры
* `awk '`\
`BEGIN{`\
`test="This is a test"`\
`print test`\
`}'`

>### Оператор `if` в `awk`

* создаем файл `d2.txt` с кодировкой `UTF-8` `LF`
  * `10`\
`15`\
`6`\
`33`\
`45`

* `awk '{if ($1 > 20) print $1}' d2.txt` выводит числа из этого файла, большие 20

* если нужно выполнить в блоке `if` несколько операторов, их нужно заключить в фигурные скобки
  * `awk '{`\
`if ($1 > 20)`\
`{`\
`x = $1 * 2`\
`print x`\
`}`\
`}' d2.txt`\

* `if else`
  * `awk '{`\
`if ($1 > 20)`\
`{`\
`x = $1 * 2`\
`print x`\
`} else`\
`{`\
`x = $1 / 2`\
`print x`\
`}}' d2.txt`\

* или так
* после ветви `if`, сразу перед `else`, надо поставить `;`
* `awk '{if ($1 > 20) print $1 * 2; else print $1 / 2}' d2.txt`

>### Цикл `while`

* создаем файл `d2.txt` с кодировкой `UTF-8` `LF`
  * 124 127 130\
112 142 135\
175 158 245

* цикл `while` перебирает поля каждой записи, накапливая их сумму в переменной `total`
* `$i` вместо `i` будут подставляться цифры итерации, которые будут соответствовать полю в строке записи `$1, $2, $3`
* поэтому объявляем `i = 1` иначе при `i = 0` у нас в `total`, будет выводиться вся запись (строка), которая имеет значение `$0`
* операторы `+=` и `-=` используются для увеличения / уменьшения значения левого операнда на значение, указанное после оператора
* `,` используется вместо пробела
* создаем скрипт `test.sh`

```bash
awk '{
total = 0
i = 1
while (i < 4)
{
total += $i # $i 
i++
}
avg = total / 3
print "Average:",avg 
}' d2.txt
```

>### Цикл `while` `break`

```bash
awk '{
total = 0
i = 1
while (i < 4)
{
total += $i
if (i == 2)
break
i++
}
avg = total / 2
print "The average of the first two elements is:",avg
}' d2.txt
```

>### Цикл `for`

```bash
awk '{
total = 0
for (i = 1; i < 4; i++)
{
total += $i
}
avg = total / 3
print "Average:",avg
}' d2.txt
```

>### Форматированный вывод данных `printf`

* команда `printf` в `awk` позволяет выводить форматированные данные
* cпецификатор форматирования это специальный символ, который задаёт тип выводимых данных
* первый спецификатор соответствует первой переменной, второй спецификатор — второй, и так далее
  * `c` — воспринимает переданное ему число как код ASCII-символа и выводит этот символ
  * `d` — выводит десятичное целое число
  * `i` — то же самое, что и d
  * `e` — выводит число в экспоненциальной форме
  * `f` — выводит число с плавающей запятой
  * `g` — выводит число либо в экспоненциальной записи, либо в формате с плавающей запятой, в зависимости от того, как получается короче
  * `o` — выводит восьмеричное представление числа
  * `s` — выводит текстовую строку

```bash
awk 'BEGIN{
x = 100 * 100
printf "The result is: %e\n", x
}'
```

>### Встроенные математические функции

* `cos(x)` — косинус x (x выражено в радианах)
* `sin(x)` — синус x
* `exp(x)` — экспоненциальная функция
* `int(x)` — возвращает целую часть аргумента
* `log(x)` — натуральный логарифм
* `rand()` — возвращает случайное число с плавающей запятой в диапазоне 0 — 1
* `sqrt(x)` — квадратный корень из x

```bash
awk 'BEGIN{x=exp(5); print x}'
```

>### Строковые функции `toupper`

* преобразует символы к верхнему регистру

```bash
awk 'BEGIN{x = "pion"; print toupper(x)}'
```

>###  Пользовательские функции

```bash
awk '
function myprint()
{
printf "The user %s has home path at %s\n", $1,$6
}
BEGIN{FS=":"}
{
myprint()
}' /etc/passwd
```

---

[linkBash]: https://img.shields.io/badge/-BASH-190004?style=for-the-badge&logo=image%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw%2FeHBhY2tldCBiZWdpbj0i77u%2FIiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8%2BIDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDg2QTAyQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkE3MDg2QTAzQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QTcwODZBMDBBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QTcwODZBMDFBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciLz4gPC9yZGY6RGVzY3JpcHRpb24%2BIDwvcmRmOlJERj4gPC94OnhtcG1ldGE%2BIDw%2FeHBhY2tldCBlbmQ9InIiPz6lm45hAAADkklEQVR42qyVa0yTVxzGn7d9Wy03MS2ii8s%2BeokYNQSVhCzOjXZOFNF4jx%2BMRmPUMEUEqVG36jo2thizLSQSMd4N8ZoQ8RKjJtooaCpK6ZoCtRXKpRempbTv5ey83bhkAUphz8fznvP8znn%2B%2F3NeEEJgNBoRRSmz0ub%2FfuxEacBg%2FDmYtiCjgo5NG2mBXq%2BH5I1ogMRk9Zbd%2BQU2e1ML6VPLOyf5tvBQ8yT1lG10imxsABm7SLs898GTpyYynEzP60hO3trHDKvMigUwdeaceacqzp7nOI4n0SSIIjl36ao4Z356OV07fSQAk6xJ3XGg%2BLCr1d1OYlVHp4eUHPnerU79ZA%2F1kuv1JQMAg%2BE4O2P23EumF3VkvHprsZKMzKwbRUXFEyTvSIEmTVbrysp%2BWr8wfQHGK6WChVa3bKUmdWou%2BjpArdGkzZ41c1zG%2Fu5uGH4swzd561F%2BuhIT4%2BLnSuPsv9%2BJKIpjNr9dXYOyk7%2FBZrcjIT4eCnoKgedJP4BEqhG77E3NKP31FO7cfQA5K0dSYuLgz2TwCWJSOBzG6crzKK%2BohNfni%2Bx6OMUMMNe%2Fgf7ocbw0v0acKg6J8Ql0q%2BT%2FAXR5PNi5dz9c71upuQqCKFAD%2BYhrZLEAmpodaHO3Qy6TI3NhBpbrshGtOWKOSMYwYGQM8nJzoFJNxP2HjyIQho4PewK6hBktoDcUwtIln4PjOWzflQ%2Be5yl0yCCYgYikTclGlxadio%2BBQCSiW1UXoVGrKYwH4RgMrjU1HAB4vR6LzWYfFUCKxfS8Ftk5qxHoCUQAUkRJaSEokkV6Y%2F%2BJUOC4hn6A39NVXVBYeNP8piH6HeA4fPbpdBQV5KOx0QaL1YppX3Jgk0TwH2Vg6S3u%2BdB91%2B%2FpuNYPYFl5uP5V7ZqvsrX7jxqMXR6ff3gCQSTzFI0a1TX3wIs8ul%2Bq4HuWAAiM39vhOuR1O1fQ2gT%2F26Z8Z5vrl2OHi9OXZn995nLV9aFfS6UC9JeJPfuK0NBohWpCHMSAAsFe74WWP%2BvT25wtP9Bpob6uGqqyDnOtaeumjRu%2ByFu36VntK%2FPA5umTJeUtPWZSU9BCgud661odVp3DZtkc7AnYR33RRC708PrVi1larW7XwZIjLnd7R6SgSqWSNjU1B3F72pz5TZbXmX5vV81Yb7Lg7XT%2FUXriu8XLVqw6c6XqWnBKiiYU%2BMt3wWF7u7i91XlSEITwSAZ%2FCzAAHsJVbwXYFFEAAAAASUVORK5CYII%3D
