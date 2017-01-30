# language: ru
@tree
Функционал: UC7- Пересчет планов производства после изменения количества в заказе на производство

Как Планировщик
Я хочу чтобы система при изменениях количевства в заданиях на производство автоматически персчитывала план
Чтобы сэкономить ввремя на актуализацию / пересчет плана производства

Контекст: 
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: UC7-1. Один заказ фикс. кво увеличение
	####		| 'Объект'                                       | 18.01 | 19.01 | 20.01 | 21.01 |
	# Дано		| '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'        | 39    | '00'  | '00'  | '00'  |
	#Увеличили заказ. 39 + 97 = 136 * 10320 = 1403520
	# Результат	| '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'        | 39    | '39'  | '39'  | '19'  |
	Когда открываю тестовый документ №000000155 с тестовой ситуацией
		Когда В панели разделов я выбираю "Планирование производства (APS)"
		И     В панели функций я выбираю "План производства (с редактированием)"
		И     я нажимаю кнопку выбора у поля "Документ планирования"
		Тогда открылось окно "План производства"
		И     В форме "План производства" в таблице "Список" я перехожу к строке:
		| 'Дата изменения'     | 'Сценарий'          | 'Дата'               | 'Ответственный' | 'Номер'     | 'Период c'   | 'Период по'  | 'Субъект производства' |
		| '17.01.2017 9:42:51' | 'План производства' | '17.01.2017 8:59:32' | 'Сабитов Илья'  | '000000147' | '17.01.2017' | '25.02.2017' | 'ПФ Екатеринбург'      |
		И     в ТЧ "Список" я активизирую поле "Номер"
		И     я нажимаю на кнопку "Найти..."
		Тогда открылось окно "Найти"
		И     в поле "&Что искать" я ввожу текст "000000155"
		И     я меняю значение переключателя "Как искать" на ""
		И     я нажимаю на кнопку "&Найти"
		Тогда открылось окно "План производства"
		И     в ТЧ "Список" я активизирую поле "Период c"
		И     В форме "План производства" в ТЧ "Список" я выбираю текущую строку
		И     я нажимаю на кнопку с именем "ФормаКомандаСформироватьОтчет"
		Тогда открылось окно "№000000155 за период с * по * ПФ Самара: * (План производства)"
	И увеличиваю количеество с 402 480 до 1 402 480 в здании на производство
		Когда открылось окно "№000000155 за период с * по * ПФ Самара: * (План производства)"
		И     я перехожу к закладке "Данные"
		И     я перехожу к закладке "Технологические операции"
		И     В форме "№000000155 за период с * по * ПФ Самара: * (План производства)" в таблице "ТехнологическиеОперации" я перехожу к строке:
		| 'Рабочий центр' | '№' | 'ячОбъект'                              | 'Объект'                                | 'Период'     | 'Интервал по'        | 'Количество'  | 'Порядок' | '№ цепи' | 'Интервал с'         | 'Комплект переналадок'               |
		| 'САМ.Husky.1'   | '5' | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С' | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С' | '18.01.2017' | '19.01.2017 7:59:59' | '402 480,000' | '1'       | '1'      | '18.01.2017 8:00:00' | '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' |
		И     в ТЧ "ТехнологическиеОперации" я активизирую поле "Количество"
		И     В форме "№000000155 за период с * по * ПФ Самара: * (План производства)" в ТЧ "ТехнологическиеОперации" я выбираю текущую строку
		И     в ТЧ "ТехнологическиеОперации" в поле "Количество" я ввожу текст "1 402 480,000"
	И пресчитываю план производства
		Когда открылось окно "№000000155 за период с * по * ПФ Самара: * (План производства)"
		И     я нажимаю на кнопку с именем "ФормаКомандаСформироватьОтчет"
		Тогда открылось окно "№000000155 за период с * по * ПФ Самара: * (План производства)"
		И     я нажимаю на кнопку "Выделить весь отчет"
		И     я нажимаю на кнопку "К"
	Тогда провееряю, что изменился график производства увеличился с 1го до 3,5-й дней
		И	таблица формы с именем "ТехнологическиеОперации" стала равной:
			| 'Объект1' | 'ячОбъект1' | 'Рабочий центр' | '№' | 'ячОбъект'                              | 'Длительность' | 'Объект'                                                | 'Период'     | 'Качество' | 'Интервал по'         | 'Количество'  | 'Порядок' | 'Интервал с'          | 'Комплект переналадок'               | 'Спецификация' |
			| ''        | ''          | 'САМ.Husky.1'   | ''  | ''                                      | '00:00'        | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'                 | '17.01.2017' | ''         | '17.01.2017 20:00:00' | ''            | ''        | '17.01.2017 20:00:00' | '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | ''             |
			| ''        | ''          | 'САМ.Husky.1'   | '5' | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С' | '1 00:00'      | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'                 | '18.01.2017' | ''         | '19.01.2017 7:59:59'  | '402 480,000' | '1'       | '18.01.2017 8:00:00'  | '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | ''             |
			| ''        | ''          | 'САМ.ASB.1'     | ''  | ''                                      | '00:00'        | '23 (Jar 300ml).60 mm.БСЦ_000.00.САМ.3825'              | '29.12.2016' | ''         | '29.12.2016 20:00:00' | ''            | ''        | '29.12.2016 20:00:00' | '23,0g ▪ [18] ▪ 36-8-NCO102'         | ''             |
			| ''        | ''          | 'САМ.Husky.4'   | ''  | ''                                      | '00:00'        | '25,5.38MM3.93.БСЦ_000.00.САМ.10320.С'                  | '17.01.2017' | ''         | '17.01.2017 20:00:00' | ''            | ''        | '17.01.2017 20:00:00' | '25,5g ▪ [60] ▪ Z448'                | ''             |
			| ''        | ''          | 'САМ.Husky.8'   | ''  | ''                                      | '00:00'        | '30.PCO.125.БСЦ_000.00.САМ.8064'                        | '17.01.2017' | ''         | '17.01.2017 20:00:00' | ''            | ''        | '17.01.2017 20:00:00' | '30,0 ▪ [72] ▪ Z498 ▪ 30.01 gr'      | ''             |
			| ''        | ''          | 'САМ.Husky.3'   | ''  | ''                                      | '00:00'        | '31,5.38MM3.120.МБЕЛ_100.60.САМ.7500.С'                 | '17.01.2017' | ''         | '17.01.2017 20:00:00' | ''            | ''        | '17.01.2017 20:00:00' | '31,5 Bericap 38mm3 ▪ [60] ▪ Z449'   | ''             |
			| ''        | ''          | 'САМ.Husky.5'   | ''  | ''                                      | '00:00'        | '23,7.PCO 1881.90.БСЦ_000.00.САМ.HT.М10.13104.Пепси HF' | '17.01.2017' | ''         | '17.01.2017 20:00:00' | ''            | ''        | '17.01.2017 20:00:00' | '23,7 PCO1881▪ [72] ▪ 708631'        | ''             |
			| ''        | ''          | 'САМ.Husky.6'   | ''  | ''                                      | '00:00'        | '42.PCO.133.ЗЕЛ_370.20.САМ.8208.С'                      | '17.01.2017' | ''         | '17.01.2017 20:00:00' | ''            | ''        | '17.01.2017 20:00:00' | '42,0-133 PCO ▪ [72] ▪ 425445'       | ''             |
			| ''        | ''          | 'САМ.Husky.1'   | '5' | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С' | '1 00:00'      | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'                 | '19.01.2017' | ''         | '20.01.2017 7:59:59'  | '402 480,000' | '2'       | '19.01.2017 8:00:00'  | '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | ''             |
			| ''        | ''          | 'САМ.Husky.1'   | '5' | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С' | '1 00:00'      | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'                 | '20.01.2017' | ''         | '21.01.2017 7:59:59'  | '402 480,000' | '3'       | '20.01.2017 8:00:00'  | '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | ''             |
			| ''        | ''          | 'САМ.Husky.1'   | '5' | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С' | '11:37'        | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'                 | '21.01.2017' | ''         | '21.01.2017 19:37:48' | '195 040,000' | '4'       | '21.01.2017 8:00:00'  | '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | ''             |

		И     табличный документ формы с именем "Результат" стал равен:
			| 'Рабочий центр'                      | ''             | ''             | ''                                             | '18.01 Ср 2017' | '19.01 Чт 2017' | '20.01 Пт 2017' | '21.01 Сб 2017' | '22.01 Вс 2017' | '23.01 Пн 2017' | '24.01 Вт 2017' | '25.01 Ср 2017' | '26.01 Чт 2017' | '27.01 Пт 2017' | '28.01 Сб 2017' | '29.01 Вс 2017' | '30.01 Пн 2017' | '31.01 Вт 2017' | '01.02 Ср 2017' | '02.02 Чт 2017' | '03.02 Пт 2017' | '04.02 Сб 2017' | '05.02 Вс 2017' | '06.02 Пн 2017' | '07.02 Вт 2017' | '08.02 Ср 2017' | '09.02 Чт 2017' | '10.02 Пт 2017' | '11.02 Сб 2017' | '12.02 Вс 2017' |
			| 'Рабочий центр'                      | ''             | ''             | ''                                             | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          |
			| 'Рабочий центр'                      | ''             | ''             | ''                                             | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| 'Комплект переналадок'               | 'Приоритет РЦ' | 'Приоритет КП' | 'Объект'                                       | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| 'САМ.Husky.1'                        | ''             | ''             | ''                                             | '39'            | '39'            | '39'            | '19'            | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| 'Загрузка линий'                     | ''             | ''             | ''                                             | '24'            | '24,0'          | '24,0'          | '11,6'          | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| 'Переналадки'                        | ''             | ''             | ''                                             | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| '23,5g ▪ [48] ▪ DP90 ▪ BPF'          | '50'           | ''             | '23,5.BPF.100.БСЦ_000.00.САМ.12960.С'          | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| '23,5g ▪ [48] ▪ DP90 ▪ BPF'          | '50'           | ''             | '23,5.BPF.100.БСЦ_000.00.САМ.12960.С3'         | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| '23,5g ▪ [48] ▪ DP90 ▪ BPF'          | '50'           | ''             | '23,5.BPF.100.ГОЛ_200.10.САМ.12960.С'          | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| '23,5g ▪ [48] ▪ DP90 ▪ BPF'          | '50'           | ''             | '23,5.BPF.100.ГОЛ_200.10.САМ.12960.С3'         | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| '23,5g ▪ [48] ▪ DP90 ▪ BPF'          | '50'           | ''             | '23,5.BPF.100.МБЕЛ_100.60.САМ.12240'           | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | '90'           | ''             | '25,5.38MM3.93.БСЦ_000.00.САМ.10320.С'         | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | '90'           | ''             | '25,5.38MM3.93.БСЦ_000.00.САМ.10320.С2'        | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | '90'           | ''             | '25,5.38MM3.93.БСЦ_000.00.САМ.М10.10320.С'     | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | '90'           | ''             | '25,5.38MM3.93.БСЦ_000.00.САМ.М10.10320.С2.МБ' | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | '90'           | ''             | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'        | '39'            | '39'            | '39'            | '19'            | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | '90'           | ''             | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С2'       | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | '90'           | ''             | '25,5.38MM3.93.МБЕЛ_100.60.САМ.М10.10320.С'    | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
			| 'Итого'                              | ''             | ''             | ''                                             | '39'            | '39'            | '39'            | '19'            | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              | ''              |
	И закрываю текущее окно без сохранения изменений
		И     Я закрываю окно "№000000155 *"
		Тогда открылось окно "1С:Предприятие"
		И     я нажимаю на кнопку "Да"
