# Тест-кейс

**Проект:** M3O

**Раздел:** РЕГИСТРАЦИЯ

**Заголовок:** Регистрация нового пользователя | POST запрос на endpoint <https://api.m3o.com/v1/user/Create>

**ID:** PM-001

 **Приоритет:** Высокий

 **Серьезность:** Высокий

**Описание:**

**Окружение:**  

* Postman: July 2023 (v10.16)
* OC: Windows 11 Pro 21H2 Сборка 22000.2057

**Предусловия:**

* Выполнить авторизация по токену "Y2MzMzMxYTUtYmUwNC00MzE5LTg5MTAtNjlhMzdmMjFiYmJk"

**Шаги по воспроизведению:**

1. "Отправить запрос методом POST на endpoint <https://api.m3o.com/v1/user/Create>  

* PAYLOAD:

```json
    {  
    "email": "T1@go.com",  
    "password": "Password123",  
    "id": "user-1456",
    "username": "joe"  
    }
```

**Ожидаемый результат:**

* Новый пользователь создан и код ответа 200

* RESPONSE:

```json
{  
    "account":  
    {  
        "id": "user-1456",  
        "username": "joet",  
        "email": "T1@go.com",  
        "created": "1689695377",  
        "updated": "1689695377",  
        "verified": false,  
        "verification_date": "0",  
        "profile": {}  
    }  
}  
```

---
