
import { useState, useEffect } from 'react';
import Form from 'react-bootstrap/Form';
import './log.css';

export let SessID = '';


export function Logining() {
  const [user, setUser] = useState('');
  const [pass, setPass] = useState('');
	 
  function handleChangeU(event) {
     setUser(event.target.value);
  }
  function handleChangeP(event) {
     setPass(event.target.value);
  }
  
  function  activateLasers(e) {
  let sqlq = {query: "begin " +
			" declare @i int; " +
			" DECLARE @IdentityUser numeric; " +
			"exec @i = [LoginUser] '"+user+"','"+pass+"'; " +
			"if @i = 0 " +
            "begin " +
			"  select @IdentityUser = ISNULL(ID,-1) from [dbo].[Пользователи] where [Login] = 'User'; " +
			"  SELECT [ReqID] from [Session] where [LogDate] = (select max([LogDate]) from [Session] where [ID_User] = @IdentityUser) and [ID_User] = @IdentityUser; " +
			"end; " +
			"else " +
            "  select 'ERROR' as ReqID; " +
			"end; "};
	fetch(  'http://localhost/makeSQLQG'
			, { method: 'POST',
			    mode: "cors",
			    credentials: "include",
			    headers: {'Content-Type': 'application/json'},
				body: JSON.stringify(sqlq)
		      }).then((res) => res.json())
			    .then((result) => SessID = result.recordset[0].ReqID);
  }
  
  function qweasd () {
	  alert(SessID);
  }

  return   (<div id="LogContent" class="BackgroundLog">
   <div id="LogHead">
    <picture id="cRFIcon">
      <img src="https://apprin.sgugit.ru/resources/images/all/logo.jpg" alt="" height="66" />
    </picture>
	<div>
      <div id="cRFLabel" onClick={qweasd}>
        <span class="smallText">СИБИРСКИЙ ГОСУДАРСТВЕННЫЙ<br/>УНИВЕРСИТЕТ ГЕОСИСТЕМ И ТЕХНОЛОГИЙ</span>
      </div>
	</div>
   </div>
   <div id="LogData">
    <div><input id="cRFPassword" type="password" placeholder="Логин" value={user} onChange={handleChangeU}/></div>
    <div><input id="cRFPassword" type="password" placeholder="Пароль" value={pass} onChange={handleChangeP}/></div>
    <div id="cRFEnter" class="blBackground btn" onClick={activateLasers}>
      <span>Войти</span>
     </div>
   </div>
  </div>);
}
 