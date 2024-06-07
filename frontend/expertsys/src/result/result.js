// frontend/src/App.js
import { useState, useEffect } from 'react';
import Form from 'react-bootstrap/Form';
import Search from 'App.js';
import './result.css';
import logoG from './logoGoogle.png';
import logoY from './LogoYandex.png';
import PDF from './PDF_file_icon.svg.png';


export function GetResult() {

  const [BlockNum, setBlockNum] = useState('');
  const [BlockText, setBlockText] = useState('');
	 
  function handleChangeNamesetBlockNum(event) {
     setBlockNum(event.target.value);
  }
  function handleChangesetBlockText(event) {
     setBlockText(event.target.value);
  }
  

  let sqlq = {query: "SELECT * from Значения_связи, Связи_ПП, Переменные_предикаты ПП, Правила, Доп_данные where Правила.ID_Связи = Связи_ПП.ID_Связи and Значения_связи.ID_Связи = Связи_ПП.ID_Связи and ПП.ID_ПП = Значения_связи.ID_ПП and ПП.Наименование like "+Search+" and Доп_данные.ID_Связи = Связи_ПП.ID_Связи "};
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
    <div id="ResultData">
	<div id="ResultBlock">
	  <div class="ResultBlockNum">{BlockNum}</div>
      <div class="ResultBlockText">{BlockText}<alt="" height="400" />  </div>
	</div>
	<div id="ResultInSearch">
	  <div id="ResultInSearchText">Вы также можете ознакомится с результатами в сети Интернет:</div>
	  <div id="ResultYandex">
	     <img src={logoY}  alt="" height="30" /> 
	  </div>
	  <div id="ResultGoogle">
	     <img src={logoG}  alt="" height="30" /> 
	  </div>
	</div>
  </div>);
}
