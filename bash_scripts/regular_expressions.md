# ![bash][linkBash]

## Bash Регулярные выражения

---

>### Регулярные выражения `POSIX BRE`

* `echo "This is a test" | sed -n '/test/p'`
* `echo "This is a test" | awk '/test/{print $0}'` `awk` поддерживает стандарт `ERE`
* в регулярных выражениях можно использовать не только буквы, но и пробелы, и цифры
* `echo "This is a test 2 again" | awk '/test 2/{print $0}'`

>### Специальные символы

* cпец. символы, если один из них нужен в шаблоне, его нужно будет экранировать с помощью обратной косой черты (обратного слэша) `\`
* `.*[]^${}\+?|()`
* `awk '/\$/{print $0}' d2.txt` ищем `$` в тексте
* обратная косая черта `\` это тоже специальный символ, поэтому, его тоже надо будет экранировать
* `echo "\ is a special character" | awk '/\\/{print $0}'`
* `/` прямой слэш, попытка воспользоваться им в регулярном выражении, написанном для sed или awk, приведёт к ошибке
* `echo "3 / 2" | awk '///{print $0}'` ошибка
* `echo "3 / 2" | awk '/\//{print $0}'` правильный вариант

>### Якорные символы

* cимвол «крышка» `^` позволяет описывать последовательности символов, которые находятся в начале текстовых строк
* если искомый шаблон окажется в другом месте строки, регулярное выражение на него не отреагирует
* `echo "welcome to Pion website" | awk '/^Pion/{print $0}'` ничего не найдет
* `echo "Pion website" | awk '/^Pion/{print $0}'` правильный вариант
* `sed` если поместить крышку где-нибудь внутри шаблона, она будет восприниматься как любой другой обычный символ
* `echo "This ^ is a test" | sed -n '/s ^/p'`
* `awk` при использовании такого же шаблона, данный символ надо экранировать
* `echo "This ^ is a test" | awk '/s \^/{print $0}'`
* `$` якорным символом конца строки
* `echo "This is a test" | awk '/test$/{print $0}'`
* `awk '/^this is a test$/{print $0}' d2.txt`
* вывести все кроме пустых строк
* `awk '!/^$/{print $0}' d2.txt` символ отрицания не, восклицательный знак `!`

>### Символ «точка» `.`

* `.` точка используется для поиска любого одиночного символа, за исключением символа перевода строки
* `awk '/.st/{print $0}' d2.txt` найти все строки в которых есть символы перед `.st`
* `awk '/st./{print $0}' d2.txt` найти все строки в которых есть символы после `st.`

>### Классы символов `[]`

* классы символов позволяют более гибко искать данные, можно использовать символы
* `awk '/[oi]th/{print $0}' d2.txt` ищем последовательность символов `«th»`, перед которой есть символ `«o»` или символ `«i»`
* `awk '/is[th]/{print $0}' d2.txt` ищем последовательность символов `«is»`, после которой есть символ `«t»` или символ `«h»`
* `echo "this is a test" | awk '/[Tt]his is a test/{print $0}'` поиск прописной и строчной буквы
* `echo "This is a test" | awk '/[Tt]his is a test/{print $0}'`

>### Отрицание классов символов `^`

* `awk '/[^oi]th/{print $0}' d2.txt` будут найдены последовательности символов `«th»`, перед которыми нет ни `«o»`, ни `«i»`

>### Диапазоны символов `[e-p]`

* `awk '/[e-p]st/{print $0}' d2.txt` ищет последовательность символов `«st»`, перед которой находится любой символ, расположенный, в алфавитном порядке, между символами `«e»` и `«p»`
* диапазоны можно создавать и из чисел
  * `awk '/[0-2]/{print $0}' d2.txt`
  * `echo "123" | awk '/[0-9][2-9][0-9]/'` каждому диапазону соответствует первый цифра в `echo`
* в класс символов могут входить несколько диапазонов
  * `awk '/[a-fm-z]st/{print $0}' d2.txt` найдёт все последовательности `«st»`, перед которыми есть символы из диапазонов `a-f` и `m-z`

 >### Специальные классы символов

* `[[:alpha:]]` — соответствует любому алфавитному символу, записанному в верхнем или нижнем регистре.
* `[[:alnum:]]` — соответствует любому алфавитно-цифровому символу, а именно — символам в диапазонах `0-9`, `A-Z`, `a-z`.
* `[[:blank:]]` — соответствует пробелу и знаку табуляции.
* `[[:digit:]]` — любой цифровой символ от `0` до `9`.
* `[[:upper:]]` — алфавитные символы в верхнем регистре — `A-Z`.
* `[[:lower:]]` — алфавитные символы в нижнем регистре — `a-z`.
* `[[:print:]]` — соответствует любому печатаемому символу.
* `[[:punct:]]` — соответствует знакам препинания.
* `[[:space:]]` — пробельные символы, в частности — пробел, знак табуляции, символы `NL`, `FF`, `VT`, `CR`.
* `awk '/[[:alpha:]]/{print $0}' d2.txt`

 >### Символ «звёздочка» `*`

* `*` если в шаблоне после символа поместить звёздочку, то мы получим вывод всех строк, где есть символ который появляется в строке любое количество раз — включая и ситуацию, когда символ в строке отсутствует
* обычно используют для работы со словами, в которых постоянно встречаются опечатки
* `awk '/tes*t/{print $0}' d2.txt` найти неизвестный символ между буквами `s` и `t`, даже если между буквами нет символа
* `echo "tessst" | awk '/tes*t/{print $0}'`
* `echo "tessst" | awk '/tes*t/{print $0}'`
* `echo "I like green color" | awk '/colou*r/{print $0}'`
* `echo "I like green colour " | awk '/colou*r/{print $0}'` `*` вывести все слова которые содержат символы между буквами `u` и `r` или не содержат символы между этими буквами
* символ `«u»`, после которого стоит звёздочка, может либо отсутствовать, либо встречаться несколько раз подряд
* комбинирование `.` и `*`
  * `awk '/this.*test/{print $0}' d2.txt` неважно сколько и каких символов находится между словами `«this»` и `«test»` все строки водятся на экран, которые содержат эти слова
* `*`звёздочку можно использовать и с классами символов
  * `awk '/s[ae]*t/{print $0}' d2.txt`

>### Регулярные выражения `POSIX ERE`

* `awk` поддерживает этот стандарт, а `sed` — нет

>### Вопросительный знак `?`

* `?` указывает на то, что предшествующий символ может встретиться в тексте один раз или не встретиться вовсе
* `echo "tet" | awk '/tes?t/{print $0}'`
* `echo "tesst" | awk '/tes?t/{print $0}'` ничего не найдено
* `?`можно использовать и с классами символов
  * `echo "tst" | awk '/t[ae]?st/{print $0}'`
  * `echo "test" | awk '/t[ae]?st/{print $0}'`
  * `echo "tast" | awk '/t[ae]?st/{print $0}'`
  * `echo "taest" | awk '/t[ae]?st/{print $0}'` ничего не найдено
  * `echo "teest" | awk '/t[ae]?st/{print $0}'` ничего не найдено
  * если символов из класса в строке нет, или один из них встречается один раз, регулярное выражение срабатывает, однако стоит в слове появиться двум символам и система уже не находит в тексте соответствия шаблону

>### Символ «плюс» `+`

* `+` в шаблоне указывает на то, что регулярное выражение обнаружит искомое в том случае, если предшествующий символ встретится в тексте один или более раз
  * `echo "test" | awk '/te+st/{print $0}'`
  * `echo "teest" | awk '/te+st/{print $0}'`
  * `echo "tst" | awk '/te+st/{print $0}'` ничего не найдено
  * `echo "tst" | awk '/t[ae]+st/{print $0}'` ничего не найдено
  * `echo "test" | awk '/t[ae]+st/{print $0}'`
  * `echo "teast" | awk '/t[ae]+st/{print $0}'`
  * `echo "teeast" | awk '/t[ae]+st/{print $0}'`

>### Фигурные скобки `{}`

* позволяют точнее задавать необходимое число вхождений предшествующего им символа
* `echo "tst" | awk '/te{1}st/{print $0}'` ничего не найдено перед `s` нет `е`
* `echo "test" | awk '/te{1}st/{print $0}'`

* `echo "tst" | awk '/te{1,2}st/{print $0}'` символ «e» должен встретиться 1 или 2 раза
* `echo "test" | awk '/te{1,2}st/{print $0}'`
* `echo "teest" | awk '/te{1,2}st/{print $0}'`
* `echo "teeest" | awk '/te{1,2}st/{print $0}'` ничего не найдено

* `{}` можно применять и с классами символов `[]`
  * `echo "tst" | awk  '/t[ae]{1,2}st/{print $0}'`
  * `echo "test" | awk  '/t[ae]{1,2}st/{print $0}'`
  * `echo "teest" | awk  '/t[ae]{1,2}st/{print $0}'`
  * `echo "teeast" | awk  '/t[ae]{1,2}st/{print $0}'` ничего не найдено
  * шаблон отреагирует на текст в том случае, если в нём один или два раза встретится символ «a» или символ «e»

>### Символ логического «или» `|`

* между фрагментами шаблона и разделяющим их символом `|` не должно быть пробелов
* `echo "This is a test" | awk '/test|exam/{print $0}'`
* `echo "This is an exam" | awk '/test|exam/{print $0}'`
* `echo "This is something else" | awk '/test|exam/{print $0}'` ничего не найдено

>### Группировка фрагментов регулярных выражений `()`

* `()` группировка позволяет группировать шаблоны вместе и ссылаться на них как на один элемент
* `echo "Like" | awk '/Like(Geeks)?/{print $0}'`
* `echo "LikeGeeks" | awk '/Like(Geeks)?/{print $0}'` `?` квантификатор делает группу (Geeks) необязательной, найти «0 или 1 повторение» в строке
* `()` используются для группировки и символа `|` используется для альтернатив
* `echo -e "Apple Juice\nApple Pie\nApple Tart\nApple Cake" | awk '/Apple (Juice|Cake)/'`регулярное выражение соответствует строкам, содержащим либо `Apple Juice`, либо `Apple Cake`

>### Подсчёт количества файлов в директории

```bash
mypath=$(echo $ls /home/pion/*)
count=0
for directory in $mypath
do
check=$(ls $directory)
    if [ -d "$directory" ]
    then
        for item in $check # вместо $check сюда подставляются файлы из директорий file1 file2 file3 и названия файлов являются значениями для переменной $item в цикле for
        do
        count=$[ $count + 1 ] # считаем количество файлов
        done
            echo "$directory - $count" | sed 's/\/home\/pion\//--/' # заменим путь /home/pion/ на --
            count=0
    fi

done
```

>### Проверка адресов электронной почты

* имя пользователя, может состоять из алфавитно-цифровых символов, точка, тире, символ подчёркивания, знак «плюс»
* за именем пользователя следует знак `@`
* в начале строки должен быть как минимум один символ из тех, которые имеются в группе, заданной в квадратных скобках, а после этого должен идти знак `@`
  * `^([a-zA-Z0-9_\-\.\+]+)@` левая часть регулярного выражения для имени
* имя хоста
  * `([a-zA-Z0-9_\-\.]+)` те же правила, что и для имени пользователя
* имя домена
  * cначала должна быть точка, потом — от 2 до 5 алфавитных символов, а после этого строка заканчивается
  * `\.([a-zA-Z]{2,5})$`
* `^([a-zA-Z0-9_\-\.\+]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$` финальная часть
* `echo "name@host.com" | awk '/^([a-zA-Z0-9_\-\.\+]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/{print $0}'`
* `echo "name@host.com.us" | awk '/^([a-zA-Z0-9_\-\.\+]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/{print $0}'`

---

[linkBash]: https://img.shields.io/badge/-BASH-190004?style=for-the-badge&logo=image%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw%2FeHBhY2tldCBiZWdpbj0i77u%2FIiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8%2BIDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDg2QTAyQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkE3MDg2QTAzQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QTcwODZBMDBBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QTcwODZBMDFBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciLz4gPC9yZGY6RGVzY3JpcHRpb24%2BIDwvcmRmOlJERj4gPC94OnhtcG1ldGE%2BIDw%2FeHBhY2tldCBlbmQ9InIiPz6lm45hAAADkklEQVR42qyVa0yTVxzGn7d9Wy03MS2ii8s%2BeokYNQSVhCzOjXZOFNF4jx%2BMRmPUMEUEqVG36jo2thizLSQSMd4N8ZoQ8RKjJtooaCpK6ZoCtRXKpRempbTv5ey83bhkAUphz8fznvP8znn%2B%2F3NeEEJgNBoRRSmz0ub%2FfuxEacBg%2FDmYtiCjgo5NG2mBXq%2BH5I1ogMRk9Zbd%2BQU2e1ML6VPLOyf5tvBQ8yT1lG10imxsABm7SLs898GTpyYynEzP60hO3trHDKvMigUwdeaceacqzp7nOI4n0SSIIjl36ao4Z356OV07fSQAk6xJ3XGg%2BLCr1d1OYlVHp4eUHPnerU79ZA%2F1kuv1JQMAg%2BE4O2P23EumF3VkvHprsZKMzKwbRUXFEyTvSIEmTVbrysp%2BWr8wfQHGK6WChVa3bKUmdWou%2BjpArdGkzZ41c1zG%2Fu5uGH4swzd561F%2BuhIT4%2BLnSuPsv9%2BJKIpjNr9dXYOyk7%2FBZrcjIT4eCnoKgedJP4BEqhG77E3NKP31FO7cfQA5K0dSYuLgz2TwCWJSOBzG6crzKK%2BohNfni%2Bx6OMUMMNe%2Fgf7ocbw0v0acKg6J8Ql0q%2BT%2FAXR5PNi5dz9c71upuQqCKFAD%2BYhrZLEAmpodaHO3Qy6TI3NhBpbrshGtOWKOSMYwYGQM8nJzoFJNxP2HjyIQho4PewK6hBktoDcUwtIln4PjOWzflQ%2Be5yl0yCCYgYikTclGlxadio%2BBQCSiW1UXoVGrKYwH4RgMrjU1HAB4vR6LzWYfFUCKxfS8Ftk5qxHoCUQAUkRJaSEokkV6Y%2F%2BJUOC4hn6A39NVXVBYeNP8piH6HeA4fPbpdBQV5KOx0QaL1YppX3Jgk0TwH2Vg6S3u%2BdB91%2B%2FpuNYPYFl5uP5V7ZqvsrX7jxqMXR6ff3gCQSTzFI0a1TX3wIs8ul%2Bq4HuWAAiM39vhOuR1O1fQ2gT%2F26Z8Z5vrl2OHi9OXZn995nLV9aFfS6UC9JeJPfuK0NBohWpCHMSAAsFe74WWP%2BvT25wtP9Bpob6uGqqyDnOtaeumjRu%2ByFu36VntK%2FPA5umTJeUtPWZSU9BCgud661odVp3DZtkc7AnYR33RRC708PrVi1larW7XwZIjLnd7R6SgSqWSNjU1B3F72pz5TZbXmX5vV81Yb7Lg7XT%2FUXriu8XLVqw6c6XqWnBKiiYU%2BMt3wWF7u7i91XlSEITwSAZ%2FCzAAHsJVbwXYFFEAAAAASUVORK5CYII%3D
