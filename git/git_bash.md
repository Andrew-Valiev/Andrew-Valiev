# ![GIT_BASH][linkBash]

## Git Bash commands

---

>### Основные комманды

* `git status` проверка изменений в локальном репозитории
* `git fetch` проверка изменений в удаленном репозитории
* `git diff` последние изменения до коммита
* `git add Linux.txt` добавление файла на отслеживание
  * `git add .` добавление всех файлов на отслеживание
* `git commit -mа "add(README.md):link git_bash"` создание коммита
* `git push` загрузка изменений на удаленный репозиторий
  * `git push -u origin My_Branc` отслеживание ветки и пуш в удаленный репозиторий
  * `git push -u origin :delete` удаляем старую ветку с удаленного репозитория
  * `git push -f origin fad9019:main` указать хеш коммита и ветку удалит все коммиты до этого и откатит нас назад на удаленном репозитории \
  (опасно если работа в ветке ведётся несколькими разработчиками одновременно, тогда такой подход неприемлем.)
* `git pull` загрузка изменений на локальный репозиторий
* `git reset HEAD~1` удаление коммита и откат
  * `git reset --hard fad9019` удаление коммита и откат в локальном репозитории
  * `git reset --soft fad9019` откат с сохранением коммитов в локальном репозитории
* `git log` все коммиты
  * `git log --author Andrew` все коммиты автора
  * `git log --oneline` список коммитов поможет найти хеш нужного коммита
  * `git log --oneline -10` 10 последних коммитов
* `git show` последний коммит
  * `git show a7c6e5214aac0ec84f0836272fa47717662a5814` более подробный коммит по хешу
* `git blame Linux.txt` все коммиты по документу
  * `git blame Linux.txt | grep "Line 8"` коммиты по строке или
  * `git blame Linux.txt | grep '4)'`
  * `git blame Linux.txt | grep Andrew` все коммиты автора в документе
* `git merge --abort` отмена слияния
  `git merge My_Branch` соединяем ветки
* `git checkout Linux.txt` отмена изменений в файле до коммита
  * `git checkout .` отмена в нескольких последних файлов
  * `git checkout My_Branch` переключение между ветками
  * `git checkout -` (минус) для возврата в нашу главную ветку
* `git stash` для скрытия последних изменений до коммита
  * `git stash pop` вернет все последние изменения до коммита  
  * `git stash clear` очистит stash
* `git branch My_Branch` создание новой ветки
  * `git branch` сколько веток есть у нас
  * `git branch -m New_branch NewBranch` переименование пустой ветки
  * `git branch -d New_branch` удаление локальной ветки
  * `git rebase -i HEAD~5` изменение имени коммита
  * `git commit --amend -m "new update"` изменение имени последнего коммита на локальном репозитории
* `git rm -rf .` удалить все файлы в ветке
* `git revert 46ba59d` откат на нужный комиит с записью в истории

---

>### Копирование репозитория на локальный репозиторий

* Перейти в папку с локальным репозиторием и открыть GIT BASH HERE
* `git clone https://github.com/Andrew-Valiev/Myrepository.git`

---

>### Конфликт с файлом

* вносим изменение локальном и удаленном файле в одних строках
* `git commit -am "edit(file):add line"`
* `git push` ошибка
* `git pull` ошибка
* открываем файл редактируем и сохраняем или
  * `git merge --abor` для отмены слияния
* `git add .`
* `git commit -am "conflict(file):decision"`
* `git push`

---

>### Конфликт с файлами

* Создаем разные файлы в локальном и удаленном репозитории
* `git add San.txt`
* `git commit -am "merge(file1 file2)"`
* `git push` ошибка
* `git pull` ошибка
* `git add .`
* `git commit -am "merge(file1 file2):decision"`
* `git push`

---

>### Создание веток

* `git branch My_Branch`
* `git push -u origin My_Branch`

---

>### Cлияние веток

* `git checkout My_Branch`
* `git merge My_Branch`
* `git checkout main`
* `git merge My_Branch` соединяем ветки
* `git push`  

