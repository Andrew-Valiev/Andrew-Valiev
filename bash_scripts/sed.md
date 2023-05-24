# ![bash][linkBash]

## Sed

---

>### Основы работы с sed

* `echo "This is a test" | sed 's/test/another test/'` временная замена текста
* `sed` заменяет слово `«test»` в строке, словами `«another test»`
* для оформления правила обработки текста, заключённого в кавычки, используются прямые слэши
* `sed` не меняет данные в обрабатываемом файле
* `sed 's|Loop|петля|' ./f4.txt` замена текста в файле

>### Ключи `sed`

* `-n`, --quiet - подавляет вывод строк в терминал
* `-e` - для выполнения нескольких команд с данными
* `-f` - чтение команд из файла
* `-i` - сделать резервную копию файла перед редактированием
* `-l` - указать свою длину строки
* `-r` - включить поддержку расширенного синтаксиса регулярных выражений
* `-s` - если передано несколько файлов, рассматривать их как отдельные потоки, а не как один длинный

>### Команды редактирования `sed`

* `#` - комментарий, не выполняется
* `q` - завершает работу сценария
* `d` - удаляет буфер шаблона и запускает следующую итерацию цикла
* `p` - вывести содержимое буфера шаблона
* `n` - вывести содержимое буфера шаблона и прочитать в него следующую строку
* `s`/что_заменять/на_что_заменять/опции - замена символов, поддерживаются регулярные выражения
* `y`/символы/символы - позволяет заменить символы из первой части на соответствующие символы из второй части
* `w` - записать содержимое буфера шаблона в файл
* `N` - добавить перевод строки к буферу шаблона
* `D` - если буфер шаблона не содержит новую строку, удалить его содержимое и начать новую итерацию цикла, иначе удалить содержимое буфера до символа перевода строки и начать новую итерацию цикла с тем, что останется
* `g` - заменить содержимое буфера шаблона, содержимым дополнительного буфера;
* `G` - добавить новую строку к содержимому буфера шаблона, затем добавить туда же содержимое дополнительного буфера
* команда `i` добавляет новую строку перед заданной
* команда `a` добавляет новую строку после заданной
* команда `c` заменяет нужную строку
* команда `=` выведет номера строк
* команда `r` вставка данных из файла

>### Выполнение несколько команд `sed -e`

* комвнды нужно разделить `;` между окончанием команды и `;` не должно быть пробела
* `sed -e 's/#/--/; s/Loop/ test/' ./f4.txt` используем несколько команд по замене текста
* другая форма записи в скрипте

```bash
sed -e '
s/#/--/; 
s/Loop/ test/' ./f4.txt
```

* другая форма записи в консоли

```bash
sed -e "
s|#|--|;
s|Loop| test|" ./f4.txt
```

```bash
sed -e "
s/#/--/;
s/Loop/ test/" ./f4.txt
```

>### Чтение команд из файла ключ `-f`

* Если имеется множество команд sed, обычно удобнее всего предварительно записать их в файл
* создать файл `d0.txt` с командами

```bash
s/#/--/
s/Loop/ test/
```

* `sed -f d0.txt f4.txt` запустить в консоли

>### Флаги команды замены

* `sed 's|Loop|петля|' ./f4.txt` `s` команда замены заменяет только первый искомый текст в каждой строке
* `sed 's|Loop|петля|2' ./f4.txt` флаг `2` цифра укажет, что нужно заменить только второе слово в строке
* `sed  's/Loop/ test/g' ./f4.txt` флаг `g` заменит все слова в строке
* `sed -n 's/Loop/ test/p' ./f4.txt` `n` подавляет вывод строк в терминал, флаг `p` выводит только, те строки в которых, есть совпадение
* `sed 's|Loop| test|w d00.txt' ./f4.txt` флаг `w` позволяет сохранить в отдельном файле измененные строки
* `sed 's/Loop/ test/i' ./f4.txt` `i` выполнить поиск без учёта регистра

