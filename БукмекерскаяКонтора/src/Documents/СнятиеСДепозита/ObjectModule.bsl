Процедура ОбработкаПроведения(Отказ, Режим)

	Движения.Депозиты.Записывать = Истина;
	Движение = Движения.Депозиты.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
	Движение.Период = Дата;
	Движение.Игрок = Игрок;
	Движение.Сумма = СуммаСнятия;
КонецПроцедуры