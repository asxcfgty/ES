// frontend/src/App.js
import { useState, useEffect } from 'react';
import Form from 'react-bootstrap/Form';
import './panelPP.css';
import iconAdd from './iconAdd.png';
import iconSave from './iconSave.png';

export function GetKnowPanel() {

  const [namePP, setNamePP] = useState('');
  const [defPP, setDefPP] = useState('');
	 
  function handleChangeNamePP(event) {
     setNamePP(event.target.value);
  }
  function handleChangeDefPP(event) {
     setDefPP(event.target.value);
  }
  
  function  AddRule(e) {
	  
  let sqlq = {query: "EXECUTE  [dbo].[AddPP] '" + namePP + "', '" + defPP + "', '" + " " + "' ; "};
	fetch(  'http://localhost/makeSQLQG'
			, { method: 'POST',
			    mode: "cors",
			    credentials: "include",
			    headers: {'Content-Type': 'application/json'},
				body: JSON.stringify(sqlq)
		      }).then()
			    ;
  }

  return   (  
  <div id="PanelBlock"> 
    <div style={{display: "block"}} >
      <div id="TopLeftBlock">
	    <div id="NamePP">
		  <div id="NamePPText">Наименование</div>
		  <div id="NamePPData"><input id="NamePPInput" placeholder="Определение, тема, объект исследования..." value={namePP} onChange={handleChangeNamePP}/></div>
		</div>
		<div style={{display: "flex"}}>
          <div id="Subjects">
		    <div id="SubjectsText">Дисциплина</div>
		    <div id="SubjectsData"><input id="SubjectsInput" placeholder="Наименование дисциплины..."  /></div>
		  </div>
	      <div id="Val">
		    <div id="ValText">Приоритет</div>
		    <div id="ValData"><input id="ValInput" placeholder="% от 1 до 100" value="auto" /></div>
		  </div>
		</div>
	  </div>
	  <div id="DiagramRule">
	    <div id="DiagramText">Диаграмма вывода</div>
	  </div>
	  <div style={{display: "flex"}} >
	    <div class="ButtonBlock" id="LinkAdd"><div class="ButtonIcon"><img src={iconAdd} alt="" height="45" /></div><div class="ButtonText" id="LinkAddText">Связь</div></div>
		<div class="ButtonBlock" id="RuleAdd"><div class="ButtonIcon"><img src={iconAdd} alt="" height="45" /></div><div class="ButtonText" id="RuleAddText">Правило</div></div>
		<div class="ButtonBlock" id="SavePP" onClick={AddRule} ><div class="ButtonIcon"><img src={iconSave} alt="" height="45" /></div><div class="ButtonText" id="SavePPText">Сохранить</div></div>
	  </div>
	</div>
	<div style={{display: "block"}} >
	  <div id="DataPP">
		<div id="DataPPText">Описание</div>
		<div id="DataPPData"><textarea id="DataPPTextarea" placeholder="Текст, ссылки, файлы..." value={defPP} onChange={handleChangeDefPP}></textarea></div>
	  </div>
	  <div id="DataSum">
	    <div id="DataSumText">Вывод</div>
		<div id="DataSumData"><textarea id="DataSumTextarea" placeholder="Сформированный вывод системы..."></textarea></div>
	  </div>
	</div>
  </div>
  );
}
