# Поиск логов по диапазонам дат awk

  # awk '{if (($1 >= "02-26" && $1 <= "02-27") && ($2 >= "12:07" && $2 <= "12:35") ) print $0 }' f6.txt
  # awk -v start="02-26 12:07" -v end="02-26 12:08" '$1 >= start && $1 <= end' f6.txt
  # awk '{field12=$1 $2; start="02-2612:07"; end="02-2612:35"; if ((field12 >= start && field12 <= end) ) print $0 }' f6.txt

grep -E '^([[:digit:]]{2}-[[:digit:]]{2}-[[:digit:]]{4})' $1 | awk -v start="$2" -v end="$3" '$1 >= start && $1 <= end';
