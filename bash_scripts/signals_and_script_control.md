# ![bash][linkBash]

## Cигналы и управление скриптами

---

>### Сигналы Linux

* Bash-скрипты не контролируют эти сигналы, но они могут распознавать их
* 1 код сигнала `SIGHUP` закрытие терминала
* 2 код сигнала `SIGINT` остановка процесса пользователем с терминала `(CTRL + C)`
* 3 код сигнала `SIGQUIT` остановка процесса пользователем с терминала `(CTRL + \)` с дампом памяти
* 9 код сигнала `SIGKILL` безусловное завершение процесса
* 15 код сигнала `SIGTERM` запрос завершения процесса
* 17 код сигнала `SIGSTOP` прринудительная приостановка выполнения процесса, но не завершение его работы
* 18 код сигнала `SIGTSTP` приостановка процесса с терминала `(CTRL + Z)`, но не завершение работы
* 19 код сигнала `SIGCONT` продолжение выполнения ранее остановленного процесса

>### Временная остановка процесса

* `sleep 100`
* `CTRL + Z`
* число в квадратных скобках — это номер процесса
* `ps –l` просмотр приостановленных процессов
* колонка `S` выводит состояние процессов
  * `T` это приостановка, либо находится в состоянии трассировки
  * `S` фоновый режим

>### Перехват сигналов `trap SIGINT`

* Если скрипт получает сигнал, указанный при вызове этой команды, он обрабатывает его самостоятельно, при этом оболочка такой сигнал обрабатывать не будет.
* Команда trap, использованная в этом примере, выводит текстовое сообщение всякий раз, когда она обнаруживает сигнал SIGINT

```bash
trap "echo ' Trapped Ctrl-C'" SIGINT
echo This is a test script
count=1
while [ $count -le 10 ]
do
echo "Loop #$count"
sleep 1
count=$(( $count + 1 ))
done
```

>### Перехват сигнала выхода из скрипта `trap EXIT`

* `trap "имя сигнала" EXIT` перехват сигнала выхода из скрипта
* При выходе из скрипта, будь то нормальное завершение его работы или завершение, вызванное сигналом `SIGINT`, сработает перехват и оболочка исполнит команду echo

```bash
trap "echo Goodbye..." EXIT
count=1
while [ $count -le 5 ]
do
echo "Loop #$count"
sleep 1
count=$(( $count + 1 ))
done
```

>### Модификация перехваченных сигналов и отмена перехвата

* Модификация сигнала

```bash
trap "echo 'Ctrl-C is trapped.'" SIGINT
count=1
while [ $count -le 5 ]
do
echo "Loop #$count"
sleep 1
count=$(( $count + 1 ))
done
trap "echo ' I modified the trap!'" SIGINT
count=1
while [ $count -le 5 ]
do
echo "Second Loop #$count"
sleep 1
count=$(( $count + 1 ))
done
```

* `trap -- SIGINT` отмена сигнала `--`

```bash
trap "echo 'Ctrl-C is trapped.'" SIGINT
count=1
while [ $count -le 5 ]
do
echo "Loop #$count"
sleep 1
count=$(( $count + 1 ))
done
trap -- SIGINT
echo "I just removed the trap"
count=1
while [ $count -le 5 ]
do
echo "Second Loop #$count"
sleep 1
count=$(( $count + 1 ))
done
```

>### Выполнение скриптов в фоновом режиме `&`

* `./test.sh &` запуск скрипта в фоновом режиме
* скрипт будет запущен в фоновом процессе, в терминал выведется его идентификатор, а когда его выполнение завершится, вы увидите сообщение об этом.
* если выйти из терминала, скрипт, выполняющийся в фоне, так же завершит работу

```bash
count=1
while [ $count -le 10 ]
do
sleep 1
count=$(( $count + 1 ))
done
```

>### Выполнение скриптов, после закрытия терминала `nohup`

* `nohup ./test.sh &` запуск скрипта в фоновом режиме после закрытия терминала
* данные выводимые скриптом, `nohup` автоматически перенаправляет в файл `nohup.out.`

