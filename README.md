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
