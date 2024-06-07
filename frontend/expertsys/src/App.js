
import { useState, useEffect } from 'react';
import Form from 'react-bootstrap/Form';
import './App.css';
import {Logining} from './login/Log.js';
import {SessID} from './login/Log.js';
import {GetHead} from './head/head.js';
import {GetSearch} from './search/search.js';
import {GetResult} from './result/result.js';
import {GetKnowPanel} from './panelPP/panelPP.js';

function App() {
	let onSearch = false;

 
  function GetSearchState() {
	  if (onSearch) return (<GetResult />);
	  return (<GetSearch />)
  }
 
  return (
    <div style={{height: window.innerHeight + 'px'}}>
      <GetHead withSearch={onSearch} />
      <GetKnowPanel />
    </div>
    
  );
}


export default App;
