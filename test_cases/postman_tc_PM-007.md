# Тест-кейс

**Проект:** M3O

**Раздел:** СБРОС ПАРОЛЯ

**Заголовок:** Сброс пароль с помощью кода восстановления пароля | POST запрос на endpoint <https://api.m3o.com/v1/user/ResetPassword>

**ID:** PM-007

 **Приоритет:** Высокий

 **Серьезность:** Высокий

**Описание:**

**Окружение:**  

* Postman: July 2023 (v10.16)
* OC: Windows 11 Pro 21H2 Сборка 22000.2057

**Предусловия:**

* Выполнить авторизация по токену "Y2MzMzMxYTUtYmUwNC00MzE5LTg5MTAtNjlhMzdmMjFiYmJk"
* Для получения кода выполнить тест кейс PM-006

**Шаги по воспроизведению:**

1. Отправить запрос методом POST на endpoint <https://api.m3o.com/v1/user/ResetPassword>  

* PAYLOAD:

```json
{
    "email": "vaaplus@gmail.com",
    "code": "S4QzKnVX",
    "newPassword": "NewPassword1",
    "confirmPassword": "NewPassword1"
}
```

**Ожидаемый результат:**

* Пароль сброшен и установлен новый пароль, код ответа 200

* RESPONSE:

```json
  {}
```

---
