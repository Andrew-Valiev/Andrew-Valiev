# Тест-кейс

**Проект:** M3O

**Раздел:** ОБНОВЛЕНИЕ ИМЕНИ

**Заголовок:** Обновление имени пользователя | POST запрос на endpoint <https://api.m3o.com/v1/user/Update>

**ID:** PM-005

 **Приоритет:** Высокий

 **Серьезность:** Низкий

**Описание:**

**Окружение:**  

* Postman: July 2023 (v10.16)
* OC: Windows 11 Pro 21H2 Сборка 22000.2057

**Предусловия:**

* Выполнить авторизация по токену "Y2MzMzMxYTUtYmUwNC00MzE5LTg5MTAtNjlhMzdmMjFiYmJk"

**Шаги по воспроизведению:**

1. "Отправить запроса методом POST на endpoint <https://api.m3o.com/v1/user/Update>  

* PAYLOAD:

```json
{
  "id": "user-1456",
  "username": "joenew-del"
}
```

**Ожидаемый результат:**

* Имя пользователя обновлено и код ответа 200

* RESPONSE:

```json
  {}
```

---
