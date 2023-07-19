# Тест-кейс

**Проект:** M3O

**Раздел:** СБРОС ПАРОЛЯ

**Заголовок:** Отправка письма с кодом для сброса пароля | POST запрос на endpoint <https://api.m3o.com/v1/user/SendPasswordResetEmail>

**ID:** PM-006

 **Приоритет:** Высокий

 **Серьезность:** Высокий

**Описание:**

**Окружение:**  

* Postman: July 2023 (v10.16)
* OC: Windows 11 Pro 21H2 Сборка 22000.2057

**Предусловия:**

* Выполнить авторизация по токену "Y2MzMzMxYTUtYmUwNC00MzE5LTg5MTAtNjlhMzdmMjFiYmJk"

**Шаги по воспроизведению:**

1. Отправить запрос методом POST на endpoint <https://api.m3o.com/v1/user/SendPasswordResetEmail>  

* PAYLOAD:

```json
{
    "email": "vaaplus@gmail.com",
    "subject": "Password reset",
    "textContent": "Hi there,\n click here to reset your password: myapp.com/reset/code?=$code",
    "expiration": 1800,
    "fromName": "joe"
}
```

2. Получить по почте письмо с кодом для сброса пароля

**Ожидаемый результат:**

* Получено письмо с кодом для сброса пароля и код ответа 200

* RESPONSE:

```json
  {}
```

---
