# ![bash][def]

## Bash commands

>### Создание директории

* `mkdir mytest` "создание директории"
* `mkdir -p test/test2` "создаст директорию внутри другой директории"

------

>### Переход в директорию

* `cd ~/mytest` "перейти в нужную директорию"
* `cd /home/pion/mytest` "перейти в нужную директорию"
* `cd /` "перейти в корневой каталог"
* `cd ~` "перейти в домашний каталог"
* `cd -`  "вернуться в предыдущий каталог"  
* `cd ..` "переход в родительскую директорию вернуться на директорию назад"
* `cd ../..` "вернуться на 2 директории назад"  
* `cd../../..` "вернуться на 3 директории назад"

------

>### Просмотр файлов в директории

* `ls` "содержимое директории"
* `ls -l` "показывает дополнительную информацию о файле | длинный вид права доступа , владелец , вес , название и дату"
* `ls -l` mytest  "вернется информация о содержимом наших файлов в длинном виде"  
* `ls -a` "отобразит все файлы и скрытые тоже"
* `ls -A` "отобразит все файлы без текущей и родительской директории"
* `ls -R` "содержимое для каждой директории"
* `ls /home/` "можно указывать конкретную директорию"
* `ls | grep ho`  "для поиска файлов или папок в каталоге"

------

>### Разное

* `pwd` "отобразит путь к директории"
* `man ls` " справка по ключам с конкретной командой"
* `touch fil1.txt`  "создание файла"
* `date` дата и время  
* `w` кто залогинен в системе
* `tail -10  m_s` вывод последних 10 строк из файла
* `less m_s | grep page m_s`  поиск строк в редакторе less
* `host ya.ru` узнать IP
* `uname -a` версия системы
* `free -h`  информация об ОЗУ
* `df -hT`   информация о дисках HDD
* `|` pipe соединяет две команды вместе
* `;` команды выполняются изолированно друг от друга
* `uniq` удаляет повторяющиеся строки
  * `-c` выводит количество повторяющихся строк
* `sort`сортирует поток текста в порядке убывания или возрастания, в зависимости от заданных опций

------

>### Просмотр содержимого файла

* `cat fil1.txt` "посмотреть содержимое файла"
* `cat fil3.txt fil3.txt > f4.txt`  объединить 2 файла и сохранить их данные в новом файле
* `cat f4.txt | grep -i hi` поиск нужного текста в файле
* `cat f6.txt | sort | uniq` сортировка файла и вывод только уникальных строк

------

>### Удаление папок и файлов

* `rmdir less2` "удаление пустой папки"
* `rm fil2.txt` "удаление файла"
* `rm -R less2` "удаление папки c файлами"

------

>### Переименование или перемещение файлов и папок

* `mv` "переименование/перемещения файла"
* `mv mytest/fi mytest/fo` "переименования файла или папки"
* `mv mytest me`  "переименования папки"

------

>### Копирование файлов и папок

* `cp` "копирование файла"
* `cp mer/fo less2`
* `cp less2/*less3` "копирование всех файлов в папке"

------

>### Редакторы

* `less fil1.txt`
* `nano fil1.txt`
* `vi fil1.txt`
* `ctrl + ins` копировать
* `shift + ins` вставить
* `ins` редактировать текст
* `:w` сохранить
* `:q` выход
* `:q!` выход без сохранения
* `:wq`

------

>### Поиск в файлах

* `grep час` - для поиска во всех файлах Регистрозависимые
* `grep час fil3.txt` -искать только в этом файле
* `grep -i час fil3.txt` -i для отключения регистра по поиску
* `grep -v час fil3.txt` -v вывести все строки кроме этой которая содержит час
* `grep -c час fil3.txt` -c посчитать количество строк которые имеют эту запись
* `grep -ci Час fil3.txt` ключи можно комбинировать
* `grep -iR Час mer` -R поиск строк по папкам
* `grep -n` напечатать номера найденных строк, чтобы узнать их позицию в файле
* `grep -A2 fil3.txt` строка с вхождением и две после нее
* `grep -B3 fil3.txt` строка с вхождением и три до нее
* `grep -C1 fil3.txt` строка, содержащая вхождение, и одну до и после нее

------

>### Поиск файлов и папок

* `find`  позволяет искать файлы или папки по названию
* `find . -name fo` "точка указывает что будем искать в этой директории в которой находимся | после name указываем название папки или файла"
* `find . -name*.txt`  "искать файлы только по расширению"
* `find . -type d  -name "less*"` поиск по директориям (папок) -type d значит ищем директорию*искать везде похожее название
* `find . -name "*fo" -delete -print` - удаления файла с разных директорий  -print вывести информацию об удалении

------

>### Вывод сообщений

* `echo` как алерт выводит тестовую информацию
* `echo Hi hello > fil3.txt` позволяет сохранять тест в файл перезаписывает весь файл
* `Hi hello good >> fil3.txt` добавляет новую информацию без перезаписи всего файла

------

>### Просмотр процессов

