// frontend/src/App.js
import { useState, useEffect } from 'react';
import Form from 'react-bootstrap/Form';
import './head.css';
import logo from './logo.png';
import {GetSearch} from '../search/search.js';

export function GetHead({withSearch}) {

if(withSearch)
  return   (  
  <div id="HeadLine">
    <div id="HeadData">
      <div id="LogoData">
	    <img src={logo} alt="" height="120" /> 
	  </div>
	  <GetSearch inHead={true}/>
	  <div id='DocText' style={{marginLeft: 131+'px'}}>Документация </div>
	  <div id='EnterButton'>Вход</div>
	</div>
  </div>);

  return   (  
  <div id="HeadLine">
    <div id="HeadData">
      <div id="LogoData">
	    <img src={logo} alt="" height="120" /> 
	    <div>ЭС СГУГиТ</div>
	  </div>
	  <div id='DocText'>Документация </div>
	  <div id='EnterButton'>Вход</div>
	</div>
  </div>);
}
 