>### Символы-разделители `\`

* разделителем считается первый символ, который будет встречен после s
* для временного изменения строки `/d001/test` на `/d001/cycle` в файле `d00.txt`
* `sed 's/\/d001\/test/\/d001\/cycle/' /home/pion/ho/d00.txt` используя символ разделителя `\` становиться трудно читать команду, потому что их нужно экранировать,  но символ можно заменить на любой другой для удобного восприятия
* `sed 's!/d001/test!/d001/cycle!' /home/pion/ho/d00.txt` вместо символа разделителя `\` мы используем `!` можно указать любой символ разделителя в начале команды
* `sed 's!d00.txt-test!/d00.txt-cycle!' /home/pion/ho/d00.txt` слэш в начале не используется и пробел тоже, после `!` сразу пишем данные строки

>### Выбор фрагментов текста для обработки

* `sed '2s/test/loop/g' d00.txt` замена текста только во 2-ой строке
* `sed '2,5s/test/loop/' d00.txt` диапазон строк `2,5`
* `sed '4,$s/test/loop/' d00.txt` замена текста с `4` строки `$` и до конца
* `sed -n '/pion/s/bash/csh/p' d00.txt` замена строки, соответствующая заданному фильтру
* шаблон передаётся перед именем команды `s`

>### Удаление строк `d`

* если не указать номер удаляемой строки, удалены будут все строки потока
* `sed '3d' d00.txt` удалить 3-ю строку в файле временно
* `sed '2,5d' d00.txt` удалить диапазон строк с 2-ой по 5
* `sed '2,$d' d00.txt` удалить диапазон строк с 2-ой по последнюю
* `sed '/test/d' d00.txt` удаление строк по нужному тексту
* `sed '/test/,/bash bash/d' d00.txt` удаление строк по нескольким шаблонам
* `sed '$d' d00.txt` `$` удалить последнюю строку файла
* `sed 'test$d' d00.txt`
* `sed '/[en]$/d' d00.txt` удалить по нескольким символам
* `sed -ne '/[st]$/d;s/isth/[isth]/p' d2.txt` команды читается с право налево в обратном порядке

>### Вставка текста в поток `i` и `a`

* команда `i` добавляет новую строку перед заданной
* команда `a` добавляет новую строку после заданной
* `echo "Another test" | sed 'i\First test '` добавляет новую строку перед заданной
* `echo "Another test" | sed 'a\First test '` добавляет новую строку после заданной
* `sed '2i\This is the inserted line.' d00.txt` добавляет новую строку перед 2-ой строкой в файле
* `sed '4a\This is the inserted line.' d00.txt` добавляет новую строку после 4-ой строки в файле

>### Замена строк `c`

* `sed '4c\This is a modified line.' d00.txt` замена 4-ой строки
* если воспользоваться шаблоном в виде обычного текста или регулярного выражения, заменены будут все соответствующие шаблону строки
* `sed '/test #/c This is a changed line of text.' d00.txt`

>### Использование переменных в скрипте `sed`

* кавычки не одинарные, а двойные
* имя переменной заключается в фигурные скобки
* `sed "s/${1}/${2}/g" path_to_my_file`

>### Измение цвета в `sed`

* `\x1B[31m&\x1B[0m` измение цвета искомого параметра на красный
* `s/${1}/\x1B[31m&\x1B[0m/ig;`

>### Замена символов `y`

* `sed 'y/123/567/' d00.txt` заменить символы `1, 2, 3` на символы `5, 6, 7` везде

>### Вывод номеров строк

* `sed '=' d00.txt` выведет номера строк
* `sed -n '/test/=' d00.txt` выведет только номера строк, соответствующие шаблону

>### Чтение данных для вставки из файла `r`

* в качестве источника данных можно воспользоваться файлом
* можно указать номер строки, после которой надо вставить содержимое файла, или шаблон
* `sed '3r d2.txt' d00.txt` вставка данных из файла в нужную строку
* `sed '/test/r d2.txt' d00.txt` вставка данных из файла в каждую строку, где есть шаблон

---

[linkBash]: https://img.shields.io/badge/-BASH-190004?style=for-the-badge&logo=image%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw%2FeHBhY2tldCBiZWdpbj0i77u%2FIiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8%2BIDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDg2QTAyQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkE3MDg2QTAzQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QTcwODZBMDBBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QTcwODZBMDFBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciLz4gPC9yZGY6RGVzY3JpcHRpb24%2BIDwvcmRmOlJERj4gPC94OnhtcG1ldGE%2BIDw%2FeHBhY2tldCBlbmQ9InIiPz6lm45hAAADkklEQVR42qyVa0yTVxzGn7d9Wy03MS2ii8s%2BeokYNQSVhCzOjXZOFNF4jx%2BMRmPUMEUEqVG36jo2thizLSQSMd4N8ZoQ8RKjJtooaCpK6ZoCtRXKpRempbTv5ey83bhkAUphz8fznvP8znn%2B%2F3NeEEJgNBoRRSmz0ub%2FfuxEacBg%2FDmYtiCjgo5NG2mBXq%2BH5I1ogMRk9Zbd%2BQU2e1ML6VPLOyf5tvBQ8yT1lG10imxsABm7SLs898GTpyYynEzP60hO3trHDKvMigUwdeaceacqzp7nOI4n0SSIIjl36ao4Z356OV07fSQAk6xJ3XGg%2BLCr1d1OYlVHp4eUHPnerU79ZA%2F1kuv1JQMAg%2BE4O2P23EumF3VkvHprsZKMzKwbRUXFEyTvSIEmTVbrysp%2BWr8wfQHGK6WChVa3bKUmdWou%2BjpArdGkzZ41c1zG%2Fu5uGH4swzd561F%2BuhIT4%2BLnSuPsv9%2BJKIpjNr9dXYOyk7%2FBZrcjIT4eCnoKgedJP4BEqhG77E3NKP31FO7cfQA5K0dSYuLgz2TwCWJSOBzG6crzKK%2BohNfni%2Bx6OMUMMNe%2Fgf7ocbw0v0acKg6J8Ql0q%2BT%2FAXR5PNi5dz9c71upuQqCKFAD%2BYhrZLEAmpodaHO3Qy6TI3NhBpbrshGtOWKOSMYwYGQM8nJzoFJNxP2HjyIQho4PewK6hBktoDcUwtIln4PjOWzflQ%2Be5yl0yCCYgYikTclGlxadio%2BBQCSiW1UXoVGrKYwH4RgMrjU1HAB4vR6LzWYfFUCKxfS8Ftk5qxHoCUQAUkRJaSEokkV6Y%2F%2BJUOC4hn6A39NVXVBYeNP8piH6HeA4fPbpdBQV5KOx0QaL1YppX3Jgk0TwH2Vg6S3u%2BdB91%2B%2FpuNYPYFl5uP5V7ZqvsrX7jxqMXR6ff3gCQSTzFI0a1TX3wIs8ul%2Bq4HuWAAiM39vhOuR1O1fQ2gT%2F26Z8Z5vrl2OHi9OXZn995nLV9aFfS6UC9JeJPfuK0NBohWpCHMSAAsFe74WWP%2BvT25wtP9Bpob6uGqqyDnOtaeumjRu%2ByFu36VntK%2FPA5umTJeUtPWZSU9BCgud661odVp3DZtkc7AnYR33RRC708PrVi1larW7XwZIjLnd7R6SgSqWSNjU1B3F72pz5TZbXmX5vV81Yb7Lg7XT%2FUXriu8XLVqw6c6XqWnBKiiYU%2BMt3wWF7u7i91XlSEITwSAZ%2FCzAAHsJVbwXYFFEAAAAASUVORK5CYII%3D