#
Сценарий: UC7-1.1. Проверка округления Один заказ фикс. кво увеличение
	####		| 'Объект'                                       | 18.01 | 19.01 | 20.01 | 21.01 |
	# Дано		| '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'        | '39'  | '00'  | '00'  | '00'  |
	# Увеличиваем заказ с 402 480 до 804 960 ([Производительность за час]*24 = 16770*24 = 402480)
	# Результат	| '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'        | '39'  | '39'  | '00'  | '00'  |
	
	Когда открываю тестовый документ №000000159 с тестовой ситуацией
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
		И     в поле "&Что искать" я ввожу текст "000000159"
		И     я меняю значение переключателя "Как искать" на ""
		И     я нажимаю на кнопку "&Найти"
		Тогда открылось окно "План производства"
		И     в ТЧ "Список" я активизирую поле "Период c"
		И     В форме "План производства" в ТЧ "Список" я выбираю текущую строку
		И     я нажимаю на кнопку с именем "ФормаКомандаСформироватьОтчет"
		Тогда открылось окно "№000000159 *"
	И увеличиваю количеество с 402 480 до 804 960 в здании на производство
		И     я перехожу к закладке "Данные"
		И     я перехожу к закладке "Технологические операции"
		И     В форме "№000000159 за период с * по * ПФ Самара: * (План производства)" в таблице "ТехнологическиеОперации" я перехожу к строке:
		| 'Рабочий центр' | '№' | 'ячОбъект'                              | 'Объект'                                | 'Период'     | 'Интервал по'        | 'Количество'  |
		| 'САМ.Husky.1'   | '5' | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С' | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С' | '18.01.2017' | '19.01.2017 7:59:59' | '402 480,000' |
		И     в ТЧ "ТехнологическиеОперации" я активизирую поле "Количество"
		И     В форме "№000000159 за период с * по * ПФ Самара: * (План производства)" в ТЧ "ТехнологическиеОперации" я выбираю текущую строку
		И     в ТЧ "ТехнологическиеОперации" в поле "Количество" я ввожу текст "804 960,000"
	И пресчитываю план производства
		И     я нажимаю на кнопку с именем "ФормаКомандаСформироватьОтчет"
		И     я нажимаю на кнопку "Выделить весь отчет"
		И     я нажимаю на кнопку "К" 
	
	
	#Тогда Показываем ошибочную ситуацию! Убрать после того, как исправим !
		#И     табличный документ формы с именем "Результат" стал равен:
		#| 'Рабочий центр'                      | ''             | ''             | ''                                      | '18.01 Ср 2017' | '19.01 Чт 2017' | '20.01 Пт 2017' | '21.01 Сб 2017' | '22.01 Вс 2017' |
		#| 'Рабочий центр'                      | ''             | ''             | ''                                      | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          |
		#| 'Рабочий центр'                      | ''             | ''             | ''                                      | ''              | ''              | ''              | ''              | ''              |
		#| 'Комплект переналадок'               | 'Приоритет РЦ' | 'Приоритет КП' | 'Объект'                                | ''              | ''              | ''              | ''              | ''              |
		#| 'САМ.Husky.1'                        | ''             | ''             | ''                                      | '38'            | '38'            | '2'             | ''              | ''              |
		#| 'Загрузка линий'                     | ''             | ''             | ''                                      | '23,4'          | '23,4'          | '1,2'           | ''              | ''              |
		#| 'Переналадки'                        | ''             | ''             | ''                                      | ''              | ''              | ''              | ''              | ''              |
		#| '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | '90'           | ''             | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С' | '38'            | '38'            | '2'             | ''              | ''              |
		#| 'Итого'                              | ''             | ''             | ''                                      | '38'            | '38'            | '2'             | ''              | ''              |
	Тогда провееряю, что задание на производство выполняется ровно 2 дня
		И     табличный документ формы с именем "Результат" стал равен:
		| 'Рабочий центр'                      | ''             | ''             | ''                                      | '18.01 Ср 2017' | '19.01 Чт 2017' | '20.01 Пт 2017' | '21.01 Сб 2017' | '22.01 Вс 2017' |
		| 'Рабочий центр'                      | ''             | ''             | ''                                      | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          |
		| 'Рабочий центр'                      | ''             | ''             | ''                                      | ''              | ''              | ''              | ''              | ''              |
		| 'Комплект переналадок'               | 'Приоритет РЦ' | 'Приоритет КП' | 'Объект'                                | ''              | ''              | ''              | ''              | ''              |
		| 'САМ.Husky.1'                        | ''             | ''             | ''                                      | '39'            | '39'            | ''              | ''              | ''              |
		| 'Загрузка линий'                     | ''             | ''             | ''                                      | '24'            | '24'            | ''              | ''              | ''              |
		| 'Переналадки'                        | ''             | ''             | ''                                      | ''              | ''              | ''              | ''              | ''              |
		| '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | '90'           | ''             | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С' | '39'            | '39'            | ''              | ''              | ''              |
		| 'Итого'                              | ''             | ''             | ''                                      | '39'            | '39'            | ''              | ''              | ''              |
	И закрываю текущее окно без сохранения изменений
		И     Я закрываю окно "№000000159 *"
		Тогда открылось окно "1С:Предприятие"
		И     я нажимаю на кнопку "Да"
	
