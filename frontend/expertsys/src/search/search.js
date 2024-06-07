
import { useState, useEffect } from 'react';
import Form from 'react-bootstrap/Form';
import './search.css';
import Sicons from './Sicons.png';

export function GetSearch({inHead}) {

if(inHead)
  return   (  
  <div id="SearchBlock" style={{width: 560+'px', marginTop: 31+'px', marginLeft: 10+'px'}}>
    <div id="SearchName"></div>
	<div id="SearchString" style={{width: 554+'px'}}>
	  <div id="lupa"><img src={Sicons} alt="" height="30" /> </div>
	  <div id="SearchInputDiv" style={{width: 500+'px'}}><input id="searchInput" placeholder="Поиск лабораторные, лекции, ошибки..." /></div>
	</div>
  </div>);

  return   (  
  <div id="SearchBlock">
    <div id="SearchName"></div>
	<div id="SearchString">
	  <div id="lupa"><img src={Sicons} alt="" height="30" /> </div>
	  <div id="SearchInputDiv"><input id="searchInput" placeholder="Поиск лабораторные, лекции, ошибки..." /></div>
	</div>
	<div id="SearchPop">
	  <div id="PopName"></div>
	  <div id="PopBlock"></div>
	  <div id="PopBlock"></div>
	  <div id="PopBlock"></div>
	</div>
  </div>);
}
 