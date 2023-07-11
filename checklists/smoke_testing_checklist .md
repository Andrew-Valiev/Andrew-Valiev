# Чек-лист smoke

> ## Тест план smoke

1. Регистрация и авторизация:

    - Создание нового аккаунта
    - Вход в систему с использованием зарегистрированного аккаунта
    - Восстановление пароля

2. Поиск товаров:

    - Поиск по названию товара
    - Поиск по категории товаров
    - Фильтрация результатов поиска (цена, производитель, размер и т.д.)

3. Каталог товаров:

    - Отображение товаров в каталоге
    - Просмотр карточки товара с полной информацией

4. Корзина и оформление заказа:
    - Добавление товаров в корзину
    - Изменение количества товаров в корзине
    - Удаление товаров из корзины
    - Пересчёт стоимости заказа при изменении количества товаров
    - Оформление заказа без регистрации
    - Оформление заказа с использованием зарегистрированного аккаунта
    - Выбор способа доставки и оплаты заказа

5. Отслеживание заказа:
    - Отправка уведомления о состоянии заказа (подтверждение оформления, оплаты, отправки)
    - Возможность отслеживания статуса заказа в личном кабинете
    - Отображение даты и времени доставки, идентификатора посылки

6. Система обратной связи:
    - Форма обратной связи
    - Ответ на обращение клиента

7. Тестирование на разных устройствах и браузерах:

    - Проверка работы интернет-магазина на различных устройствах (ноутбуки, смартфоны, планшеты)
    - Проверка работы интернет-магазина в различных браузерах (Google Chrome, Mozilla Firefox, Opera, Safari)

---

> ### Результаты проведения smoke тестирования интернет магазина <https://aliexpress.ru.>

**Окружение:**  

- Браузер: Яндекс  v.23.5.3.904 (64-bit)
- OC: Windows 11 Pro 21H2 Сборка 22000.2057

---

