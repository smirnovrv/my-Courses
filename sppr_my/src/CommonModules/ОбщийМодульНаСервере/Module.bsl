
Функция СформироватьHTML(Структура) Экспорт
	
	сЗаголовок1	= "
	|<!DOCTYPE html>
	|<HTML>
	|<HEAD>
	|
	|<script type=""text/javascript"">
	|
	|function showHide(element_id, parent_id) {
	|	
	|
	|	if (document.getElementById(element_id)) { 
	|           var obj = document.getElementById(element_id); 
	|	var parentobj = document.getElementById(parent_id);
	|	   
	| 
	|            if (obj.style.display != ""block"") { 
	|              obj.style.display = ""block""; //Показываем элемент
	|	     parentobj.innerHTML = ""-"";
	|              }
	|              else {obj.style.display = ""none""; //Скрываем элемент
	|		parentobj.innerHTML = ""+"";}
	|              }
	|         
	|         }   
	|</script>
	|
	|<META content=""text/html; charset=utf-8"" http-equiv=Content-Type></META>
	|<meta http-equiv='X-UA-Compatible' content='IE=Edge'>
	|<META name=GENERATOR content=""MSHTML 11.00.9600.17924""></META>
	|</HEAD>
	|"; 
	
	сШапка ="
	|<TABLE width=""100%"">
	|<TBODY>";
	
	сШапка	= сШапка + "
	|	<TR>
	|		<TD class=""title"" width=""50%""> 
	|			<span class=""title_text"">"+Структура.Наименование+"</span>
	|		</TD>  
	|       <TD class=""title"">
	|		</TD>  
	|	</TR>
	|";
	
	сШапка	= сШапка + "
	|</TBODY>
	|</TABLE>"; 
	
	сСтили		= ПолучитьСтилиCSSМеню();
	
	//СтрТекстHTMLЗадачи = сЗаголовок1+сСтили+сШапка+сТело2; 
	ТекстHTML = сЗаголовок1+сСтили+сШапка; 
	
	Возврат ТекстHTML;
	
КонецФункции