```bash
count=1
while [ $count -le 10 ]
do
sleep 1
count=$(( $count + 1 ))
echo "mess"
done
```

>### Просмотр процессов `jobs`

* `jobs -l` `-l` указывает на то, что нам нужны сведения об ID процессов
* запустим скрипт и приостановим его `CTRL + Z`
* `./test.sh  > f4.txt &` запустим скрипт в фонновом режиме и перенаправим вывод скрипта в файл
* `jobs -l` увидим сведения как о приостановленном скрипте, так и о том, который работает в фоне

```bash
count=1
while [ $count -le 10 ]
do
echo "Loop #$count"
sleep 10
count=$(( $count + 1 ))
done
```

>### Перезапуск приостановленных процессов `bg`

* `./test.sh` запустим скрипт и приостановим его `CTRL + Z`
* `bg` перезапуск скрипта в фоновом режиме
* если у вас имеется несколько приостановленных процессов, для перезапуска конкретного задания команде `bg` можно передать его номер.
* `fg 1` перезапуск процессов в обычном режиме, нужно указать номер процесса который указан в [1]

```bash
count=1
while [ $count -le 10 ]
do
echo "Loop #$count"
sleep 10
count=$(( $count + 1 ))
done
```

>### Планирование запуска скриптов `at` и планировщик заданий `cron`

* `at -f ./test.sh now + 1 minutes`
* эта команда распознаёт множество форматов указания времени
  * cтандартный, с указанием часов и минут, например — `at -f ./test.sh 10:15`
  * c использованием индикаторов AM/PM, до или после полудня, например — `10:15PM`
  * c использованием специальных имён, таких, как `now`, `noon`, `midnight`
* стандартный формат указания даты, при котором дата записывается по шаблонам `MMDDYY`, `MM/DD/YY`, или `DD.MM.YY`
  * Текстовое представление даты, например, `Jul 4`или `Dec 25`, при этом год можно указать, а можно обойтись и без него
  * Запись вида `now + 25 minutes`
  * Запись вида `10:15PM tomorrow`
  * Запись вида `10:15 + 7 days`
* ключ `-M` используется для отправки того, что выведет скрипт, по электронной почте
  * если отправка электронного письма невозможна, этот ключ просто подавит вывод
* `atq` посмотреть список заданий, ожидающих выполнения
* `atrm 18` удалить задание, ожидающее выполнения, при её вызове указывают номер задания

>### Запуск скриптов по расписанию `crontab`

* `crontab –e` добавить задачу в таблицу
  * затем можно вводить команды формирования расписания:
  * `30 10 * * * /home/pion/Desktop/myscript`
* `crontab –l` выполняется в фоне и запускает задания по расписанию
* `crontab` принимает данные о том, когда нужно выполнить задание, в таком формате:
  * `минута`, `час`, `день месяца`, `месяц`, `день недели`
  * нумерация дней недели начинается с 0
  * нумерация месяцев начинается с 1
  * `*` указывает на то, что `cron` должен выполнять команду каждый день каждого месяца в `10:30`
* `30 10 * * * test.sh`
* `30 16 * * test.sh` скрипт запуститься в 4:30 PM каждый понедельник
* ошибка «Resource temporarily unavailable», выполните команду с правами root-пользователя
  * `rm -f /var/run/crond.pid`
* организовать периодический запуск скриптов можно, воспользовавшись  специальными директориями
  * `/etc/cron.hourly`
  * `/etc/cron.daily`
  * `/etc/cron.weekly`
  * `/etc/cron.monthly`
  * если поместить файл скрипта в одну из них, это приведёт, соответственно, к его ежечасному, ежедневному, еженедельному или ежемесячному запуску

>### Запуск скриптов при входе в систему и при запуске оболочки

* автоматизировать запуск скриптов можно, опираясь на различные события, такие, как вход пользователя в систему или запуск оболочки
* эти файлы помогут
  * `$HOME/.bash_profile`
  * `$HOME/.bash_login`
  * `$HOME/.profile`