#
Сценарий: UC7-2. Один заказ фикс. кво уменьшение
	####		| 'Объект'                                       | 18.01 | 19.01 | 20.01 | 21.01 |
	# Дано		| '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'        | '39'  | '39'  | '39'  | '39'  |
	# Уменьшили заказ. на 88. Новое кво в заказе = 68 * 10320 = 701 760
	# Результат	| '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'        | '39'  | '29'  | '00'  | '00'  |

	Когда открываю тестовый документ №000000158 с тестовой ситуацией
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
		И     в поле "&Что искать" я ввожу текст "000000158"
		И     я меняю значение переключателя "Как искать" на ""
		И     я нажимаю на кнопку "&Найти"
		Тогда открылось окно "План производства"
		И     в ТЧ "Список" я активизирую поле "Период c"
		И     В форме "План производства" в ТЧ "Список" я выбираю текущую строку
		И     я нажимаю на кнопку с именем "ФормаКомандаСформироватьОтчет"
		Тогда открылось окно "№000000158 *"
	И уменьшаю количеество с 1 609 920 до 701 760 в здании на производство
		И     я перехожу к закладке "Данные"
		И     я перехожу к закладке "Технологические операции"
		И     В форме "№000000158 за период с * по * ПФ Самара: * (План производства)" в таблице "ТехнологическиеОперации" я перехожу к строке:
		| 'Рабочий центр' | '№' | 'ячОбъект'                              | 'Объект'                                | 'Период'     | 'Интервал по'        | 'Количество'    | 'Порядок' | '№ цепи' | 'Интервал с'         | 'Комплект переналадок'               |
		| 'САМ.Husky.1'   | '5' | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С' | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С' | '18.01.2017' | '19.01.2017 7:59:59' | '1 609 920,000' | '1'       | '1'      | '18.01.2017 8:00:00' | '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' |
		И     в ТЧ "ТехнологическиеОперации" я активизирую поле "Количество"
		И     В форме "№000000158 за период с * по * ПФ Самара: * (План производства)" в ТЧ "ТехнологическиеОперации" я выбираю текущую строку
		И     в ТЧ "ТехнологическиеОперации" в поле "Количество" я ввожу текст "701 760,000"
	И пресчитываю план производства
		И     я нажимаю на кнопку с именем "ФормаКомандаСформироватьОтчет"
		И     я нажимаю на кнопку "Выделить весь отчет"
		И     я нажимаю на кнопку "К"
	Тогда провееряю, что изменился график производства увеличился с 4х до 2-х дней
		И     табличный документ формы с именем "Результат" стал равен:
		| 'Рабочий центр'                      | ''             | ''             | ''                                      | '18.01 Ср 2017' | '19.01 Чт 2017' | '20.01 Пт 2017' | '21.01 Сб 2017' | '22.01 Вс 2017' |
		| 'Рабочий центр'                      | ''             | ''             | ''                                      | 'План'          | 'План'          | 'План'          | 'План'          | 'План'          |
		| 'Рабочий центр'                      | ''             | ''             | ''                                      | ''              | ''              | ''              | ''              | ''              |
		| 'Комплект переналадок'               | 'Приоритет РЦ' | 'Приоритет КП' | 'Объект'                                | ''              | ''              | ''              | ''              | ''              |
		| 'САМ.Husky.1'                        | ''             | ''             | ''                                      | '39'            | '29'            | ''              | ''              | ''              |
		| 'Загрузка линий'                     | ''             | ''             | ''                                      | '24'            | '17,8'          | ''              | ''              | ''              |
		| 'Переналадки'                        | ''             | ''             | ''                                      | ''              | ''              | ''              | ''              | ''              |
		| '25.5 Bericap 38mm3 ▪ [60] ▪ 609149' | '90'           | ''             | '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С' | '39'            | '29'            | ''              | ''              | ''              |
		| 'Итого'                              | ''             | ''             | ''                                      | '39'            | '29'            | ''              | ''              | ''              |
	И закрываю текущее окно без сохранения изменений
		И     Я закрываю окно "№000000158 *"
		Тогда открылось окно "1С:Предприятие"
		И     я нажимаю на кнопку "Да"
