# Тест-кейс

**Проект:** M3O

**Раздел:** СПИСОК ПОЛЬЗОВАТЕЛЕЙ

**Заголовок:** Получить список всех пользователей

**ID:** PM-009

 **Приоритет:** Высокий

 **Серьезность:** Высокий

**Описание:**

**Окружение:**  

* Postman: July 2023 (v10.16)
* OC: Windows 11 Pro 21H2 Сборка 22000.2057

**Предусловия:**

* Выполнить авторизация по токену "Y2MzMzMxYTUtYmUwNC00MzE5LTg5MTAtNjlhMzdmMjFiYmJk"

**Шаги по воспроизведению:**

1. Отправить запрос методом POST на endpoint <https://api.m3o.com/v1/user/List>  

* PAYLOAD:

```json
{
    "offset": 0,
    "limit": 100
}
```

**Ожидаемый результат:**

* Получен список всех пользователей, код ответа 200

* RESPONSE:

```json
{
  "users": [
        {
            "id": "user-1456",
            "username": "joe",
            "email": "vaaplus@gmail.com",
            "created": "1689594394",
            "updated": "1689687105",
            "verified": false,
            "verification_date": "0",
            "profile": {}
        },
        {
            "id": "user-145600",
            "username": "joenew",
            "email": "vaa.plus@gmail.com",
            "created": "1689617666",
            "updated": "1689617666",
            "verified": false,
            "verification_date": "0",
            "profile": {}
        },
        {
            "id": "user-145687",
            "username": "joet",
            "email": "vaaplus-del3@gmail.com",
            "created": "1689695377",
            "updated": "1689695377",
            "verified": false,
            "verification_date": "0",
            "profile": {}
        }
    ]
}
```

---
