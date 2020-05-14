Процедура ОбработкаПроведения(Отказ, Режим)
	Депозит = РегистрыНакопления.Депозиты.Остатки().Итог("Сумма");
	Если Депозит < Сумма
	Тогда
		Отказ = Истина;
		Сообщить("Недостаточно средств в депозите: " + Депозит)
	Иначе
		Движения.Депозиты.Записывать = Истина;
		Движение = Движения.Депозиты.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Игрок = Игрок;
		Движение.Сумма = Сумма;
	КонецЕсли;
КонецПроцедуры