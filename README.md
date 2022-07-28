# SQL



SELECT * FROM название таблицы ;

SELECT название столбцов FROM название таблицы;

Фильтрация строк WHERE. Регулярные выражения LIKE. AND и OR. IN
WHERE - используется для фильтрации записей
Шаблонные выражения необходимо для поиска строк по шаблонам, прописываем шаблон всегда после фразы LIKE (%тут содержится текст который ищем%)
Например: 
Выведите клиентов, чей номер телефона (Phone) содержит "5555". Сколько их? Четыре символа (пятерки) подряд могут быть в начале номера, в середине или в конце.
Решение: select *
from Customers
where Phone like '%5555%'

Оператор BETWEEN - даёт возможно указать диапозон для поиска
 AND и OR -используются для фильтрации записей , где есть несколько условий , данные операторы можно комбинировать 
Оператор AND имеет приоритет над оператором OR, если нужно сделать приоритет для OR выражение заключаем в скобки ().
Оператор IN позволяет указать несколько значений в предложении WHERE.

пример: Выведите информацию о клиенте, который проживает в стране США и работает в должности "Marketing Assistant". Как зовут этого человека?
решение: select *
from Customers
where country ='USA' and ContactTitle= 'Marketing Assistant';


Сортировка строк ORDER BY (после данного оператора пишется поле по которому нужна сортировка, всегда пишется в конце скрипта)
по умолчанию сортировка идёт от меньшего к большему , если нам необходимо наоборот в конце добавляем DESC
-если нам нужна сортировка несколько столбцов, после оператора ORDER BY пишем столбцы по порядку в какой последовательности должна проходить сортировка


Агрегирующие функции: COUNT, SUM, MIN, MAX, AVG. Алиасы (AS)
.
COUNT () - данный оператор показывает количество строк в столбце 
DISTINCT - данный оператор считает уникальные значения
AVG () - среднее значение числового столбца 
SUM () возвращает общую сумму числового столбца.
MIN() возвращает наименьшее значение выбранного столбца
MAX() возвращает наибольшее значение выбранного столбца.
Алиасы (AS) AS - псевдонимы SQL используются для присвоения таблице или столбцу в таблице временного имени

Задача: Выведите минимальную, среднюю и максимальную стоимость продуктов, которые входят в категорию (CategoryID) №3. Какова максимальная стоимость продуктов в этой категории? Ответ округлите до целого числа. Присвойте итоговым столбцам новые имена: min_price, avg_price, max_price.

Решение: select min (UnitPrice) as min_price, avg (UnitPrice) as avg_price , max (UnitPrice) as max_price
from Products
where CategoryID = '3';

Задача: Посчитайте кол-во уникальных профессий клиентов, проживающих в Великобритании.
Решение: select distinct ContactTitle
from Customers
where country = 'UK';

Группировка строк GROUP BY и HAVING

Заявление GROUP BY группирует строки с одинаковыми значениями в сводные строки, например "найти количество клиентов в каждой стране".

Заявление GROUP BY часто используется с агрегатными функциями (COUNT, MAX, MIN, SUM, AVG) для группировки результирующего набора по одному или нескольким столбцам.

Задача: Из таблицы Products выведите ID категорий (СategoryID) и среднюю стоимость товаров в категориях. В какой категории (CategoryID) самая высокая средняя стоимость товаров?
Решение: select CategoryID, avg (UnitPrice)
from Products
group by CategoryID
order by avg (UnitPrice) desc;

Задача: У какого количества клиентов в должности есть слово Sales, а регион не заполнен?

Решение: select *
from Customers
where ContactTitle like '%Sales%' and Region is null; 

Задача : Выведите максимальную и минимальную стоимость товаров в каждой категории (CategoryID). В какой категории самая большая разница между самой высокой ценой товара и самой низкой ценой?