* для того, чтобы запускать скрипт при входе в систему, поместите его вызов в файл `.bash_profile`
* запуска скриптов при открытии терминала поможет файл `.bashrc`

---

[linkBash]: https://img.shields.io/badge/-BASH-190004?style=for-the-badge&logo=image%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw%2FeHBhY2tldCBiZWdpbj0i77u%2FIiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8%2BIDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDg2QTAyQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkE3MDg2QTAzQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QTcwODZBMDBBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QTcwODZBMDFBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciLz4gPC9yZGY6RGVzY3JpcHRpb24%2BIDwvcmRmOlJERj4gPC94OnhtcG1ldGE%2BIDw%2FeHBhY2tldCBlbmQ9InIiPz6lm45hAAADkklEQVR42qyVa0yTVxzGn7d9Wy03MS2ii8s%2BeokYNQSVhCzOjXZOFNF4jx%2BMRmPUMEUEqVG36jo2thizLSQSMd4N8ZoQ8RKjJtooaCpK6ZoCtRXKpRempbTv5ey83bhkAUphz8fznvP8znn%2B%2F3NeEEJgNBoRRSmz0ub%2FfuxEacBg%2FDmYtiCjgo5NG2mBXq%2BH5I1ogMRk9Zbd%2BQU2e1ML6VPLOyf5tvBQ8yT1lG10imxsABm7SLs898GTpyYynEzP60hO3trHDKvMigUwdeaceacqzp7nOI4n0SSIIjl36ao4Z356OV07fSQAk6xJ3XGg%2BLCr1d1OYlVHp4eUHPnerU79ZA%2F1kuv1JQMAg%2BE4O2P23EumF3VkvHprsZKMzKwbRUXFEyTvSIEmTVbrysp%2BWr8wfQHGK6WChVa3bKUmdWou%2BjpArdGkzZ41c1zG%2Fu5uGH4swzd561F%2BuhIT4%2BLnSuPsv9%2BJKIpjNr9dXYOyk7%2FBZrcjIT4eCnoKgedJP4BEqhG77E3NKP31FO7cfQA5K0dSYuLgz2TwCWJSOBzG6crzKK%2BohNfni%2Bx6OMUMMNe%2Fgf7ocbw0v0acKg6J8Ql0q%2BT%2FAXR5PNi5dz9c71upuQqCKFAD%2BYhrZLEAmpodaHO3Qy6TI3NhBpbrshGtOWKOSMYwYGQM8nJzoFJNxP2HjyIQho4PewK6hBktoDcUwtIln4PjOWzflQ%2Be5yl0yCCYgYikTclGlxadio%2BBQCSiW1UXoVGrKYwH4RgMrjU1HAB4vR6LzWYfFUCKxfS8Ftk5qxHoCUQAUkRJaSEokkV6Y%2F%2BJUOC4hn6A39NVXVBYeNP8piH6HeA4fPbpdBQV5KOx0QaL1YppX3Jgk0TwH2Vg6S3u%2BdB91%2B%2FpuNYPYFl5uP5V7ZqvsrX7jxqMXR6ff3gCQSTzFI0a1TX3wIs8ul%2Bq4HuWAAiM39vhOuR1O1fQ2gT%2F26Z8Z5vrl2OHi9OXZn995nLV9aFfS6UC9JeJPfuK0NBohWpCHMSAAsFe74WWP%2BvT25wtP9Bpob6uGqqyDnOtaeumjRu%2ByFu36VntK%2FPA5umTJeUtPWZSU9BCgud661odVp3DZtkc7AnYR33RRC708PrVi1larW7XwZIjLnd7R6SgSqWSNjU1B3F72pz5TZbXmX5vV81Yb7Lg7XT%2FUXriu8XLVqw6c6XqWnBKiiYU%2BMt3wWF7u7i91XlSEITwSAZ%2FCzAAHsJVbwXYFFEAAAAASUVORK5CYII%3D
