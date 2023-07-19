# Тест-кейс

**Проект:** M3O

**Раздел:** ДАННЫЕ АККАУНТА

**Заголовок:** Получить данные о учетной записи пользователя | POST запрос на endpoint <https://api.m3o.com/v1/user/Read>

**ID:** PM-010

 **Приоритет:** Высокий

 **Серьезность:** Высокий

**Описание:**

**Окружение:**  

* Postman: July 2023 (v10.16)
* OC: Windows 11 Pro 21H2 Сборка 22000.2057

**Предусловия:**

* Выполнить авторизация по токену "Y2MzMzMxYTUtYmUwNC00MzE5LTg5MTAtNjlhMzdmMjFiYmJk"

**Шаги по воспроизведению:**

1. Отправить запрос методом POST на endpoint <https://api.m3o.com/v1/user/Read>  

* PAYLOAD:

```json
{
    "email": "vaaplus@gmail.com",
    "id": "user-1456",
    "username": "joe"
}
```

**Ожидаемый результат:**

* Получены данные о учетной записи пользователя, код ответа 200

* RESPONSE:

```json
{
  "account": {
        "id": "user-1456",
        "username": "joe",
        "email": "vaaplus@gmail.com",
        "created": "1689594394",
        "updated": "1689687105",
        "verified": false,
        "verification_date": "0",
        "profile": {}
    }
}
```

---