Решение: select CategoryID , max (UnitPrice) - min (UnitPrice) 
from Products
group by CategoryID 
order by max (UnitPrice) - min (UnitPrice)  desc;

Задача: Найдите заказ (OrderID) с самым большим количеством штук (Quantity) товаров в чеке. Если в заказе несколько разных товаров, то штуки нужно сложить. Какой OrderID у заказа?
Решение : select OrderID, sum (Quantity) 
from [Order Details]
group by OrderID 
order by sum (Quantity) desc

JOIN
Предложение JOIN используется для объединения строк из двух или более таблиц на основе связанного столбца между ними.

Вот различные типы соединений в SQL:

(INNER) JOIN: Возвращает записи, имеющие совпадающие значения в обеих таблицах
LEFT (OUTER) JOIN: Возвращает все записи из левой таблицы и совпадающие записи из правой таблицы
RIGHT (OUTER) JOIN: Возвращает все записи из правой таблицы и совпадающие записи из левой таблицы
FULL (OUTER) JOIN: Возвращает все записи при наличии совпадения в левой или правой таблице


INNER JOIN
Ключевое слово INNER JOIN выбирает записи, имеющие совпадающие значения в обеих таблицах

![image](https://user-images.githubusercontent.com/104627450/181267110-4ac8d1e5-fe5e-42d0-95a9-659931bb0cae.png)



Задача: Посчитайте суммарную выручку (стоимость) по заказам, которые были совершены в 1997 году. Ответ округлите до целого числа.

Решение:select sum (Quantity* UnitPrice*(1-Discount))
from Orders as t1 inner join [Order Details] as t2 on t1.OrderID = t2.OrderID
where OrderDate between '1997-01-01 00:00:00.000' and '1997-12-31 00:00:00.000';


LEFT (OUTER) JOIN: Возвращает все записи из левой таблицы и совпадающие записи из правой таблицы

![image](https://user-images.githubusercontent.com/104627450/181267217-209d31ca-d9a2-4431-968a-5f257bf58e2a.png)


В каких городах проживают клиенты, которые не совершили ни одного заказа? Используйте LEFT JOIN для решения задачи.

Решение: SELECT ContactName, orderID, City
FROM Customers as t1 left join Orders as t2 on t1.CustomerID = t2.CustomerID
where t2.OrderID IS NULL

RIGHT (OUTER) JOIN: Возвращает все записи из правой таблицы и совпадающие записи из левой таблицы
![image](https://user-images.githubusercontent.com/104627450/181268582-644a45de-9ed4-4bd2-8fdc-d44f4b8a771d.png)

FULL (OUTER) JOIN: Возвращает все записи при наличии совпадения в левой или правой таблице

![image](https://user-images.githubusercontent.com/104627450/181268674-a6e4359d-34d9-42f7-a5a3-2e7936a2500f.png)


UNION
Оператор UNION используется для объединения результирующего набора из двух или более заявлений SELECT.

Каждый оператор SELECT в UNION должен иметь одинаковое количество столбцов
Столбцы также должны иметь схожие типы данных
Столбцы в каждом заявлении SELECT также должны располагаться в том же порядке


Задача : Посчитайте количество заказов, в которых присутствует товар Chocolade.
Решение: select count (*)
from Products as t1 inner join [Order Details] as t2 on t1.ProductID=t2.ProductID
where ProductName= 'Chocolade'; 

Задача: Посчитайте общую выручку, которую принесли товары категории Confections. Ответ округлите до целого числа.

Решение: 
select sum (t1.Quantity * t1.UnitPrice * (1-t1.Discount)) as 'Выручка'
from [Order Details] as t1 inner join Products as t2 on t1.ProductID = t2.ProductID
						   inner join Categories as t3 on  t2.CategoryID = t3.CategoryID
where CategoryName= 'Confections';

Задача: Посчитайте выручку по каждой категории. Какая категория принесла самую высокую выручку?

Решение: 
select CategoryName, sum (t1.Quantity * t1.UnitPrice * (1-t1.Discount)) as 'Выручка'
from [Order Details] as t1 inner join Products as t2 on t1.ProductID = t2.ProductID
						   inner join Categories as t3 on  t2.CategoryID = t3.CategoryID
group by CategoryName 
order by sum (t1.Quantity * t1.UnitPrice * (1-t1.Discount))  desc

Задача: Клиент Simon Crowther утверждает, что оформил заказ 29 апреля 1998 года, но заказ пришел неполный - часть товаров отсутствует. Найдите всю информацию по сотруднику, который оформил этот заказ, чтобы связаться с ним. Как зовут этого сотрудника?

Решение: 
select FirstName, LastName
from Customers as t1 inner join Orders as t2 on t1.CustomerID = t2.CustomerID
                     inner join Employees as t3 on t2.EmployeeID =t3.EmployeeID
where ContactName = 'Simon Crowther' and OrderDate = '1998-04-29 00:00:00.000';

Задача: Как зовут клиента с наибольшим кол-вом заказов?
Решение: select ContactName, count (*) as 'Количество заказов'
from Customers as t1 inner join Orders as t2 on t1.CustomerID= t2.CustomerID
group by ContactName 
order by count (*) desc;

Задача: Найдите клиента, который проживает в одном городе (City), но оформляет доставку в другой город (Shipcity).
Решение: select ContactName, City, ShipCity
from Customers as t1 inner join Orders as t2 on t1.CustomerID=t2.CustomerID
where City != ShipCity; 

Задача: Посчитайте количество заказов, которые не были доставлены (столбец ShippedDate не заполнен)?
Решение: select count (OrderID) 
from Orders
where ShippedDate is null; 

Задача: select ShipCity, ShipCountry, OrderDate 
from Orders
where ShipCountry ='UK' and OrderDate between '1998-02-01 00:00:00.000' and '1998-02-28 00:00:00.000'

Решение: select ShipCity, ShipCountry, OrderDate 
from Orders
where ShipCountry ='UK' and OrderDate between '1998-02-01 00:00:00.000' and '1998-02-28 00:00:00.000'

Задача: Найдите заказ (OrderID), стоимость которого составила 2900.
Решение: select OrderID, sum (Quantity * UnitPrice * (1-Discount)) 
from [Order Details]
group by OrderID
having sum (Quantity * UnitPrice * (1-Discount)) = 2900

--Каждый столбец в таблицах имеет свой тип данных. Тип данных определяет какие значения будут храниться в столбце и кол-во памяти необходимое для хранения значений.

Типы данных условно можно разделить на 4 группы:

- Числовые типы данных для хранения чисел: bigint, numeric, bit, smallint, decimal, smallmoney, int, tinyint, money, float;

- Дата и время: date, datetimeoffset, datetime2, smalldatetime, datetime, time;

- Символьные типы данных для хранения набора символов: char, varchar, text, nchar, nvarchar, ntext;

- Прочие типы данных: binary, varbinary, image, курсор, rowversion, hierarchyid, uniqueidentifier, sql_variant, xml, типы пространственной геометрии, типы пространственной географии, table

ROUND - Округляет число до заданного количества знаков после запятой

Задача: Посчитайте общую выручку по всем заказам, которые были оформлены в 1996 году. C помощью функции Round() округлите ответ до целого числа.
Решение: select round (sum (t2.Quantity * t2.UnitPrice * (1-t2.Discount)), 0)
from Orders as t1 inner join [Order Details] as t2 on t1.OrderID=t2.OrderID
where OrderDate between '1996-01-01 00:00:00.000' and '1996-12-31 00:00:00.000' ;

Задача: C помощью функции LEN() найдите самое длинное полное имя (имя и фамилия) клиента. Из какого количества символов, включая пробел, состоит полное имя.
Решение: select ContactName, len (ContactName)
from Customers
order by ContactName desc;