Функция ПолучитьСтилиCSSМеню()
	
	//ДвоичныеДанныеКартинки = БиблиотекаКартинок.CRM_Минус.ПолучитьДвоичныеДанные();
	//Base64ДанныеКартинки = Base64Строка(ДвоичныеДанныеКартинки);
	//КартинкаМинус = "data:image/" + БиблиотекаКартинок.CRM_Минус.Формат() + ";base64," + Base64ДанныеКартинки;
	//
	//ДвоичныеДанныеКартинки = БиблиотекаКартинок.CRM_Плюс.ПолучитьДвоичныеДанные();
	//Base64ДанныеКартинки = Base64Строка(ДвоичныеДанныеКартинки);
	//КартинкаПлюс = "data:image/" + БиблиотекаКартинок.CRM_Плюс.Формат() + ";base64," + Base64ДанныеКартинки;
	
	сСтили		= "
	|<STYLE>
	|BODY, TABLE {
	|	FONT-SIZE: 9.5pt; 
	|	FONT-FAMILY: Helvetica, Geneva, Arial, sans-serif;
	|}
	|a:link {
	|	COLOR: #3366FF;
	|	text-decoration: none;
	|}
	|a:visited {
	|	COLOR: #3366FF;
	|	text-decoration: none;
	|}
	|td.title {
	|	vertical-align: top;
	|}
	|.title_header {
	|	FONT-SIZE: 9.5pt; 
	|	FONT-WEIGHT: normal; 
	|	COLOR: #5D5D5D;
	|}
	|.title_header_1 {
	|	FONT-SIZE: 9.5pt; 
	|	FONT-WEIGHT: bolder; 
	|	COLOR: #5D5D5D;
	|}
	|.title_text {
	|	FONT-SIZE: 9.5pt; 
	|	FONT-WEIGHT: bolder; 
	|	COLOR: #000000; 
	|}
	|td.title_theme {
	|	PADDING-TOP: 5px;
	|	PADDING-BOTTOM: 5px; 
	|	PADDING-LEFT: 0px; 
	|	PADDING-RIGHT: 0px;
	|	BORDER-TOP: #c9c9c9 1px solid;
	|	BORDER-BOTTOM: #c9c9c9 1px solid;
	|}	
	|td.title_theme_alert {
	|	PADDING-TOP: 3px;
	|	PADDING-BOTTOM: 0px; 
	|	PADDING-LEFT: 15px; 
	|	PADDING-RIGHT: 0px;
	|	BORDER-TOP: #c9c9c9 1px solid;
	|	BORDER-BOTTOM: #c9c9c9 1px solid;
	|}	
	|span.title_theme_txt_1 {
	|	FONT-SIZE: 11pt; 
	|	FONT-WEIGHT: bolder; 
	|	COLOR: #000000; 
	|}	
	|span.title_theme_txt_2 {
	|	FONT-SIZE: 9.5pt; 
	|	FONT-WEIGHT: normal; 
	|	COLOR: #5D5D5D; 
	|}	
	|a.title_theme_txt_2:link, a.title_theme_txt_2:visited {
	|	FONT-SIZE: 9.5pt; 
	|	FONT-WEIGHT: normal; 
	|	COLOR: #3366FF; 
	|}	
	|.file_list {
	|	margin-left: 15px;}	
	|td.icon {
	|	PADDING-TOP: 7px; 
	|	PADDING-BOTTOM: 7px; 
	|	PADDING-LEFT: 0px; 
	|	PADDING-RIGHT: 15px
	|}
	|td.menu_header {
	|	PADDING-TOP: 0px; 
	|	PADDING-BOTTOM: 0px; 
	|	PADDING-LEFT: 0px; 
	|	PADDING-RIGHT: 15px;
	|	BORDER-TOP: #c9c9c9 1px solid;
	|}
	|td.menu_header_last {
	|	PADDING-TOP: 0px; 
	|	PADDING-BOTTOM: 0px; 
	|	PADDING-LEFT: 0px; 
	|	PADDING-RIGHT: 15px;
	|	BORDER-TOP: #c9c9c9 1px solid;
	|	BORDER-BOTTOM: #c9c9c9 1px solid;
	|}
	|td.menu_text {
	|	PADDING-TOP: 0px; 
	|	PADDING-BOTTOM: 5px; 
	|	PADDING-LEFT: 0px; 
	|	PADDING-RIGHT: 15px;
	|}
	|span.menu_header_txt_1 {
	|	FONT-SIZE: 10pt; 
	|	FONT-WEIGHT: bolder; 
	|	COLOR: #000000; 
	|}
	|span.menu_header_txt_2 {
	|	FONT-SIZE: 9pt; 
	|	FONT-WEIGHT: normal; 
	|	COLOR: #5D5D5D;
	|}
	|a.menu_header_txt_1, a.menu_header_txt_1:visited {
	|	COLOR: #000000;
	|}	
	|a.menu_header_txt_2, a.menu_header_txt_2:visited {
	|	COLOR: #5D5D5D;
	|}

	|td.file_list {
	|	PADDING-TOP: 0px; 
	|	PADDING-BOTTOM: 5px; 
	|	PADDING-LEFT: 0px; 
	|	PADDING-RIGHT: 15px;
	|}
	|</STYLE>
	|
	|<STYLE type=text/css>
	|
	|.CommentContainer {
	|	padding: 0;
	|	margin: 0;
	|}
	|
	|.CommentContainer li {
	|	list-style-type: none;
	|}
	|
	|.Node {
	|	background-image : url('');
	|	background-position : top left;
	|	background-repeat : repeat-y;
	|	zoom: 1;
	|}
	|
	|.IsRoot {
	|	margin-left: 0;
	|}
	|.ExpandOpen .Expand {
	//|	background-image: url('"+КартинкаМинус+"');
	|}
	|
	|.ExpandClosed .Expand {
	//|	background-image: url('"+КартинкаПлюс+"');
	|	background-repeat : no-repeat;
	|}
	|
	|.ExpandLeaf .Expand {
	|	background-image: url('');
	|}
	|
	|.Content {
	|min-height: 18px;
	//|margin-left:18px;
	|}
	|
	|* html .Content {
	|height: 18px;
	|}
	|
	|.Expand {
	|	width: 18px;
	|	height: 18px;
	|	float: left;
	//|	FONT-SIZE: 9.5pt;
	|	FONT-SIZE: 10.5pt;
	|	FONT-WEIGHT: bolder; 
	|}
	|
	|.ExpandOpen .CommentContainer {
	|   display: block;
	|}
	|
	|.ExpandClosed .CommentContainer {
	|   display: none;
	|}
	|
	|.ExpandOpen .Expand, .ExpandClosed .Expand {
	|   cursor: pointer;
	|}
	|
	|.ExpandLeaf .Expand {
	|	cursor: auto;
	|}
	|
	|</STYLE>";
	
	Возврат сСтили;