* `ps`  "просмотр всех процессов"

   | PID (идентификатор) | TTY | TIME |CMD (название процесса) |
   | :-: | :- | :-: | :- |
   |10  |                 tty1 | 00:00:00 | bash |
   |126 |                 tty1 | 00:00:00 | ps |

  по идентификатору  PID можно завершать процессы
* `kill 10` - убить процесс по идентификатору
* `ps u` - процессы пользователя
* `ps au` - процессы терминала  
* `ps x`- дополнительная информация о процессах
* `ps aux` все процессы вместе
* `ps aux` | head -2  выести только 2 процесса первых
* `top` процессы в реальном времени

------

>### Отправка пакетов

* `ping google.com`
* `ping -c 7 google.com` -c позволяет отправить только 7 пакетов
* `ping -c 7 -i 3 google.com` отправка 7 пакетов раз в 3 секунды

------

>### Отправка запросов

* `curl https://google.com` "отправить GET на <https://google.com>  поддерживает различные методы это вариант будет работать если нет перенаправления"
* `curl -L https://google.com` этот вариант используется с перенаправлением  
* `curl -L https://google.com --verbose`  позволяет увидеть статус ответа хедеры и др. инфо.
* `curl -L https://google.com?page=2` - можно передавать доп. параметры
* `curl -X POST https://google.com/api/login/ -- data “email= <hank@gmail.com>” --data “password=100”` отправка пост запроса | придет ответ с токеном

------

[def]: https://img.shields.io/badge/-BASH-190004.svg?logo=image%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw%2FeHBhY2tldCBiZWdpbj0i77u%2FIiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8%2BIDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDg2QTAyQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkE3MDg2QTAzQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QTcwODZBMDBBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QTcwODZBMDFBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciLz4gPC9yZGY6RGVzY3JpcHRpb24%2BIDwvcmRmOlJERj4gPC94OnhtcG1ldGE%2BIDw%2FeHBhY2tldCBlbmQ9InIiPz6lm45hAAADkklEQVR42qyVa0yTVxzGn7d9Wy03MS2ii8s%2BeokYNQSVhCzOjXZOFNF4jx%2BMRmPUMEUEqVG36jo2thizLSQSMd4N8ZoQ8RKjJtooaCpK6ZoCtRXKpRempbTv5ey83bhkAUphz8fznvP8znn%2B%2F3NeEEJgNBoRRSmz0ub%2FfuxEacBg%2FDmYtiCjgo5NG2mBXq%2BH5I1ogMRk9Zbd%2BQU2e1ML6VPLOyf5tvBQ8yT1lG10imxsABm7SLs898GTpyYynEzP60hO3trHDKvMigUwdeaceacqzp7nOI4n0SSIIjl36ao4Z356OV07fSQAk6xJ3XGg%2BLCr1d1OYlVHp4eUHPnerU79ZA%2F1kuv1JQMAg%2BE4O2P23EumF3VkvHprsZKMzKwbRUXFEyTvSIEmTVbrysp%2BWr8wfQHGK6WChVa3bKUmdWou%2BjpArdGkzZ41c1zG%2Fu5uGH4swzd561F%2BuhIT4%2BLnSuPsv9%2BJKIpjNr9dXYOyk7%2FBZrcjIT4eCnoKgedJP4BEqhG77E3NKP31FO7cfQA5K0dSYuLgz2TwCWJSOBzG6crzKK%2BohNfni%2Bx6OMUMMNe%2Fgf7ocbw0v0acKg6J8Ql0q%2BT%2FAXR5PNi5dz9c71upuQqCKFAD%2BYhrZLEAmpodaHO3Qy6TI3NhBpbrshGtOWKOSMYwYGQM8nJzoFJNxP2HjyIQho4PewK6hBktoDcUwtIln4PjOWzflQ%2Be5yl0yCCYgYikTclGlxadio%2BBQCSiW1UXoVGrKYwH4RgMrjU1HAB4vR6LzWYfFUCKxfS8Ftk5qxHoCUQAUkRJaSEokkV6Y%2F%2BJUOC4hn6A39NVXVBYeNP8piH6HeA4fPbpdBQV5KOx0QaL1YppX3Jgk0TwH2Vg6S3u%2BdB91%2B%2FpuNYPYFl5uP5V7ZqvsrX7jxqMXR6ff3gCQSTzFI0a1TX3wIs8ul%2Bq4HuWAAiM39vhOuR1O1fQ2gT%2F26Z8Z5vrl2OHi9OXZn995nLV9aFfS6UC9JeJPfuK0NBohWpCHMSAAsFe74WWP%2BvT25wtP9Bpob6uGqqyDnOtaeumjRu%2ByFu36VntK%2FPA5umTJeUtPWZSU9BCgud661odVp3DZtkc7AnYR33RRC708PrVi1larW7XwZIjLnd7R6SgSqWSNjU1B3F72pz5TZbXmX5vV81Yb7Lg7XT%2FUXriu8XLVqw6c6XqWnBKiiYU%2BMt3wWF7u7i91XlSEITwSAZ%2FCzAAHsJVbwXYFFEAAAAASUVORK5CYII%3D
