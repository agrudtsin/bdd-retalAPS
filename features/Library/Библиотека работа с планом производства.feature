@ExportScenarios
@tree

Функционал: Библиотека работа с планом производства

Как Программист
Я хочу сформировать библиотеку с часто используемыми шагами сценариев
Чтобы сделать feature файлы более читаемыми


Сценарий: открываю документ с номером "Парам1" в обработке планирования с заголовком "Парам2"
	Когда В панели разделов я выбираю "Планирование производства (APS)"
	И     В панели функций я выбираю "План производства (с редактированием)"
	И     я нажимаю кнопку выбора у поля "Документ планирования"
	Тогда открылось окно "План производства"
	И     В форме "План производства" в таблице "Список" я перехожу к строке:
	| 'Сценарий'          |
	| 'План производства' |
	И     в ТЧ "Список" я активизирую поле "Номер"
	И     я нажимаю на кнопку "Найти..."
	Тогда открылось окно "Найти"
	И     в поле "&Что искать" я ввожу текст "Парам1"
	И     я меняю значение переключателя "Как искать" на ""
	И     я нажимаю на кнопку "&Найти"
	Тогда открылось окно "План производства"
	И     в ТЧ "Список" я активизирую поле "Период c"
	И     В форме "План производства" в ТЧ "Список" я выбираю текущую строку
	И     я нажимаю на кнопку с именем "ФормаКомандаСформироватьОтчет"
	Тогда открылось окно "Парам2"

Сценарий: закрываю текущее окно с заголовком "Парам2" без сохранения изменений
	И     Я закрываю окно "Парам2"
	Тогда открылось окно "1С:Предприятие"
	И     я нажимаю на кнопку "Да"

Сценарий: пересчитываю план производства со снятым флагом ИзменениеПорядка_ОптимизацияПартий
	И     я нажимаю на кнопку с именем "ФормаКомандаСформироватьОтчет"
	И     я нажимаю на кнопку "Выделить весь отчет"
	И     я нажимаю на кнопку "Показать_ФормаСвободноеОкно_Помощник"
	Тогда открылось окно "Помощник"
	И     я снимаю флаг "Изменение порядка партий"
	И     элемент формы с именем "фИзменениеПорядка_ОптимизацияПартий" стал равен "Нет"
	И     я нажимаю на кнопку "       А    "
	И     Я закрываю окно "Помощник"

Сценарий: в форме с заголовком "ПарамЗаголовок" на вкладке Техоперации изменяю количество на "ПарамКоличествоСтало" по "ПарамОбъект" за "ПарамДата"
	Когда открылось окно "ПарамЗаголовок"
	И     в ТЧ "ТехнологическиеОперации" я нажимаю на кнопку "Найти..."
	Тогда открылось окно "Найти"
	И     я нажимаю кнопку выбора у поля "&Где искать"
	И     из выпадающего списка "&Где искать" я выбираю "Объект (по строке)"
	И     в поле "&Что искать" я ввожу текст "ПарамОбъект"
	И     я нажимаю на кнопку "&Найти"
	И     в ТЧ "ТехнологическиеОперации" я нажимаю на кнопку "Найти..."
	Тогда открылось окно "Найти"
	И     я изменяю флаг "Искать в найденном"
	И     я нажимаю кнопку выбора у поля "&Где искать"
	И     из выпадающего списка "&Где искать" я выбираю "Интервал с"
	И     в поле "&Что искать" я ввожу текст "ПарамДата"
	И     я нажимаю на кнопку "&Найти"
	Тогда открылось окно "ПарамЗаголовок"
	И     в ТЧ "ТехнологическиеОперации" я активизирую поле "Количество"
	И     В форме "ПарамЗаголовок" в ТЧ "ТехнологическиеОперации" я выбираю текущую строку
	И     в ТЧ "ТехнологическиеОперации" в поле "Количество" я ввожу текст "ПарамКоличествоСтало"
	И     В форме "ПарамЗаголовок" в ТЧ "ТехнологическиеОперации" я завершаю редактирование строки
	И     в ТЧ "ТехнологическиеОперации" я нажимаю на кнопку "Отменить поиск"

	#И     я перехожу к закладке "Технологические операции"
	
