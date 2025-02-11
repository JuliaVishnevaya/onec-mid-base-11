
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
	// {{ ДЗ2_ДоработкаТиповыхКонфигураций
	//ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество;
	
	ТекущиеДанные.Сумма = (ТекущиеДанные.Цена * ТекущиеДанные.Количество) * (1 - Объект.ДорабКЛ_СогласованнаяСкидка/100);
 
	// ДЗ2_ДоработкаТиповыхКонфигураций }} 
	
	РассчитатьСуммуДокумента()
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()

	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

&НаКлиенте
Процедура ДорабКЛ_Пересчитать(Команда)
	// {{ ДЗ2_ДоработкаТиповыхКонфигураций
		ДорабКЛ_ПересчетСуммы();  
	// ДЗ2_ДоработкаТиповыхКонфигураций }}
КонецПроцедуры

&НаКлиенте
Процедура ДорабКЛ_ПересчетСуммы()
	// {{ ДЗ2_ДоработкаТиповыхКонфигураций
	
	Для Каждого ТекущиеДанныеТовары Из Объект.Товары Цикл
			РассчитатьСуммуСтроки(ТекущиеДанныеТовары);
	КонецЦикла;	
	Для Каждого ТекущиеДанныеУслуги Из Объект.Услуги Цикл
			РассчитатьСуммуСтроки(ТекущиеДанныеУслуги);
	КонецЦикла;
    // ДЗ2_ДоработкаТиповыхКонфигураций }}
КонецПроцедуры  

&НаКлиенте
Процедура ДорабКЛ_СогласованнаяСкидкаПриИзменении(Элемент)
	// {{ ДЗ2_ДоработкаТиповыхКонфигураций
	Если Объект.Товары.Количество() <> 0 ИЛИ Объект.Услуги.Количество() <> 0 Тогда
		ЗадатьВопросОПересчетеСуммы();
	КонецЕсли;
	// ДЗ2_ДоработкаТиповыхКонфигураций }}

КонецПроцедуры 

&НаКлиенте
Асинх Процедура ЗадатьВопросОПересчетеСуммы()
	// {{ ДЗ2_ДоработкаТиповыхКонфигураций

    Режим = РежимДиалогаВопрос.ДаНет;
    Ответ = Ждать ВопросАсинх("Пересчитать сумму согласно указанной скидки?", Режим, 0);
    Если Ответ = КодВозвратаДиалога.Нет Тогда
        Возврат;
	Иначе
		ДорабКЛ_ПересчетСуммы();
	КонецЕсли; 
	 // ДЗ2_ДоработкаТиповыхКонфигураций }}

КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
