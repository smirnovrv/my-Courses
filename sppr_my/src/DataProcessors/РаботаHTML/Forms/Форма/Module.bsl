#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ВыполнитьКод(Команда)
	ВыполнитьКодНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура Пример1(Команда)
	ВыполнитьПример1НаСервере();
КонецПроцедуры

#КонецОбласти
 
#Область СлужебныеПроцедурыИФункции
 
&НаСервере
Процедура ВыполнитьКодНаСервере()
	Объект.ПолеHTML = Объект.ТекстовоеПоле;
КонецПроцедуры

&НаСервере
Процедура ВыполнитьПример1НаСервере()
	Объект.ТекстовоеПоле = ПолучитьТекстПримера1();
	Объект.ПолеHTML = Объект.ТекстовоеПоле;
КонецПроцедуры

&НаСервере
Функция ПолучитьТекстПримера1()
	ТекстДляПримера = "
	|<!DOCTYPE html>
	|<HTML>
	|<HEAD>
	|
	|<script type=""text/javascript"">
	|if (document.getElementById(element_id)) { 
	|var obj = document.getElementById(element_id); 
	|var parentobj = document.getElementById(parent_id);
	|
	|if (obj.style.display != ""block"") { 
	|obj.style.display = ""block""; //Показываем элемент
	|parentobj.innerHTML = "-";
	|}
	| else {obj.style.display = ""none""; //Скрываем элемент
	|parentobj.innerHTML = "+";}
	|}
	|
	|}
	|</script>
	|
	|<META content=""text/html; charset=utf-8"" http-equiv=Content-Type></META>
	|<meta http-equiv='X-UA-Compatible' content='IE=Edge'>
	|<META name=GENERATOR content=""MSHTML 11.00.9600.17924""></META>
	|</HEAD>
	|
	|<STYLE>
	|BODY, TABLE {
	|FONT-SIZE: 9.5pt;
	|FONT-FAMILY: Helvetica, Geneva, Arial, sans-serif;
	|}
	|
	|.title_header {
	|FONT-SIZE: 9.5pt;
	|FONT-WEIGHT: normal;
	|COLOR: #5D5D5D; 
	|}
	|
	|";
	
	Возврат ТекстДляПримера; 
КонецФункции
	
#КонецОбласти