---

>### Конфликты веток

* создаем в главной ветке на удаленном репозитории файл
* изменяем данные в локальном репозитории в любом файле в главной ветке
* создаем локально еще 1 ветку
  * там же вносим изменения в файл и создаем новый файл с данными
* `git branch New_branch`
* `git add Mother` - для нового файла
* `git commit -am` "Создание файла | ветки | изменение файла"
* `git push -u origin New_branch` добавляем ветку в удаленный репозиторий
* `git checkout main` переходим в общую ветку
* `git merge New_branch` соединяем ветки с главной в локальном репозитории
* `git push` ошибка
* `git pull` ошибка
* `git add .`
* `git commit -am "решение"`
* `git push`

---

>### Переименование веток пустых

* `git branch -m New_branch NewBranch`
* `git checkout New Branch`  
* `git add .`
* `git commit -am "rename(New_branch):NewBranch"`
* `git push -u origin NewBranch`

---

>### Переименование веток с файлами на удаленном репозитории

* `git branch -m delete del` переименовываем ветку
* `git push -u origin :delete` удаляем старую ветку с удаленного репозитория
* `git push -u origin del` или
* >> <span style="color:#2971d9"> в github.com открыть ветки нажать "View all branches" и нажать на карандаш и дать новое название ветки </span>
* >> переименовать файлы в удаленном репозитории: нажать редактировать файл и сверху в названии файла можем переименовать его
* >> через слеш  /  можем еще добавить директории или нажать [cancel changed] для отмены

---

>### Удаление веток с локального репозитория

* `git checkout main` переходим в главную ветку
* `git branch -d New_branch` удаление локальной ветки
  * `git fetch origin del`  для возврата ветки в локальный репозиторий из удаленного репозитория
  * `git checkout del` для включения отслеживания этой ветки
* `git push -u origin :New_branch` и если нужно то удаляем ветку и с удаленного репозитория

---

>### Копирование файла из другой ветки в локальном репозитории

* `git checkout main` переход в нужную ветку в которую нужно скопировать файл или директорию
* `git checkout second ./myDir/second.txt` пишем путь и ветку откуда копируем

---

>### Изменение имени коммита в локальном репозитории

* `git log --oneline` получение списка коммитов для выбора нужного
* `git rebase -i HEAD~5` ставим порядковый номер коммита
* в открышемся документе стереть pick и набрать r
* `:wq`
* откроеться сам коммит вносим изменения
* `:wq`
* готово коммит изменен в локальном репозитории
* если коммит запушен, до изменений в локальном репозитории, можно использовать
* `git push -f (указать ветку в которой работаю ) origin main`
* опасно, если работаешь не один, сотру другие коммиты на удаленном репозитории и загружу только свои

---

>### Изменение имени коммита, до пуша (перезапишет коммит, в истории будет только 1 коммит) изменить можно, только последний коммит

* изменили фаил
* `git add .`
* `git commit -am "new up"`
* `git commit --amend -m "new update"` изменения только на локальном репозитории
* `git push`
* готово
* `$ git push -f origin del` пуш для удаленного репозитория если коммит был запушен до изменений (ОПАСНО)

---

>### Откат на нужный комиит с записью в истории

* `git log --oneline -10`
* `git revert 7bad3`
* редактируем коммит месседж если надо
* правим файл и сохраняем если ошибка
* `git add .`
* `git revert -- continue` (2 минуса ) если есть ошибка правим файл и сохраняем
редактируем коммит месседж если надо
* `git push` и отправляем на удаленный репоз.
* чтобы отменить изменения можем сделать еще раз
* `git revert 36a7479` с сохранением коммитов в истории или
  * `git revert --abort` отмена
* `git add .`
* `git push`

---

>### Откат изменений после git add

* `git reset Linux.txt`
  * `git reset .`  для всех файлов
* `git checkout Linux.txt`

---

