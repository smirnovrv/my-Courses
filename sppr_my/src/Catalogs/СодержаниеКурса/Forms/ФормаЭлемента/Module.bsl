
&НаКлиенте
Процедура ДобавитьСтрокуКомментария(Команда)
	ОткрытьФорму("Справочник.СодержаниеКурса.Форма.ФормаДобавленияСтроки",,ЭтотОбъект);
КонецПроцедуры

&НаКлиенте
Процедура КомментарииИФайлыПриОкончанииРедактирования(Элемент, НоваяСтрока, ОтменаРедактирования)
	СформироватьHTML();
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	СформироватьHTML();
	
КонецПроцедуры

&НаСервере
Процедура СформироватьHTML()
	сНаименование = "№"+Объект.Код+" "+Объект.Наименование;
	
	сНаименование = ОбщийМодульНаСервере.ПолучитьТекстДляВставкиHTML(сНаименование);
	
	Структура  = Новый Структура("Наименование", сНаименование);
	
	ТекстHTML = ОбщийМодульНаСервере.СформироватьHTML(Структура);
	
	сТело2 = "";
	
	Для Каждого строкаКоментария из Объект.КомментарииИФайлы Цикл 
		Если ЗначениеЗаполнено(строкаКоментария.Комментарий) Тогда
			сТело2=сТело2 + "<p>";
			сТело2=сТело2 + ОбщийМодульНаСервере.ПолучитьТекстHTMLДляСворачиваемогоТекста("", строкаКоментария.Комментарий);
			сТело2=сТело2 + "</p>";
		КонецЕсли;
	
		Если ЗначениеЗаполнено(строкаКоментария.СсылкаНаФайл) Тогда
			ТекКартинка = ПолучитьНавигационнуюСсылку(строкаКоментария.СсылкаНаФайл, "ФайлХранилище");
			Если ЗначениеЗаполнено(строкаКоментария.Комментарий) Тогда	
				сТело2=сТело2+"<img src="+ТекКартинка+">";	
			Иначе
				сТело2=сТело2+"<p></p>"+"<img src="+ТекКартинка+">";	
			КонецЕсли;	
		КонецЕсли;		
	КонецЦикла;	
	
	ТекстHTML = ТекстHTML+сТело2;
КонецПроцедуры

&НаКлиенте
Процедура КомментарииИФайлыВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	Если Не Поле.Имя = "КомментарииИФайлыСсылкаНаФайл" Тогда
		СтрутураПараметров = Новый Структура;
		текСтрока = Элементы.КомментарииИФайлы.ТекущиеДанные;
		СтрутураПараметров.Вставить("Комментарий", текСтрока.Комментарий);
		ОткрытьФорму("Справочник.СодержаниеКурса.Форма.ФормаКомментария", СтрутураПараметров);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьФайлы()
	Если ЗначениеЗаполнено(Объект.Ссылка) Тогда
		УИД = Новый УникальныйИдентификатор();
		Оповещение  =  Новый ОписаниеОповещения("ОбработатьВыборФайла",   ЭтотОбъект);
		НачатьПомещениеФайла(Оповещение,   ,   ,   Истина,   УИД);
		//НачатьПомещениеФайлаНаСервер(Оповещение,,,,,УИД);
	Иначе 
		Оповещение = Новый ОписаниеОповещения("ОтветНаВопросЗаписать", ЭтотОбъект);
		ТекстВопроса = "Элемент не записан, Записать?";                            
		ПоказатьВопрос(Оповещение, ТекстВопроса, РежимДиалогаВопрос.ДаНет);	
 	КонецЕсли;	
КонецПроцедуры

&НаКлиенте 
Процедура ОтветНаВопросЗаписать(Результат, ДополнительныеПараметры) Экспорт 
	Если Результат = КодВозвратаДиалога.Да Тогда
		 ЭтотОбъект.Записать();
		 ДобавитьФайлы();
	КонецЕсли;
КонецПроцедуры 

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	Если ИмяСобытия = "ТекущийКомментарий" Тогда
		Если ЗначениеЗаполнено(Параметр) Тогда
			текСтрока = Элементы.КомментарииИФайлы.ТекущиеДанные;
			текСтрока.Комментарий = ПолучитьЗапасыИзХранилища(Параметр);
			Модифицированность = Истина;
		КонецЕсли;
	ИначеЕсли ИмяСобытия = "ДобавитьСтрокуКомментарииИФайлы" Тогда
		Если ЗначениеЗаполнено(Параметр.Комментарий) Или ЗначениеЗаполнено(Параметр.СсылкаФайл) Тогда
			ТекущаяСтрока = Объект.КомментарииИФайлы.Добавить();
			ТекущаяСтрока.Комментарий = Параметр.Комментарий;
			ТекущаяСтрока.СсылкаНаФайл = Параметр.СсылкаФайл;
			Модифицированность = Истина;
		КонецЕсли;
	КонецЕсли;	
КонецПроцедуры

&НаСервере 
Функция  ПолучитьЗапасыИзХранилища(АдресВХранилище)
        Комментарий =ПолучитьИзВременногоХранилища(АдресВХранилище);		
		Возврат Комментарий;
КонецФункции

&НаКлиенте
Процедура ОбработатьВыборФайла(Результат, Адрес, ВыбранноеИмяФайла, ДополнительныеПараметры) Экспорт
	Если Не Результат Тогда
		Возврат; 
	КонецЕсли;
	
	//Получим данные файла
	ОписаниеФайла = Новый Файл(ВыбранноеИмяФайла);

	//Сохраним в справочник ХранилищеФайлов
	СохранитьФайлВХранилище(Адрес,Объект.Ссылка,ОписаниеФайла.ИмяБезРасширения, Элементы.КомментарииИФайлы.ТекущаяСтрока);
	
	//обновим список файлы	 
	Элементы.КомментарииИФайлы.Обновить();
	
	ЭтаФорма.Прочитать();
	
КонецПроцедуры

&НаСервере
Процедура СохранитьФайлВХранилище(Адрес,Владелец,Имя,номСтрокиТЧ)
	НовФайл = Справочники.СодержаниеКурсаФайлы.СоздатьЭлемент();
	НовФайл.ВладелецФайла 	= Владелец;
	НовФайл.Наименование 	= Имя;
	НовФайл.ДанныеТекущаяДата = ТекущаяДата();
	НовФайл.ФайлХранилище = Новый ХранилищеЗначения(ПолучитьИзВременногоХранилища(Адрес));
	НовФайл.Записать();
КонецПроцедуры 

&НаКлиенте
Процедура ДобавитьФайл(Команда)
	ДобавитьФайлы();
КонецПроцедуры
