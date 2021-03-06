&НаКлиенте
Процедура СпособСнятияОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
	Если ВыбранноеЗначение = ПредопределенноеЗначение("Перечисление.СпособСнятия.Карта")
	Тогда
		Элементы.НомерТелефона.Видимость = Ложь;
		Элементы.НомерКарты.Видимость = Истина;
	Иначе
		Элементы.НомерТелефона.Видимость = Истина;
		Элементы.НомерКарты.Видимость = Ложь;
	КонецЕсли	
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	Если ТекущийОбъект.СпособСнятия = ПредопределенноеЗначение("Перечисление.СпособСнятия.Карта")
	Тогда
		ТекущийОбъект.НомерТелефона = Неопределено;
	Иначе
		ТекущийОбъект.НомерКарты = Неопределено;
	КонецЕсли
КонецПроцедуры


&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Если ЭтаФорма.Объект.СпособСнятия = ПредопределенноеЗначение("Перечисление.СпособСнятия.Карта")
	Тогда
		Элементы.НомерТелефона.Видимость = Ложь;
		Элементы.НомерКарты.Видимость = Истина;
	Иначе
		Если не ЭтаФорма.Объект.СпособСнятия.Пустая()
		Тогда
			Элементы.НомерТелефона.Видимость = Истина;
			Элементы.НомерКарты.Видимость = Ложь;
		КонецЕсли
	КонецЕсли
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если (ПользователиИнформационнойБазы.ТекущийПользователь().Роли.Содержит(Метаданные.Роли.Игрок))
	Тогда
		Объект.Игрок = ПараметрыСеанса.Игрок;
	КонецЕсли;
КонецПроцедуры


&НаКлиенте
Процедура ИгрокНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	ИгрокНачалоВыбораНаСервере(ДанныеВыбора, СтандартнаяОбработка);
КонецПроцедуры

&НаСервере
Процедура ИгрокНачалоВыбораНаСервере(ДанныеВыбора, СтандартнаяОбработка)
	Если (ПользователиИнформационнойБазы.ТекущийПользователь().Роли.Содержит(Метаданные.Роли.Игрок))
	Тогда
		ДанныеВыбора = Новый СписокЗначений();
		ДанныеВыбора.Добавить(ПараметрыСеанса.Игрок);
		СтандартнаяОбработка = Ложь;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	Если Элементы.НомерКарты.Видимость
	И СтрДлина(Элементы.НомерКарты.ТекстРедактирования) < 16 Тогда
		Отказ = Истина;
		Сообщить("Поле Номер Карты заполнено неверно или пустое");
	Иначе
		Если Элементы.НомерТелефона.Видимость 
		И (СтрДлина(Элементы.НомерТелефона.ТекстРедактирования) < 11
		ИЛИ Найти(Элементы.НомерТелефона.ТекстРедактирования, "89") <> 1) Тогда
			Отказ = Истина;
			Сообщить("Поле Номер Телефона заполнено неверно или пустое");
		КонецЕсли;
	КонецЕсли
КонецПроцедуры