<table style='width:100%' >
    <thead>
      <tr align='center'>
        <th >ID</th>
        <th>Заголовок</th>
        <th>Приоритет</th>
        <th>Серьезность</th>
        <th>Ожидаемый результат</th>
        <th>Фактический результат</th>
        <th>Статус</th>
      </tr>
    </thead>
    <tr align='justify'>
      <td>sm_t_001</td>
      <td align='justify'>СОЗДАНИЕ АККАУНТА | Вход через аккаунт Гугл </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Аккаунт создан</td>
      <td align='justify'>Аккаунт создан</td>
      <td align='justify' style="color: green;">PASS</td>
    </tr>
     <tr align='justify'>
      <td>sm_t_002</td>
      <td align='justify'> СОЗДАНИЕ АККАУНТА | Создание нового аккаунта </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Аккаунт создан</td>
      <td align='justify'>Аккаунт создан</td>
      <td align='justify'>PASS</td>
    </tr>
    <tr align='justify'>
      <td>sm_t_003</td>
      <td align='centrer'>ВХОД В СИСТЕМУ | Вход в систему с зарегистрированного аккаунта </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Вход в систему</td>
      <td align='justify'>Вход в систему выполнен</td>
      <td align='justify' style="color: green;">PASS</td>
    </tr>
     <tr align='justify'>
      <td>sm_t_004</td>
      <td align='centrer'>ПАРОЛЬ | Восстановление пароля </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Пароль изменен</td>
      <td align='justify'>Письмо с кодом не пришло</td>
      <td align='justify' style="color: red;">FAIL</td>
    </tr>
    <tr align='justify'>
      <td>sm_t_005</td>
      <td align='centrer'>ПОИСК ТОВАРОВ | Поиск по названию товара </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Средний</td>
      <td align='justify'>Товар найден</td>
      <td align='justify'>Товар найден</td>
      <td align='justify' style="color: green;">PASS*</td>
    </tr>
    <tr align='justify'>
      <td>sm_t_006</td>
      <td align='centrer'>ПОИСК ТОВАРОВ | Поиск по категории товаров </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Товар найден</td>
      <td align='justify'>Товар найден</td>
      <td align='justify' style="color: green;">PASS</td>
    </tr>
     <tr align='justify'>
      <td>sm_t_007</td>
      <td align='centrer'>ПОИСК ТОВАРОВ | Фильтрация результатов поиска </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Товар найден</td>
      <td align='justify'>Товар найден</td>
      <td align='justify' style="color: green;">PASS**</td>
    </tr>
    <tr align='justify'>
      <td>sm_t_008</td>
      <td align='centrer'>КАТАЛОГ ТОВАРОВ | Отображение товаров в каталоге </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Товары присутствуют</td>
      <td align='justify'>Товары присутствуют</td>
      <td align='justify'>PASS</td>
    </tr>
     <tr align='justify'>
      <td>sm_t_009</td>
      <td align='centrer'>КАТАЛОГ ТОВАРОВ | Просмотр карточки товара с полной информацией </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Информация о товаре присутствует</td>
      <td align='justify'>Информация о товаре присутствует</td>
      <td align='justify'>PASS</td>
    </tr>
      <tr align='justify'>
      <td>sm_t_010</td>
      <td align='centrer'>КОРЗИНА | Добавление товаров в корзину </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Товары в корзину добавлены </td>
      <td align='justify'>Товары в корзину добавлены</td>
      <td align='justify'>PASS</td>
    </tr>
      <tr align='justify'>
      <td>sm_t_011</td>
      <td align='centrer'>КОРЗИНА | Изменение количества товаров в корзине </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Количество товаров в корзине изменено </td>
      <td align='justify'>Количество товаров в корзине изменено</td>
      <td align='justify'>PASS</td>
    </tr>
    <tr align='justify'>
      <td>sm_t_012</td>
      <td align='centrer'>КОРЗИНА | Удаление товаров из корзины </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Товар из корзины удален </td>
      <td align='justify'>Товар из корзины удален</td>
      <td align='justify'>PASS</td>
    </tr>
    <tr align='justify'>
      <td>sm_t_013</td>
      <td align='centrer'>КОРЗИНА | Пересчёт стоимости заказа при изменении количества товаров </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Стоимость товара изменена</td>
      <td align='justify'>Стоимость товара изменена</td>
      <td align='justify'>PASS***</td>
    </tr>
    <tr align='justify'>
      <td>sm_t_014</td>
      <td align='centrer'>ОФОРМЛЕНИЕ ЗАКАЗА | Оформление заказа без регистрации </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Оформление заказа без регистрации не возможно</td>
      <td align='justify'>Оформление заказа без регистрации не возможно</td>
      <td align='justify'>PASS</td>
    </tr>
    <tr align='justify'>
      <td>sm_t_015</td>
      <td align='centrer'>ОФОРМЛЕНИЕ ЗАКАЗА | Оформление заказа с зарегистрированного аккаунта </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Заказ оформлен</td>
      <td align='justify'>-</td>
      <td align='justify'>SKIP</td>
    </tr>
     <tr align='justify'>
      <td>sm_t_016</td>
      <td align='centrer'>ОФОРМЛЕНИЕ ЗАКАЗА | Выбор способа доставки </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Адрес доставки выбран</td>
      <td align='justify'>Адрес доставки выбран</td>
      <td align='justify'>PASS</td>
    </tr>
      <tr align='justify'>
      <td>sm_t_017</td>
      <td align='centrer'>ОФОРМЛЕНИЕ ЗАКАЗА | Выбор способа оплаты </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Способ оплаты выбран</td>
      <td align='justify'>-</td>
      <td align='justify'>SKIP</td>
    </tr>
     <tr align='justify'>
      <td>sm_t_018</td>
      <td align='centrer'>ОТСЛЕЖИВАНИИЕ ЗАКАЗА | Отправка уведомления о состоянии заказа </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Уведомление получено</td>
      <td align='justify'>-</td>
      <td align='justify'>SKIP</td>
    </tr>
      <tr align='justify'>
      <td>sm_t_019</td>
      <td align='centrer'>ОТСЛЕЖИВАНИИЕ ЗАКАЗА | Проверка статуса заказа в личном кабинете </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Статус изменен</td>
      <td align='justify'>-</td>
      <td align='justify'>SKIP</td>
    </tr>
    <tr align='justify'>
      <td>sm_t_020</td>
      <td align='centrer'>ОТСЛЕЖИВАНИИЕ ЗАКАЗА | Проверка даты доставки </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Дата указанна</td>
      <td align='justify'>Дата указанна</td>
      <td align='justify'>PASS</td>
    </tr>
  </table>

---

- \* В результатах поиска присутствуют сопутствующие товары
- \** Некоторые фильтры не применимы к товару
- \*** Нужно поставить чекбоксы для изменения суммы заказа

>### Итоги smoke тестирования

- Пройдено 15 тестов.
- Правлен 1 тест.
- Пропущено 4 теста.
- Замечаний составлено 3.