#
Сценарий: UC7-3. Два заказа фикс. кво увеличениеуменьшение 2-го закза
	####		| 'Объект'                                       | 18.01 | 19.01 | 20.01 | 21.01 |
	# Дано		| '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'        | '39'  | '29'  | '00'  | '00'  |
	#			| '25,5.38MM3.93.БСЦ_000.00.САМ.М10.10320.С2.МБ' | '00'  | '10'  | '39'  | '39'  |
	# Уменьшили второй заказ. на 40. 
	# Результат	| '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'        | '39'  | '29'  | '00'  | '00'  |
	#			| '25,5.38MM3.93.БСЦ_000.00.САМ.М10.10320.С2.МБ' | '00'  | '10'  | '38'  | '00'  |
	Когда открываю тестовый документ №000000159 с тестовой ситуацией
#
Сценарий: UC7-4. Два заказа фикс. кво увеличениеуменьшение 1-го закза
	####		| 'Объект'                                       | 18.01 | 19.01 | 20.01 | 21.01 |
	# Дано		| '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'        | '39'  | '29'  | '00'  | '00'  |
	#			| '25,5.38MM3.93.БСЦ_000.00.САМ.М10.10320.С2.МБ' | '00'  | '10'  | '39'  | '39'  |
	# Уменьшили первый заказ. на 30 коробов
	# Результат	| '25,5.38MM3.93.МБЕЛ_100.60.САМ.10320.С'        | '38'  | '00'  | '00'  | '00'  |
	#			| '25,5.38MM3.93.БСЦ_000.00.САМ.М10.10320.С2.МБ' | '00'  | '39'  | '39'  | '10'  |
	Когда открываю тестовый документ №000000159 с тестовой ситуацией
#