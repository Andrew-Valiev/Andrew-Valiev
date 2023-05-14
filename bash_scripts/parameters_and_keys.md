# ![bash][linkBash]

## Parameters and keys

---

>### Ввод параметров

* `$ ./myscript 10 20` ввод параметров
* `$0` имя скрипта
* `$1` первый параметр
* `$2` второй параметр — и так далее, вплоть до переменной $9
* `${10}` если скрипту надо больше девяти параметров

* параметрами могут быть числа, "текст"

* `$ ./myscript 10 20`

```bash
total=$[ $1 + $2 ]
echo "The first parameter is $1."
echo "The second parameter is $2."
echo "The sum is $total."
```

* `./myscript "Andrew V."`

```bash
echo "Hello $1, how do you do"
```

>### Проверка наличия параметров

```bash
if [ -n "$1" ]
then
echo "Hello $1."
else
echo "No parameters found. "
fi
```

>### Подсчёт параметров

* `$#` подсчёт количество переданных параметров

```bash
echo "There were $# parameters passed."
```

* `${!#}` получение последнего из переданных параметров

```bash
echo "The last parameter was ${!#}"
```

>### Захват всех параметров командной строки

* `$*` вывод всех параметров в виде строки
* `$@` вывод всех параметров в виде списка / можно перебирать в циклах

```bash
count=1
for param in "$*"
do
echo "\$* Parameter #$count = $param"
count=$(( $count + 1 ))
done
count=1
for param in "$@"
do
echo "\$@ Parameter #$count = $param"
count=$(( $count + 1 ))
done
```

>### Ключи командной строки

* `$ ./myscript –a –b –c –d` ключи

```bash
while [ -n "$1" ]
do
case "$1" in
-a) echo "Found the -a option" ;;
-b) echo "Found the -b option" ;;
-c | la | bi) echo "Found the -c | la | bi key" ;; # можно писать через | несколько парматров в одном ключе
 *) echo "$1 is not an option" ;;
esac
shift
done
```

>### Как различать ключи и параметры `--`

* `$ ./myscript –a –b –c –d -- 5 10 14` использование двойного тире `(--)` означает, что закончились ключи и пошли параметры

```bash
while [ -n "$1" ]
do
case "$1" in
-a) echo "Found the -a option" ;;
-b) echo "Found the -b option";;
-c) echo "Found the -c option" ;;
--) shift
break ;;
*) echo "$1 is not an option";;
esac
shift
done
count=1
for param in $@
do
echo "Parameter #$count: $param"
count=$(( $count + 1 ))
done
```

>### Обработка ключей со значениями

* `$ ./test.sh -f4 of -f1 книга -r` ключи со значениями

```bash
while [ -n "$1" ]
do
case "$1" in
-f4) 
cd /home/pion/
grep -i $2 f4.txt 
shift ;;
-f1) 
cd /home/pion/mer 
grep -i $2 fil1.txt 
shift  ;;
*) echo "$1 is not an option";;
esac
shift
done
```

>### Получение данных от пользователя

```bash
echo -n "Enter your name: "
read name
echo "Hello $name, welcome to my program."
```

```bash
read -p "Enter your name: " first last
echo "Your data for $last, $first…"
```

```bash
read -p "Enter your name: "
echo Hello $REPLY, welcome to my program.
```

```bash
if read -t 5 -p "Enter your name: " name
then
echo "Hello $name, welcome to my script"
else
echo "Sorry, too slow! "
fi
```

```bash
read -s -p "Enter your password: " pass
echo "Is your password really $pass? "
```

>### Чтение данных из файла

```bash
count=1
cat myfile | while read line
do
echo "Line $count: $line"
count=$(( $count + 1 ))
done
echo "Finished"
```

---

[linkBash]: https://img.shields.io/badge/-BASH-190004?style=for-the-badge&logo=image%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw%2FeHBhY2tldCBiZWdpbj0i77u%2FIiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8%2BIDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDg2QTAyQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkE3MDg2QTAzQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QTcwODZBMDBBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QTcwODZBMDFBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciLz4gPC9yZGY6RGVzY3JpcHRpb24%2BIDwvcmRmOlJERj4gPC94OnhtcG1ldGE%2BIDw%2FeHBhY2tldCBlbmQ9InIiPz6lm45hAAADkklEQVR42qyVa0yTVxzGn7d9Wy03MS2ii8s%2BeokYNQSVhCzOjXZOFNF4jx%2BMRmPUMEUEqVG36jo2thizLSQSMd4N8ZoQ8RKjJtooaCpK6ZoCtRXKpRempbTv5ey83bhkAUphz8fznvP8znn%2B%2F3NeEEJgNBoRRSmz0ub%2FfuxEacBg%2FDmYtiCjgo5NG2mBXq%2BH5I1ogMRk9Zbd%2BQU2e1ML6VPLOyf5tvBQ8yT1lG10imxsABm7SLs898GTpyYynEzP60hO3trHDKvMigUwdeaceacqzp7nOI4n0SSIIjl36ao4Z356OV07fSQAk6xJ3XGg%2BLCr1d1OYlVHp4eUHPnerU79ZA%2F1kuv1JQMAg%2BE4O2P23EumF3VkvHprsZKMzKwbRUXFEyTvSIEmTVbrysp%2BWr8wfQHGK6WChVa3bKUmdWou%2BjpArdGkzZ41c1zG%2Fu5uGH4swzd561F%2BuhIT4%2BLnSuPsv9%2BJKIpjNr9dXYOyk7%2FBZrcjIT4eCnoKgedJP4BEqhG77E3NKP31FO7cfQA5K0dSYuLgz2TwCWJSOBzG6crzKK%2BohNfni%2Bx6OMUMMNe%2Fgf7ocbw0v0acKg6J8Ql0q%2BT%2FAXR5PNi5dz9c71upuQqCKFAD%2BYhrZLEAmpodaHO3Qy6TI3NhBpbrshGtOWKOSMYwYGQM8nJzoFJNxP2HjyIQho4PewK6hBktoDcUwtIln4PjOWzflQ%2Be5yl0yCCYgYikTclGlxadio%2BBQCSiW1UXoVGrKYwH4RgMrjU1HAB4vR6LzWYfFUCKxfS8Ftk5qxHoCUQAUkRJaSEokkV6Y%2F%2BJUOC4hn6A39NVXVBYeNP8piH6HeA4fPbpdBQV5KOx0QaL1YppX3Jgk0TwH2Vg6S3u%2BdB91%2B%2FpuNYPYFl5uP5V7ZqvsrX7jxqMXR6ff3gCQSTzFI0a1TX3wIs8ul%2Bq4HuWAAiM39vhOuR1O1fQ2gT%2F26Z8Z5vrl2OHi9OXZn995nLV9aFfS6UC9JeJPfuK0NBohWpCHMSAAsFe74WWP%2BvT25wtP9Bpob6uGqqyDnOtaeumjRu%2ByFu36VntK%2FPA5umTJeUtPWZSU9BCgud661odVp3DZtkc7AnYR33RRC708PrVi1larW7XwZIjLnd7R6SgSqWSNjU1B3F72pz5TZbXmX5vV81Yb7Lg7XT%2FUXriu8XLVqw6c6XqWnBKiiYU%2BMt3wWF7u7i91XlSEITwSAZ%2FCzAAHsJVbwXYFFEAAAAASUVORK5CYII%3D
