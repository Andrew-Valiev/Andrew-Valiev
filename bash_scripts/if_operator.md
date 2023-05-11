# поиск пользователя 
user=pion
if grep $user /etc/passwd
then
echo "The user $user Exists"
fi

# if-then-else для исполнения 2-го условия else если if окажется ложным
user=anotherUser
if grep $user /etc/passwd
then
echo "The user $user Exists"
else
echo "The user $user doesn’t exist"
fi

# if-then-elif использоватиь elif если нужно больше чем 1 доп. условие | выполниться только одно истенное условие 
user=anotherUser
if grep $user /etc/passwd
then
echo "The user $user Exists"
elif ls /home
then
echo "The user doesn’t exist but anyway there is a directory under /home"
elif ls /home/pion/
then
echo "see file"
fi

# Сравнение чисел
val1=6
if [ $val1 -gt 5 ]
then
echo "The test value $val1 is greater than 5"
else
echo "The test value $val1 is not greater than 5"
fi
