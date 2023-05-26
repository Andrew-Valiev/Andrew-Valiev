# Поиск логов по диапазонам дат sed
  # -r включить поддержку регулярных выражений
  # \x1B[31m&\x1B[0m изменение цвета
  # [] указать диапазон мин.
  #| или
  # найти логи с 02-23 12:00 по 12:07 и с 12:30 по 12:49
# sed -nr "s/02-23 12:(0[0-7]|[3-4])/\x1B[31m&\x1B[0m/p"  f6.txt

sed -nr "s/${1}/\x1B[31m&\x1B[0m/p" f6.txt   # формат поиска с регулярными выражениями ./search_log.sh "02-23 12:(0[0-7]|[3-4])
