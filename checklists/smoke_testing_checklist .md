# Чек лист smoke тестирования

> ## Тест план smoke тестирования

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
    - Актуальность цен и наличие товара на складе

4. Корзина и оформление заказа:
    - Добавление товаров в корзину
    - Изменение количества товаров в корзине
    - Удаление товаров из корзины
    - Оформление заказа без регистрации
    - Оформление заказа с использованием зарегистрированного аккаунта
    - Выбор способа доставки и оплаты заказа
    - Пересчёт стоимости заказа при изменении количества товаров, выборе способа доставки и оплаты

5. Отслеживание заказа:
    - Отправка уведомления о состоянии заказа (подтверждение оформления, оплаты, отправки)
    - Возможность отслеживания статуса заказа в личном кабинете
    - Отображение даты и времени доставки, идентификатора посылки

6. Система обратной связи:
    - Форма обратной связи
    - Ответ на обращение клиента
    - Пользовательское соглашение, политика конфиденциальности и правила использования сайта

7. Тестирование на разных устройствах и браузерах:

    - Проверка работы интернет-магазина на различных устройствах (ноутбуки, смартфоны, планшеты)
    - Проверка работы интернет-магазина в различных браузерах (Google Chrome, Mozilla Firefox, Opera, Safari)
    - Кроме того, можно проверить работу дополнительных функций: подписка на новости, возвращение товара, система скидок и акций, интеграция с социальными сетями.

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
        <th>Комментарии</th>
      </tr>
    </thead>
    <tr align='justify'>
      <td>sm_t_001</td>
      <td align='justify'>Aliexpress | СОЗДАНИЕ АККАУНТА | Вход через аккаунт Гугл </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Аккаунт создан</td>
      <td align='justify'>Аккаунт создан</td>
      <td align='justify' style="color: green;">PASS</td>
      <td align='justify' >-</td>
    </tr>
     <tr align='justify'>
      <td>sm_t_002</td>
      <td align='justify'>Aliexpress | СОЗДАНИЕ АККАУНТА | Создание нового аккаунта </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Аккаунт создан</td>
      <td align='justify'>-</td>
      <td align='justify'>SKIP</td>
      <td align='justify' >-</td>
    </tr>
    <tr align='justify'>
      <td>sm_t_003</td>
      <td align='centrer'>Aliexpress | ВХОД В СИСТЕМУ | Вход в систему с зарегистрированного аккаунта </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Вход в систему</td>
      <td align='justify'>Вход в систему выполнен</td>
      <td align='justify' style="color: green;">PASS</td>
      <td align='justify' >-</td>
    </tr>
     <tr align='justify'>
      <td>sm_t_004</td>
      <td align='centrer'>Aliexpress | ПАРОЛЬ | Восстановление пароля </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Пароль изменен</td>
      <td align='justify'>Письмо с кодом не пришло</td>
      <td align='justify' style="color: red;">FAIL</td>
      <td align='justify' >-</td>
    </tr>
    <tr align='justify'>
      <td>sm_t_005</td>
      <td align='centrer'>Aliexpress | ПОИСК ТОВАРОВ | Поиск по названию товара </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Товар найден</td>
      <td align='justify'>Товар найден</td>
      <td align='justify' style="color: green;">PASS</td>
      <td align='justify' >В результатах поиска присутствуют сопутствующие товары </td>
    </tr>
    <tr align='justify'>
      <td>sm_t_006</td>
      <td align='centrer'>Aliexpress | ПОИСК ТОВАРОВ | Поиск по категории товаров </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Товар найден</td>
      <td align='justify'>Товар найден</td>
      <td align='justify' style="color: green;">PASS</td>
      <td align='justify' >- </td>
    </tr>
     <tr align='justify'>
      <td>sm_t_007</td>
      <td align='centrer'>Aliexpress | ПОИСК ТОВАРОВ | Фильтрация результатов поиска </td>
      <td align='centrer'>Высокий</td>
      <td align='centrer'>Высокий</td>
      <td align='justify'>Товар найден</td>
      <td align='justify'>Товар найден</td>
      <td align='justify' style="color: green;">PASS</td>
      <td align='justify' >Некоторые фильтры не применимы с категорией товаров</td>
    </tr>
   
  </table>
