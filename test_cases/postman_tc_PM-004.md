# Тест-кейс

**Проект:** M3O

**Раздел:** ОБНОВЛЕНИЕ ПАРОЛЯ

**Заголовок:** Обновление пароля пользователя 

**ID:** PM-004

 **Приоритет:** Высокий

 **Серьезность:** Высокий

**Описание:**

**Окружение:**  

* Postman: July 2023 (v10.16)
* OC: Windows 11 Pro 21H2 Сборка 22000.2057

**Предусловия:**

* Выполнить авторизация по токену "Y2MzMzMxYTUtYmUwNC00MzE5LTg5MTAtNjlhMzdmMjFiYmJk"

**Шаги по воспроизведению:**

1. "Отправить запрос методом POST на endpoint <https://api.m3o.com/v1/user/UpdatePassword>  

* PAYLOAD:

```json
{
  "userId": "user-1456",
  "oldPassword": "Password123",
  "newPassword": "Password2789",
  "confirmPassword": "Password2789"
}
```

**Ожидаемый результат:**

* Пароль пользователя обновлен и код ответа 200

* RESPONSE:

```json
  {}
```

---
