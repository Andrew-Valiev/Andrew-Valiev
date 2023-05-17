# ![bash][linkBash]

## Bash script commands

---

>### Объявление функций

* функцию можно вызвать без аргументов и с аргументами

```bash
functionName {}

# Или так:

functionName(аргументы) {список_команд}
```

>### Использование функций

* для вызова функции достаточно указать её имя.

```bash
function myfunc {
echo "This is an example of using a function"
}
count=1
while [ $count -le 3 ]
do
myfunc
count=$(( $count + 1 ))
done
echo "This is the end of the loop"
myfunc
echo "End of the script"
```

* если вы переопределите ранее объявленную функцию, новая функция будет вызываться вместо старой

```bash
function myfunc {
echo "The first function definition"
}
myfunc
function myfunc {
echo "The second function definition"
}
myfunc
echo "End of the script"
```

>### Использование команды `return`

* `$?` позволяет вернуть результат выполнения функции
* если получить значения функции `$?` до выполнения функции то оно будет равно 0
* данная переменная хранит значение возврата последней выполненной команды
* Учтите, что максимальное число, которое может вернуть команда return — 255
* Если функция должна возвращать большее число или строку, понадобится другой подход

```bash
function myfunc {
read -p "Enter a value: " value
echo "adding value"
return $(( $value + 10 ))
}
echo "The new value is $?" #  $? == 0
myfunc
echo "The new value is $?"
```

>### Запись вывода функции в переменную

* позволяет обойти ограничения команды `return` и возвращать из функции любые данные

```bash
function myfunc {
read -p "Enter a value: " value
echo $(( $value + 10 ))
}
result=$( myfunc)
echo "The value is $result"
```

>### Аргументы функций

* `myfunc $val1 10 20` аргументы записываются после имени функции
  * `value=$(addnum 10 15)`

```bash
function addnum {
if [ $# -eq 0 ] || [ $# -gt 2 ] # || или
then
echo -1
elif [ $# -eq 1 ]
then
echo $(( $1 + $1 ))
else [ $# -eq 2 ]
echo $(( $1 + $2 ))
fi
}
echo -n "Adding 10 and 15: "
value=$(addnum 10 15)
echo $value
echo -n "Adding one number: "
value=$(addnum 10)
echo $value
echo -n "Adding no numbers: "
value=$(addnum)
echo $value
echo -n "Adding three numbers: "
value=$(addnum 10 15 20)
echo $value
```

* функция не может напрямую работать с параметрами, которые переданы из командной строки
* `./test.sh 10 20`

```bash
function myfunc {
echo $(( $1 + $2 ))
}
if [ $# -eq 2 ]
then
value=$( myfunc)
echo "The result is $value"
else
echo "Usage: myfunc  a b"
fi
```

* если в функции планируется использовать параметры, из командной строки, надо передать их ей при вызове
* `./test.sh 10 20`

```bash
function myfunc {
echo $(( $1 + $2 ))
}
if [ $# -eq 2 ]
then
value=$(myfunc $1 $2) # использовать параметры, из командной строки
echo "The result is $value"
else
echo "Usage: myfunc a b"
fi
```

>### Глобальные переменные

* глобальные переменные, объявленные в функциях, к ним можно обращаться и в основном коде скрипта после вызова функций
* в функциях, тоже можно обращаться к глобальным переменным, который объявленны за пределами функций
* по умолчанию все объявленные в скриптах переменные глобальны

```bash
function myfunc {
value=$(( $value + 10 ))
}
read -p "Enter a value: " value
myfunc
echo "The new value is: $value" # обращение к глобальной переменной функции, за ее пределами
```

>### Локальные переменные `local`

* `local temp=$(( $value + 5 ))`

```bash
function myfunc {
local temp=$[ $value + 5 ]
echo "The Temp from inside function is $temp"
}
temp=4
myfunc
echo "The temp from outside is $temp"
```

>### Передача функциям массивов в качестве аргументов

```bash
function myfunc {
local newarray
newarray=("$@") # передача массива в переменную
echo "The new array value is: ${newarray[*]}"
}
myarray=(1 2 3 4 5)
echo "The original array is ${myarray[*]}"
myfunc ${myarray[*]} # передача массива в функцию 
```

>### Рекурсивные функции

```bash
function factorial {
if [ $1 -eq 1 ]
then
echo 1
else
local temp=$(( $1 - 1 ))
local result=$(factorial $temp) # рекурсия это когда функция сама себя вызывает
echo $(( $result * $1 ))
fi
}
read -p "Enter value: " value
result=$(factorial $value)
echo "The factorial of $value is: $result"
```