[linkBash]: https://img.shields.io/badge/-GIT_BASH-190004?style=for-the-badge&logo=image%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw%2FeHBhY2tldCBiZWdpbj0i77u%2FIiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8%2BIDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTExIDc5LjE1ODMyNSwgMjAxNS8wOS8xMC0wMToxMDoyMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkE3MDg2QTAyQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkE3MDg2QTAzQUZCMzExRTVBMkQxRDMzMkJDMUQ4RDk3Ij4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QTcwODZBMDBBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QTcwODZBMDFBRkIzMTFFNUEyRDFEMzMyQkMxRDhEOTciLz4gPC9yZGY6RGVzY3JpcHRpb24%2BIDwvcmRmOlJERj4gPC94OnhtcG1ldGE%2BIDw%2FeHBhY2tldCBlbmQ9InIiPz6lm45hAAADkklEQVR42qyVa0yTVxzGn7d9Wy03MS2ii8s%2BeokYNQSVhCzOjXZOFNF4jx%2BMRmPUMEUEqVG36jo2thizLSQSMd4N8ZoQ8RKjJtooaCpK6ZoCtRXKpRempbTv5ey83bhkAUphz8fznvP8znn%2B%2F3NeEEJgNBoRRSmz0ub%2FfuxEacBg%2FDmYtiCjgo5NG2mBXq%2BH5I1ogMRk9Zbd%2BQU2e1ML6VPLOyf5tvBQ8yT1lG10imxsABm7SLs898GTpyYynEzP60hO3trHDKvMigUwdeaceacqzp7nOI4n0SSIIjl36ao4Z356OV07fSQAk6xJ3XGg%2BLCr1d1OYlVHp4eUHPnerU79ZA%2F1kuv1JQMAg%2BE4O2P23EumF3VkvHprsZKMzKwbRUXFEyTvSIEmTVbrysp%2BWr8wfQHGK6WChVa3bKUmdWou%2BjpArdGkzZ41c1zG%2Fu5uGH4swzd561F%2BuhIT4%2BLnSuPsv9%2BJKIpjNr9dXYOyk7%2FBZrcjIT4eCnoKgedJP4BEqhG77E3NKP31FO7cfQA5K0dSYuLgz2TwCWJSOBzG6crzKK%2BohNfni%2Bx6OMUMMNe%2Fgf7ocbw0v0acKg6J8Ql0q%2BT%2FAXR5PNi5dz9c71upuQqCKFAD%2BYhrZLEAmpodaHO3Qy6TI3NhBpbrshGtOWKOSMYwYGQM8nJzoFJNxP2HjyIQho4PewK6hBktoDcUwtIln4PjOWzflQ%2Be5yl0yCCYgYikTclGlxadio%2BBQCSiW1UXoVGrKYwH4RgMrjU1HAB4vR6LzWYfFUCKxfS8Ftk5qxHoCUQAUkRJaSEokkV6Y%2F%2BJUOC4hn6A39NVXVBYeNP8piH6HeA4fPbpdBQV5KOx0QaL1YppX3Jgk0TwH2Vg6S3u%2BdB91%2B%2FpuNYPYFl5uP5V7ZqvsrX7jxqMXR6ff3gCQSTzFI0a1TX3wIs8ul%2Bq4HuWAAiM39vhOuR1O1fQ2gT%2F26Z8Z5vrl2OHi9OXZn995nLV9aFfS6UC9JeJPfuK0NBohWpCHMSAAsFe74WWP%2BvT25wtP9Bpob6uGqqyDnOtaeumjRu%2ByFu36VntK%2FPA5umTJeUtPWZSU9BCgud661odVp3DZtkc7AnYR33RRC708PrVi1larW7XwZIjLnd7R6SgSqWSNjU1B3F72pz5TZbXmX5vV81Yb7Lg7XT%2FUXriu8XLVqw6c6XqWnBKiiYU%2BMt3wWF7u7i91XlSEITwSAZ%2FCzAAHsJVbwXYFFEAAAAASUVORK5CYII%3D
