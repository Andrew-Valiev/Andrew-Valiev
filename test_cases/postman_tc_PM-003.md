# Тест-кейс

**Проект:** M3O

**Раздел:** ВЫХОД ИЗ СИСТЕМЫ

**Заголовок:** Выход из системы

**ID:** PM-003

 **Приоритет:** Высокий

 **Серьезность:** Высокий

**Описание:**

**Окружение:**  

* Postman: July 2023 (v10.16)
* OC: Windows 11 Pro 21H2 Сборка 22000.2057

**Предусловия:**

* Выполнить авторизация по токену "Y2MzMzMxYTUtYmUwNC00MzE5LTg5MTAtNjlhMzdmMjFiYmJk"

**Шаги по воспроизведению:**

1. "Отправить запрос методом POST на endpoint <https://api.m3o.com/v1/user/Logout>  

* PAYLOAD:

```json
{
    "session_id": "vLu7cvcHbOBC7fBQouNsnNtDvt6ycBN3h0G8YtzKIak2ENOMbW0YIBCmMqpeMoGMgK97WY6ZWS6BH8ghgI7GsLHQRURoj3ZNuwPg75o9iIsSOZQyVGJZo1DD3Hhd9fUu"
}
```

**Ожидаемый результат:**

* Выполнен выход из системы и код ответа 200

* RESPONSE:

```json
  {}
```

---
