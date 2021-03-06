

&НаКлиенте
Процедура МероприятиеОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
	МероприятиеОбработкаВыбораНаСервере(ВыбранноеЗначение);
КонецПроцедуры

&НаСервере
Процедура МероприятиеОбработкаВыбораНаСервере(Мероприятие)
	Запрос = новый Запрос;
	Запрос.Текст = "Выбрать
	|	Исходы.Ссылка как Исход,
	|	Ложь как Верный
	|из 
	|	Справочник.Исходы как Исходы
	|где
	|	Мероприятие = &Мероприятие";
	Запрос.УстановитьПараметр("Мероприятие", Мероприятие);
	Исход = Запрос.Выполнить().Выбрать();

	Объект.Исходы.Очистить();
	Пока Исход.Следующий() Цикл
		Строка = Объект.Исходы.Добавить();
		ЗаполнитьЗначенияСвойств(Строка, Исход);
	КонецЦикла;

КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	Если ТекущийОбъект.Мероприятие.Завершено
	Тогда
		Отказ = Истина;
		Сообщить("Результаты мероприятия уже записаны");
	КонецЕсли
КонецПроцедуры