КонецФункции

	Функция ПолучитьТекстHTMLДляСворачиваемогоТекста(ТекстЗаголовка, Текст, Свернута = Ложь, Вложенный = Ложь, ЕстьОтступ = Ложь) Экспорт
	
	idName = Строка(Новый УникальныйИдентификатор());
	
	Если Вложенный Тогда
		СворачиваемыйТест = "
		|"+ ?(Свернута, "<LI class=""Node ExpandClosed"""+?(ЕстьОтступ,"style=""padding-left: 15px;""","")+">", "<LI class=""Node ExpandOpen"""+?(ЕстьОтступ,"style=""padding-left: 15px;""","")+">") + "
		|	<DIV onclick=""showHide('"+idName+"_sv', '"+idName+"')"" id="+idName+" class=Expand>"+?(Свернута,"+","-")+"</DIV>
		|	<DIV class=Content>
		//|		<P>
		|			<span class=""title_header_1"">
		|				"+ ТекстЗаголовка +"
		|			</span>
		//|		</P>
		|	</DIV>
		|	<UL class=CommentContainer id="+idName+"_sv style='display:"+ ?(Свернута,"none","block")+";'>
		|		<LI class=""Node ExpandLeaf IsLast"">
		|			<DIV class=Expand>
		|			</DIV>
		|			<DIV class=Content>
		|				"+ Текст +"
		|			</DIV>
		|		</LI>
		|	</UL>
		|</LI>";
	Иначе
		СворачиваемыйТест = "
		|<DIV  class=Content style='border: 1px solid black;'>
		|	<UL class=CommentContainer>
		|		"+ ?(Свернута, "<LI class=""Node ExpandClosed"""+?(ЕстьОтступ,"style=""padding-left: 15px;""","")+">", "<LI class=""Node ExpandOpen"""+?(ЕстьОтступ,"style=""padding-left: 15px;""","")+">") + "
		|			<DIV onclick=""showHide('"+idName+"_sv', '"+idName+"')"" id="+idName+" class=Expand>"+?(Свернута,"+","-")+"</DIV>
		|			<DIV class=Content>
		//|				<P>
		|					<span class=""title_header_1"">
		|						"+ ТекстЗаголовка +"
		|					</span>
		//|				</P>
		|			</DIV>
		|			<UL class=CommentContainer id="+idName+"_sv style='display:"+ ?(Свернута,"none","block")+";'>
		|				<LI class=""Node ExpandLeaf IsLast"">
		|					<DIV class=Expand>
		|					</DIV>
		|					<DIV class=Content>
		|						"+ Текст +"
		|					</DIV>
		|				</LI>
		|			</UL>
		|		</LI>
		|	</UL>
		|</DIV>";
	КонецЕсли;
	
	Возврат СворачиваемыйТест;
	
КонецФункции
