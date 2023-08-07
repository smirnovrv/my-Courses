#Область ОбработчикиСобытийФормы

&НаКлиенте
Процедура ПриЗакрытии(ЗавершениеРаботы)
	СтруктураПараметров = Новый Структура();
	СтруктураПараметров.Вставить("Комментарий", Комментарий);
	СтруктураПараметров.Вставить("Файл", СсылкаНаФайл);
	ОповеститьОВыборе(СтруктураПараметров);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы
&НаКлиенте
Процедура ДобавитьФайл(Команда)
	ДобавитьФайлы();
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьФайлНовыйВариант(Команда)
	Фильтр = "Все картинки (*.bmp;*.dib;*.rle;*.jpg;*.jpeg;*.tif;*.gif;*.png;*.ico;*.wmf;*.emf)|*.bmp;*.dib;*.rle;*.jpg;*.jpeg;*.tif;*.gif;*.png;*.ico;*.wmf;*.emf|" 
	+ "Формат bmp (*.bmp;*.dib;*.rle)|*.bmp;*.dib;*.rle|"
	+ "Формат JPEG (*.jpg;*.jpeg)|*.jpg;*.jpeg|"
	+ "Формат TIFF (*.tif)|*.tif|"
	+ "Формат GIF (*.gif)|*.gif|"
	+ "Формат PNG (*.png)|*.png|"
	+ "Формат icon (*.ico)|*.ico|"
	+ "Формат метафайл (*.wmf;*.emf)|*.wmf;*.emf|";
	
	Диалог = новый ПараметрыДиалогаПомещенияФайлов("Выберите файл картинки", Ложь, Фильтр);
		
	Оповещение = новый ОписаниеОповещения("ПослеЗакрытияДиалогаВыбора", ЭтотОбъект);
	
	НачатьПомещениеФайлаНаСервер(Оповещение,,,, Диалог, УникальныйИдентификатор);
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ПослеЗакрытияДиалогаВыбора (ОписаниеФайла, ДопПараметры) Экспорт
	
	Если ОписаниеФайла.ПомещениеФайлаОтменено ТОгда
		Возврат;
	КОнецЕсли;
	
	СсылкаНаОбъект = ВладелецФормы.Объект.Ссылка; 
	СохранитьФайлВХранилище(ОписаниеФайла.Адрес, СсылкаНаОбъект, ОписаниеФайла.СсылкаНаФайл.Файл.ИмяБезРасширения);	
	
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьФайлы()
	
	УИД = Новый УникальныйИдентификатор();
	Оповещение  =  Новый ОписаниеОповещения("ОбработатьВыборФайла",   ЭтотОбъект);
	НачатьПомещениеФайла(Оповещение,   ,   ,   Истина,   УИД);
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработатьВыборФайла(Результат, Адрес, ВыбранноеИмяФайла, ДополнительныеПараметры) Экспорт
	
	Если Не Результат Тогда
		Возврат; 
	КонецЕсли;
	
	ОписаниеФайла = Новый Файл(ВыбранноеИмяФайла);
	
	СсылкаНаОбъект = ВладелецФормы.Объект.Ссылка; 
	СохранитьФайлВХранилище(Адрес, СсылкаНаОбъект, ОписаниеФайла.ИмяБезРасширения);	
 	
КонецПроцедуры

&НаСервере
Процедура СохранитьФайлВХранилище(Адрес, Владелец, Имя)

	НовФайл = Справочники.ЗанятияКурсаФайлы.СоздатьЭлемент();
	НовФайл.ВладелецФайла 		= Владелец;
	НовФайл.Наименование 		= Имя;
	НовФайл.ДанныеТекущаяДата 	= ТекущаяДатаСеанса();
	НовФайл.ФайлХранилище 		= Новый ХранилищеЗначения(ПолучитьИзВременногоХранилища(Адрес));
	НовФайл.Записать();
	
	СсылкаНаФайл = НовФайл.Ссылка;
	
КонецПроцедуры 

#КонецОбласти
