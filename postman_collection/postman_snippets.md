# Postman snippets

>## Pre-requests Script установить время ожидания перед отправкой запроса

```javascript
let moment = require("moment")
console.log("before:", moment())
setTimeout(function () { console.log("after:", moment()) }, 2000) 
// ожидание 2 сек.
```

---

>## Объявление нескольких тестов

```javascript
var jsonData = pm.response.json(); // вынесем первую строчку, чтобы обращаться к ней из из других тестов

// проверка значений в объекте 
pm.test("Your test name", function () {
        pm.expect(jsonData.value).to.eql(100);
});

// проверки текста в ответе 
pm.test("Body is correct", function () {
 pm.response.to.have.body('текст поиска 1 ', 'текст поиска 2');
});
```

---

>## Сравнение значений в массиве и локальной переменной

```javascript
pm.test("lalala  laaa", function () {
    const response = pm.response.json();
    pm.expect(parseInt(pm.environment.get("ID-Playlists"))).to.eql(response[0].id);
});

// сравнение значений в массиве и локальной переменной  2-ой вариант 
pm.test("Проверьте имя", function () {
 const response = pm.response.json();
 pm.expect(response[0].id).to.eql(parseInt(pm.environment.get("ID-Playlists")));
 //console.log(ID-Playlists);
});
```

---

>## Сравнение значений в массиве

```javascript
pm.test("сравнение значений в массиве", () => {
 const response = pm.response.json();
 pm.expect(response[0].id).to.eql(48001);
});
```

---

>## Перевод значений в текст и проверка по тексту

```javascript
pm.test("Проверьте имя 2000", function() {
 jsonData = pm.response.text();
 pm.expect(jsonData).to.contain(48001);
});
```

---

>## Проверка что в массиве есть нужное количество индексов

```javascript

 pm.expect(jsonData.data.lenght).to.eql(4);
```

---

>## Сравнение текстовых значений в массиве

```javascript
pm.test("Your test name", function () {
    var jsonData = pm.response.json();
     console.log(jsonData); // вывод ответа на консоль 
    var name = jsonData[2].name; // создаем переменную для искомой (значения) информации в теле ответа 
           pm.expect(name).to.eql(48001); // в первой скобке что наша обвяленная переменная равна такому то значения и проверяем это 
});
```

---

>## Проверка статус кода

```javascript
pm.test("Код 200", function () {
    pm.response.to.have.status(200);
}); 

// Проверка статус кода 
pm.test("Status code is 200", () => {
  pm.expect(pm.response.code).to.eql(200);
});

// Проверка нескольких статус кодов
pm.test("Successful POST request", () => {
  pm.expect(pm.response.code).to.be.oneOf([201,202]);
});

// Проверьте текст кода состояния:
pm.test("Status code name has string", () => {
  pm.response.to.have.status("Created");
});

```

---

>## Проверка объектов

```javascript
pm.test("name test", function () {
    var jsonData = pm.response.json();
    var expectedObject = {         // указать поля для проверок
         "name": "алвдв"
    }
    pm.expect(jsonData).to.include(expectedObject);
});
```

```javascript
// Проверка нового пользователя
pm.test("Проверка данных нового пользователя", function () { 
    let jsonData = pm.response.json();  // создание переменной, которая содержит весь наш ответ
    let session = jsonData.session.userId; // создание переменной и обращение к нужному полю в объекте
    console.log(session)
   
    pm.expect(session).to.eql("user-1456");
});
```

---

>## Сохранения токена в локальное окружение

```javascript
var jsonData = JSON.parse(responseBody);
postman.setEnvironmentVariable("token",jsonData.id); //в "" название переменной в окружении | jsonData. название переменной в теле ответа 
```

---

>## Проверка не существующего объекта

```javascript
pm.test("объект не существует", function () {
 const response = pm.response.json();
 pm.expect(response[1].name).to.not.eql("Sun_1");
});
```

---

>## Сравниваем в массиве текстовые значения

```javascript
pm.test("Check if user with id1 is Leanne Graham", function () {
    var jsonData = pm.response.json();
    pm.expect(jsonData[0].name).to.eql("Leanne Graham");
});

// Сравние значений в обекте 
var jsonData = pm.response.json(); 
pm.test("Verify Json values", function () { 
    pm.expect(jsonData.data.id).is.to.equal(2); 
    pm.expect(jsonData.data.first_name).is.to.equal("Janet"); 
    pm.expect(jsonData.data.last_name).is.to.equal("Weaver"); 
     });
```

