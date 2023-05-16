# ![bash][linkBash]

## Дескрипторы

---

>### Стандартные дескрипторы файлов

* Каждому процессу позволено иметь до девяти открытых дескрипторов файлов. Оболочка bash резервирует первые три дескриптора с идентификаторами 0, 1 и 2.
* `0, STDIN <` стандартный поток ввода / клавиатура или ввод данных из файла
* `1, STDOUT >` стандартный поток вывода / экран или перенаправление данных в файл
* `2, STDERR >>` стандартный поток ошибок / экран или перенаправление ошибок в файл

>### Перенаправление потока ошибок

* `ls -l xfile 2>> myfile` перенаправление ошибок в файл / использовать 2-ой дескриптор
* `ls -l xfil f4.txt fil3.txt  2>> f4.txt 1>> fil3.txt` перенаправление ошибок в файл `f4.txt` 2-ой дескриптор и перенаправление стандартного вывода в файл `fil3.txt` 1-ый дескриптор
* `ls -l xfil f4.txt fil3.txt  &>> f4.txt` перенаправление в один файл с 2-ух дескрипторов (1 и 2)

>### Перенаправление одной строки `>&2`

* `./test.sh 2>> f4.txt` перенаправление 1-ой строки `echo` в файл используя 2-ой дескриптор

```bash
echo "This is an error" >&2 # перенаправление 1-ой строки
echo "This is normal output"
```

>### Перенаправление всех строк `exec`

```bash
exec 1>>f4.txt # перенаправление всех строк в фаил
echo "This is a test of redirecting all output"
echo "from a shell script to another file."
echo "without having to redirect every line"
```

* Команду `exec` можно использовать не только в начале скрипта, но и в других местах

```bash
exec 2>>f4.txt # команда exec задаёт перенаправление вывода из STDERR в файл f4.txt.
echo "This is the start of the script" # вывод первых 2 команд echo на экран, они отправляется в STDOUT.
echo "now redirecting all output to another location"
exec 1>>fil3.txt # команда exec задаёт перенаправление вывода из STDOUT в файл fil3.txt.
echo "This should go to the fil3.txt file" # это выводиться в файл fil3.txt из STDOUT
echo "and this should go to the f4.txt file" >&2 # это выводиться в файл f4.txt из STDERR
```

>### Перенаправление ввода в скриптах `STDIN <`

```bash
exec 0< f4.txt # источник вводимых данных файл f4.txt
count=1
while read line
do
echo "Line #$count: $line"
count=$(( $count + 1 ))
done
```

>### Создание собственного перенаправления вывода

```bash
exec 3>>f4.txt # перенаправление вывода из дескриптора 3 в файл f4.txt
echo "This should display on the screen" # вывод на экран из дескриптора 1
echo "and this should be stored in the file" >&3 # данные выводиться в файл f4.txt из дескриптора 3
echo "And this should be back on the screen"  # вывод на экран из дескриптора 1
```

>### Создание дескриптора для ввода данных из файла

```bash
exec 6<&0 # cохраните STDIN в другом дескрипторе, прежде чем перенаправлять ввод данных
exec 0< f4.txt # перенаправление ввода, источником данных для STDIN стал файл
count=1
while read line
do
echo "Line #$count: $line"
count=$(( $count + 1 ))
done
exec 0<&6 # возвращаем STDIN в исходное состояние, чтобы проверить, что всё работает правильно, ожидается ввод с клавиатуры 
read -p "Are you done now? " answer
case $answer in
y) echo "Goodbye";;
n) echo "Sorry, this is the end.";;
esac
```

>### Закрытие дескрипторов файлов

* оболочка автоматически закрывает дескрипторы файлов после завершения работы скрипта
* можно закрывать дескрипторы вручную, до того, как скрипт закончит работу `>&-`

```bash
exec 3> f4.txt # перенаправление вывода из дескриптора 3 в файл f4.txt
echo "This is a test line of data" >&3 # отправка сообщения echo в 3 дескриптор
exec 3>&- # закрытие 3 дескриптора
echo "This won't work" >&3 # ошибка несуществующей дескриптор, он уже закрыт
```

>### Получение сведений об открытых дескрипторах `lsof`

* `lsof` выводит сведения о каждом дескрипторе, открытом в системе
* `lsof -a`  операция логического И
* `lsof -p` `-p` позволяет указать ID процесса
* `lsof -p 1` поиск по PID
* `lsof -d` `-d` Позволяет указать номер дескриптора, о котором надо получить сведения
* `$$` для того, чтобы узнать PID текущего процесса
* `lsof -i TCP:22` все запущенные процессы на определенном порту
* `lsof -u pion` выведет список всех открытых файлов пользователя
* `lsof -i 4`  cписок только IPv4 открытых файлов
* `lsof -i 6`  cписок только IPv6 открытых файлов
* `lsof -i TCP:1-1024` Список открытых файлов диапазона TCP-портов 1-1024
* `lsof -i -u^root` Исключение пользователя root с помощью символа ‘^’
* `lsof -i -u root` кто какие файлы смотрит и какие команды использует, пользователь root
* `lsof -i` показывает список всех сетевых соединений

