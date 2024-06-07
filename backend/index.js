const express = require('express');

const app = express();
const todoItems = require('./todo-items.json');
const jsonParser = express.json();
const sql = require('mssql')
const cors = require('cors')
var crypto = require('crypto');
var synaptic = require('synaptic');
const { Layer, Network } = synaptic;
app.options('http://localhost:3000/', cors())
let cnfg = {}; 

function fileHandler(){ 
    fs.readFile('./cnfg.json', 'utf8', (err, data) => {
        if(err) throw err;
		cnfg = JSON.parse(data);
    });
}
fileHandler();

const whitelist = ['http://localhost:3000/', cnfg.SSite]
const PORT = cnfg.Port;


const sqlConfig = {
  server: "localhost",
  user: "User",
  password: cnfg.PassUser,
  database: "ES",
  options: {
    trustServerCertificate: true 
  },
  port: 1432
}
var dbConn = new sql.ConnectionPool(sqlConfig);
    dbConn.connect();
	

const sqlConfigG = {
  server: "localhost",
  user: "Guest",
  password: cnfg.PassGuest,
  database: "ES",
  options: {
    trustServerCertificate: true
  },
  port: 1432
}
var dbConnG = new sql.ConnectionPool(sqlConfigG);
    dbConnG.connect();

const sqlConfigA = {
  server: "localhost",
  user: "AdminES",
  password: cnfg.PassAdmin,
  database: "ES",
  options: {
    trustServerCertificate: true 
  },
  port: 1432
}
var dbConnA = new sql.ConnectionPool(sqlConfigA);
    dbConnA.connect();
	
async function exeSQL(query, prmArr) {
	
	 var request = new sql.Request(dbConn);
	 
	 let res = await request.input('Log', sql.VarChar(50), prmArr.log)
	                         .input('Pass', sql.VarChar(50), prmArr.pass)
	                         .execute(query);
       
	 return res;

}

async function exeSQLF(query, prmArr) {
	
	 var request = new sql.Request(dbConn);
	 
	 let res = await request.query(query);
	 
	 return res;

}

async function exeSQLG(query) {
	
	 var request = new sql.Request(dbConnG);
	 
	 let res = await request.query(query);
	 
	 return res;
}

async function exeSQLA(query) {
	
	 var request = new sql.Request(dbConnA);
	 
	 let res = await request.query(query);
	 
	 return res;
}


app.post('/makeSQLQ', jsonParser, (req, res) => {
	
	console.log(req.body);
	let prmArr = req.body.prm;
	let query = req.body.query;
	

	exeSQL(query, prmArr).then(RS => {
	res.send(JSON.stringify(RS));
});
});

app.post('/makeSQLQG', jsonParser, (req, res) => {

	let query = req.body.query;

	exeSQLG(query).then(RS => {
	  res.setHeader('Access-Control-Allow-Origin', cnfg.SSite);
      res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
      res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
      res.setHeader('Access-Control-Allow-Credentials', true);
	res.send(JSON.stringify(RS));
});
});
	
app.post('/makeSQLQA', jsonParser, (req, res) => {

	let query = req.body.query;

	exeSQLA(query).then(RS => {
	  res.setHeader('Access-Control-Allow-Origin', cnfg.SSite);
      res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
      res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
      res.setHeader('Access-Control-Allow-Credentials', true);
	res.send(JSON.stringify(RS));
});
});


app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', cnfg.SSite);
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
  res.setHeader('Access-Control-Allow-Credentials', true);
  
  next();
});

app.listen(PORT, () => {
  console.log(`Server listening on ${PORT}`);
});


var inputLayer = new Layer(2);
var hiddenLayer1 = new Layer(8);
var hiddenLayer2 = new Layer(4);
var hiddenLayer3 = new Layer(2);
var outputLayer = new Layer(1);

inputLayer.project(hiddenLayer1);
hiddenLayer1.project(hiddenLayer2);
hiddenLayer2.project(hiddenLayer3);
hiddenLayer3.project(outputLayer);

var myNetwork = new Network({
 input: inputLayer,
 hidden: [hiddenLayer1,hiddenLayer2,hiddenLayer3],
 output: outputLayer
});

let rs = exeSQLG("select count(1) as cnt from Переменные_предикаты");

let learningRate = cnfg.learningRate;
let linkC = 0;
let showC = 0;

if(rs.recordset[0].cnt > cnfg.PPcount)
{
	let rsPP = exeSQLG("SELECT * from Значения_связи, Связи_ПП, Переменные_предикаты ПП, Правила, Доп_данные where Правила.ID_Связи = Связи_ПП.ID_Связи and Значения_связи.ID_Связи = Связи_ПП.ID_Связи and ПП.ID_ПП = Значения_связи.ID_ПП and  Доп_данные.ID_Связи = Связи_ПП.ID_Связи");
	
	for(let pp in rsPP.recordset)
	{
	  let rsLink = exeSQLG("select count(1) as cnt from Доп_данные where ID_Связи = " + pp.ID_Связи +" and ID_Связи_доп_вывода IS NOT NULL ");
      let rsShow = exeSQLG("select Кол_показов from Доп_данные where ID_Связи = " + pp.ID_Связи +" ");
	  let rsL = exeSQLG("select Значение_важности from Связи_ПП where ID_Связи = " + pp.ID_Связи +" ");
	  
  
	  linkC = rsLink.recordset[0].cnt;
	  showC = rsShow.recordset[0].Кол_показов;
	  
      myNetwork.activate([linkC,showC]);
      myNetwork.propagate(learningRate, rsL.recordset[0].Значение_важности);
	}	

}
else
{
	for (let i = 0; i < 200000; i++) {

		linkC = crypto.randomInt(4, 8);
		showC = crypto.randomInt(60, 200);
		myNetwork.activate([linkC,showC]);
		myNetwork.propagate(learningRate, [1]);

  
		linkC = crypto.randomInt(0, 2);
		showC = crypto.randomInt(0, 20);
		myNetwork.activate([linkC,showC]);
		myNetwork.propagate(learningRate, [0]);
		
		linkC = crypto.randomInt(2, 4);
		showC = crypto.randomInt(20, 60);
		myNetwork.activate([linkC,showC]);
		myNetwork.propagate(learningRate, [0.5]);
	}
}