---

>## Цикл перебора массива

```javascript
pm.test("Цикл перебора массива", function () {

    let jsonData = pm.response.json();
    let users = jsonData.users; // jsonData.users.массив   путь к нужному вложенному массиву объявим в переменной

    console.log(users.length); // посмотреть в консоле размер массива

    users.forEach(function(e){ // перебор массива function(e) e - перебор элементов массива
      let username = e.username; // переменная для проверки пары ключ значения в каждом индексе массива let username = +e.username; -- + для сравнения чисел 
      console.log(username);
      let email = e.email;
      //console.log(email);
       

       if (username == "joe") {
        
        pm.expect(username).to.eql("joe");
        console.log(email);
        pm.expect(email).to.eql("vaaplus@gmail.com");
       }


      let created = e.created; //
      let zamena = created.replace("4", "0"); // замена символов можно убрать например запятые или точки с цифр для сравнения чисел, не строк
      let zamena_2 = zamena.replace("1", "7"); // вторая замена
      let nam_ber = +zamena_2; // перевод строки в число
      console.log(nam_ber);


    }); 

});
```

---

>## Использование нескольких утверждений

```javascript
pm.test("The response has all properties", () => {
    // разобрать json ответ и проверить три свойства
    const responseJson = pm.response.json();
    pm.expect(responseJson.type).to.eql('vip');
    pm.expect(responseJson.name).to.be.a('string');
    pm.expect(responseJson.id).to.have.lengthOf(1);
});

//Если какое-либо из содержащихся утверждений завершится неудачно, тест в целом завершится неудачно. Все утверждения должны быть успешными, чтобы тест прошел успешно.
```

---

>## Тестирование заголовков в ответе

```javascript
pm.test("Content-Type header is present", () => {
  pm.response.to.have.header("Content-Type");
});

//проверить значение заголовка ответа
pm.test("Content-Type header is application/json", () => {
  pm.expect(pm.response.headers.get('Content-Type')).to.eql('application/json');
});
```

---

>## Тестирование файлов cookie

```javascript
//проверить, присутствует ли файл cookie в ответе
pm.test("Cookie JSESSIONID is present", () => {
  pm.expect(pm.cookies.has('JSESSIONID')).to.be.true;
});

//проверить, значения файла cookie
pm.test("Cookie isLoggedIn has value 1", () => {
  pm.expect(pm.cookies.get('isLoggedIn')).to.eql('1');
});
```

---

>## Проверка свойств массива

```javascript
//проверить, является ли массив пустым или нет, и содержит ли он определенные элементы
const jsonData = pm.response.json();
pm.test("Test array properties", () => {
    //массив ошибок пуст
  pm.expect(jsonData.errors).to.be.empty;
    //массив включает в себя "товары"
  pm.expect(jsonData.areas).to.include("goods");
    
  //получить объект настроек уведомлений
  const notificationSettings = jsonData.settings.find
      (m => m.type === "notification");
  pm.expect(notificationSettings)
    .to.be.an("object", "Could not find the setting");
    //массив "detail" должен включать "sms"
  pm.expect(notificationSettings.detail).to.include("sms");
    //массив "detail" должен включать все перечисленные элементы
  pm.expect(notificationSettings.detail)
    .to.have.members(["email", "sms"]);
});
```

---

>## Проверка свойств объекта

```javascript
//проверить, что объект содержит ключи или свойства.
pm.expect({a: 1, b: 2}).to.have.all.keys('a', 'b');
pm.expect({a: 1, b: 2}).to.have.any.keys('a', 'b');
pm.expect({a: 1, b: 2}).to.not.have.any.keys('c', 'd');
pm.expect({a: 1}).to.have.property('a');
pm.expect({a: 1, b: 2}).to.be.an('object')
  .that.has.all.keys('a', 'b');
```

---

>## Ошибка проверки равенства

```text
Вы можете столкнуться с AssertionError: expected <value> to deeply equal '<value>'. Например, это может возникнуть при использовании следующего кода:
pm.expect(1).to.eql("1");
Это происходит потому, что тест сравнивает число со строковым значением. Тест вернет значение true только в том случае, если и тип, и значение равны.
```

---

>## Ошибка JSON не определен