```bash
exec 3> d3.txt
exec 6> d6.txt
exec 7< f4.txt
lsof -a -p $$ -d 0,1,2,3,6,7
```

>> Вывод сведений об открытых дескрипторах

* столбец `FD` обозначает дескриптор файла
  * `cwd` – текущий рабочий каталог
  * `rtd` – корневой каталог
  * `txt` – текст программы (код и данные)
  * `mem` – файл памяти
  * `r` – доступа для чтения.
  * `w` – доступа для записи.
  * `u` – чтения и записи.
* столбец `TYPE` — файлов и их идентификация.
  * `DIR` – директория
  * `REG` – обычный файл
  * `CHR` – специальный символьный файл.
  * `FIFO` – First In First Out

* `CHR` (character mode, символьный режим) тип файлов, связанных с `STDIN`, `STDOUT` и `STDERR`
* все три стандартных файла доступны и для чтения, и для записи `0u 1u 2u`
* `3w` и `6w` третий и шестой дескрипторы доступны для записи
* `7r` седьмой доступен для чтения

>### Подавление вывода `/dev/null`

* `/dev/null` иногда надо сделать так, чтобы команды в скрипте ничего не выводили на экран
* для этого можно перенаправить вывод в /dev/null. Это — что-то вроде «чёрной дыры»

```bash
ls -al badfile anotherfile 2> /dev/null # подавить вывод сообщений об ошибках
cat /dev/null > myfile # очистка файл, не удаляя его
```

---

[linkBash]: https://img.shields.io/badge/-BASH-190004?style=for-the-badge&logo=image%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw%2FeHBhY2tldCBiZWdpbj0i77u%2FIiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8%2BIDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDg2QTAyQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkE3MDg2QTAzQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QTcwODZBMDBBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QTcwODZBMDFBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciLz4gPC9yZGY6RGVzY3JpcHRpb24%2BIDwvcmRmOlJERj4gPC94OnhtcG1ldGE%2BIDw%2FeHBhY2tldCBlbmQ9InIiPz6lm45hAAADkklEQVR42qyVa0yTVxzGn7d9Wy03MS2ii8s%2BeokYNQSVhCzOjXZOFNF4jx%2BMRmPUMEUEqVG36jo2thizLSQSMd4N8ZoQ8RKjJtooaCpK6ZoCtRXKpRempbTv5ey83bhkAUphz8fznvP8znn%2B%2F3NeEEJgNBoRRSmz0ub%2FfuxEacBg%2FDmYtiCjgo5NG2mBXq%2BH5I1ogMRk9Zbd%2BQU2e1ML6VPLOyf5tvBQ8yT1lG10imxsABm7SLs898GTpyYynEzP60hO3trHDKvMigUwdeaceacqzp7nOI4n0SSIIjl36ao4Z356OV07fSQAk6xJ3XGg%2BLCr1d1OYlVHp4eUHPnerU79ZA%2F1kuv1JQMAg%2BE4O2P23EumF3VkvHprsZKMzKwbRUXFEyTvSIEmTVbrysp%2BWr8wfQHGK6WChVa3bKUmdWou%2BjpArdGkzZ41c1zG%2Fu5uGH4swzd561F%2BuhIT4%2BLnSuPsv9%2BJKIpjNr9dXYOyk7%2FBZrcjIT4eCnoKgedJP4BEqhG77E3NKP31FO7cfQA5K0dSYuLgz2TwCWJSOBzG6crzKK%2BohNfni%2Bx6OMUMMNe%2Fgf7ocbw0v0acKg6J8Ql0q%2BT%2FAXR5PNi5dz9c71upuQqCKFAD%2BYhrZLEAmpodaHO3Qy6TI3NhBpbrshGtOWKOSMYwYGQM8nJzoFJNxP2HjyIQho4PewK6hBktoDcUwtIln4PjOWzflQ%2Be5yl0yCCYgYikTclGlxadio%2BBQCSiW1UXoVGrKYwH4RgMrjU1HAB4vR6LzWYfFUCKxfS8Ftk5qxHoCUQAUkRJaSEokkV6Y%2F%2BJUOC4hn6A39NVXVBYeNP8piH6HeA4fPbpdBQV5KOx0QaL1YppX3Jgk0TwH2Vg6S3u%2BdB91%2B%2FpuNYPYFl5uP5V7ZqvsrX7jxqMXR6ff3gCQSTzFI0a1TX3wIs8ul%2Bq4HuWAAiM39vhOuR1O1fQ2gT%2F26Z8Z5vrl2OHi9OXZn995nLV9aFfS6UC9JeJPfuK0NBohWpCHMSAAsFe74WWP%2BvT25wtP9Bpob6uGqqyDnOtaeumjRu%2ByFu36VntK%2FPA5umTJeUtPWZSU9BCgud661odVp3DZtkc7AnYR33RRC708PrVi1larW7XwZIjLnd7R6SgSqWSNjU1B3F72pz5TZbXmX5vV81Yb7Lg7XT%2FUXriu8XLVqw6c6XqWnBKiiYU%2BMt3wWF7u7i91XlSEITwSAZ%2FCzAAHsJVbwXYFFEAAAAASUVORK5CYII%3D