>### Создание и использование библиотек `source`

* `source myfuncs` или `. ./myfuncs` позволяет подключать библиотеки внутри скриптов
* `myfuncs.sh` создаем исполняемый файл с функцией

```bash
function addnum {
echo $(( $1 + $2 ))
}
```

* создаем скрипт

```bash
. ./myfuncs # ссылка на функцию 
result=$(addnum 10 20)
echo "The result is: $result"
```

>### Вызов bash-функций из командной строки

* `.bashrc` файл в который нужно поместить функцию и вызывать функцию можно будет из командной строки.
* добавивте в `.bashrc`, путь к файлу библиотеки
* `. /home/pion/myfuncs.sh`
* `source /home/pion/myfuncs.sh` или так
* нужна перезагрузка консоли
* если имя функции из библиотеки совпадёт с именем какой-нибудь стандартной команды, вместо этой команды будет вызываться функция

---

[linkBash]: https://img.shields.io/badge/-BASH-190004?style=for-the-badge&logo=image%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw%2FeHBhY2tldCBiZWdpbj0i77u%2FIiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8%2BIDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDg2QTAyQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkE3MDg2QTAzQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QTcwODZBMDBBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QTcwODZBMDFBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciLz4gPC9yZGY6RGVzY3JpcHRpb24%2BIDwvcmRmOlJERj4gPC94OnhtcG1ldGE%2BIDw%2FeHBhY2tldCBlbmQ9InIiPz6lm45hAAADkklEQVR42qyVa0yTVxzGn7d9Wy03MS2ii8s%2BeokYNQSVhCzOjXZOFNF4jx%2BMRmPUMEUEqVG36jo2thizLSQSMd4N8ZoQ8RKjJtooaCpK6ZoCtRXKpRempbTv5ey83bhkAUphz8fznvP8znn%2B%2F3NeEEJgNBoRRSmz0ub%2FfuxEacBg%2FDmYtiCjgo5NG2mBXq%2BH5I1ogMRk9Zbd%2BQU2e1ML6VPLOyf5tvBQ8yT1lG10imxsABm7SLs898GTpyYynEzP60hO3trHDKvMigUwdeaceacqzp7nOI4n0SSIIjl36ao4Z356OV07fSQAk6xJ3XGg%2BLCr1d1OYlVHp4eUHPnerU79ZA%2F1kuv1JQMAg%2BE4O2P23EumF3VkvHprsZKMzKwbRUXFEyTvSIEmTVbrysp%2BWr8wfQHGK6WChVa3bKUmdWou%2BjpArdGkzZ41c1zG%2Fu5uGH4swzd561F%2BuhIT4%2BLnSuPsv9%2BJKIpjNr9dXYOyk7%2FBZrcjIT4eCnoKgedJP4BEqhG77E3NKP31FO7cfQA5K0dSYuLgz2TwCWJSOBzG6crzKK%2BohNfni%2Bx6OMUMMNe%2Fgf7ocbw0v0acKg6J8Ql0q%2BT%2FAXR5PNi5dz9c71upuQqCKFAD%2BYhrZLEAmpodaHO3Qy6TI3NhBpbrshGtOWKOSMYwYGQM8nJzoFJNxP2HjyIQho4PewK6hBktoDcUwtIln4PjOWzflQ%2Be5yl0yCCYgYikTclGlxadio%2BBQCSiW1UXoVGrKYwH4RgMrjU1HAB4vR6LzWYfFUCKxfS8Ftk5qxHoCUQAUkRJaSEokkV6Y%2F%2BJUOC4hn6A39NVXVBYeNP8piH6HeA4fPbpdBQV5KOx0QaL1YppX3Jgk0TwH2Vg6S3u%2BdB91%2B%2FpuNYPYFl5uP5V7ZqvsrX7jxqMXR6ff3gCQSTzFI0a1TX3wIs8ul%2Bq4HuWAAiM39vhOuR1O1fQ2gT%2F26Z8Z5vrl2OHi9OXZn995nLV9aFfS6UC9JeJPfuK0NBohWpCHMSAAsFe74WWP%2BvT25wtP9Bpob6uGqqyDnOtaeumjRu%2ByFu36VntK%2FPA5umTJeUtPWZSU9BCgud661odVp3DZtkc7AnYR33RRC708PrVi1larW7XwZIjLnd7R6SgSqWSNjU1B3F72pz5TZbXmX5vV81Yb7Lg7XT%2FUXriu8XLVqw6c6XqWnBKiiYU%2BMt3wWF7u7i91XlSEITwSAZ%2FCzAAHsJVbwXYFFEAAAAASUVORK5CYII%3D