```text
Вы можете столкнуться с этой ReferenceError: jsonData is not defined проблемой. Обычно это происходит, когда вы пытаетесь ссылаться на объект JSON, который не был объявлен или находится за пределами области действия вашего тестового кода.
pm.test("Test 1", () => {
  const jsonData = pm.response.json();
  pm.expect(jsonData.name).to.eql("John");
});

pm.test("Test 2", () => {
  pm.expect(jsonData.age).to.eql(29); // jsonData не определен
});
Убедитесь, что любой код, устанавливающий данные вашего ответа в переменную, доступен для всего тестового кода, например, в этом случае вызов const jsonData = pm.response.json(); перед pm.test сделает его доступным для обеих тестовых функций.
```

---

>## Преобразование строки в число

```text
Задача: в одном методе получить id, который состоит из цифр, и проверить, что в другом методе он такой же. 

Решение: 
Казалось бы, все просто. Взяли поле “id” в одном методе, положили в переменную, взяли в другом методе и сравнили. 

       //1 метод. Установить переменную, в которую положить id 
       pm.environment.set("internet.id", pm.response.json().data.id); — 127487

       //2 метод. Взять переменную и сравнить с полученным аналогичным значением
       var id = jsonData.data.internet.id; — "127487"
       tests["Проверяем id интернета - " + pm.environment.get("internet.id")] = id === pm.environment.get("internet.id"); — "127487"===127487

И тут тест падает. Во втором методе Postman записал id как строку, а в переменной произошло волшебство и число преобразовалось в число. Строка числу не равна, хотя внешне выглядит одинаково. 
Преобразование в число можно выполнить простой командой +: добавляем плюс к id
       
       tests["Проверяем id интернета - " + pm.environment.get("internet.id")] = +id === pm.environment.get("internet.id"); 

Если это не работает, тогда есть методы parseInt, unary plus, parseFloat с floor и Math.round .

parseInt()
var x = parseInt("1000", 10); // You want to use radix 10
    // So you get a decimal number even with a leading 0 and an old browser ([IE8, Firefox 20, Chrome 22 and older][1])

var x = +"1000";
floor()
Если ваша строка является или может быть числом с плавающей запятой, и вы хотите целое число:

var x = Math.floor("1000.01"); // floor() automatically converts string to number
Или, если вы собираетесь использовать Math.floor несколько раз:

var floor = Math.floor;
var x = floor("1000.01");
parseFloat()
Если вы из тех, кто забывает вводить основание при вызове parseInt, вы можете использовать parseFloat и округлять его, как вам нравится. Здесь я использую floor.

var floor = Math.floor;
var x = floor(parseFloat("1000.01"));
round()
Интересно, что Math.round (например, Math.floor) преобразует строку в число, поэтому, если вы хотите округлить число (или если у вас есть целое число в строке), это отличный способ, возможно, мой любимый:

var round = Math.round;
var x = round("1000"); // Equivalent to round("1000", 0)

Но есть проблема. Если вы попытаетесь преобразовать "010" с помощью функции parseInt, она распознает как восьмеричное число и вернет число 8. Итак, вам нужно указать основание (от 2 до 36). В данном случае база 10.

parseInt(string, radix)
Пример:

var result = parseInt("010", 10) == 10; // Returns true

var result = parseInt("010") == 10; // Returns false
Обратите parseInt внимание, что после синтаксического анализа неверные данные игнорируются.
Этот идентификатор guid будет проанализирован как 51:

Существует два основных способа преобразования строки в число в JavaScript. Один из способов - разобрать ее, а другой - изменить ее тип на число. Все приемы в других ответах (например, унарный плюс) подразумевают неявное приведение типа строки к числу. Вы также можете сделать то же самое явно с помощью функции Number

var parsed = parseInt("97", 10);
parseInt и parseFloat - это две функции, используемые для преобразования строк в числа. Синтаксический анализ остановится автоматически, если он попадет на символ, который он не распознает, что может быть полезно для синтаксического анализа строк типа "92px", но это также несколько опасно, поскольку при неправильном вводе он не выдаст вам никакой ошибки, вместо этого вы получите обратно NaN, если строка не начинается с числа. Пробелы в начале строки игнорируются.


способ преобразования строки в число:
var x = "1000"*1;
var str = "25";       // String
var number = str*1;   // Number
Итак, при умножении на 1 значение не меняется, но JavaScript автоматически возвращает число.
```

---
