

 




<!-- Set the vars that citedby_image.js will need -->
var SciverseURL="http://searchapi.scopus.com/";
var SciverseTimeout="40000"; 

var citedByCount = null;
var inwardURL = null;
var authToken = null;
var authTokenStatusCode = null;
var ipAddress = null;
var contentAPIKey = null;
var searchStatusFlag = null; 


citedByCount ='null';
inwardURL ='null';
authToken ='null'; 
authTokenStatusCode ='null';
ipAddress ='null'; 
contentAPIKey = 'null';
searchStatusFlag = 'false';



<!-- Include citedby_image.js -->
var sciverse = new sciverseInterface();
var Backend = new sciverseBackend();

var outputImage= new output();

outputImage.renderCitedbySearchimage ();

function output(){
	// To render the output as image	
	
	this.renderCitedbySearchimage = function(){	
		var sciverseURL=SciverseURL;
		var renderLocation=	"citedBy";	
		var element = document.getElementById(renderLocation);
		if(searchStatusFlag == "true"){
			element.innerHTML='<a href='+inwardURL+' target=\"blank\"><image src="'+sciverseURL+'citedby?&citedbycount='+citedByCount+'&authToken='+authToken+'&ipAddress='+ipAddress+'&contentAPIKey='+contentAPIKey+'&authTokenStatusCode='+authTokenStatusCode+'" border=\"0\"/></a>';
		}else{				
			element.innerHTML='<image src="'+sciverseURL+'citedby?&citedbycount='+citedByCount+'&authToken='+authToken+'&ipAddress='+ipAddress+'&contentAPIKey='+contentAPIKey+'&authTokenStatusCode='+authTokenStatusCode+'" border=\"0\"/>';
		}
		document.sciverseForm.searchButton.disabled = false;	
	}
}
var response=sciverse.response1;

function sciverseInterface(){

	this._resultsValid 	= false;
	this._results 		= null;
	this._errors 		= null;
	this._warnings		= null;
	this._search 		= null;
	this._callback 		= null;
	this._errorCallback = null;
	
	this._renderLocation=	"div_id";	
	
	this.Backend = new sciverseBackend();
	
	
	// see here for explanation of "me": 
	// http://w3future.com/html/stories/callbacks.xml
	var me = this;
	
	//apiKey and it's setter
	this._apiKey = null;
		
	this.setApiKey = function(apiKey){
		me._apiKey = apiKey;
	}
		
	this.search = function(searchObj){
		
		me._resultsValid = false;
		me._search = searchObj;
		me.Backend.submitSearch(searchObj, me._apiKey, me.searchCallback);
	}
		
}

//This class handles building and submitting the search request to the server as well as
//the callback response from the server.
function sciverseBackend(){

//For cited By search identifiers and input variables

	this._doi	 		= 	"doi";
	this._eid			= 	"eid";
	this._scp			=	"scp";
	this._pii			=	"pii";
	this._issn			=	"issn";
	this._isbn			=	"isbn";
	this._vol			=	"vol";
	this._issue			=	"issue";
	this._title			=	"title";
	this._firstPg		=	"firstPg";
	this._artNo			=	"artNo";

	this._busy = false;
	this._sciverseCallback = null;
	this._resultForm = null;
	
	this._reqCounter = 0;
	this._requests = {};
	
	//Request static vars (should be config vars in a perfect world)
	this._sciverseURL = SciverseURL+"citedBySearchSciverseAPI.url";
	this._timeoutVal = SciverseTimeout;
	this._responseOb=null;
	//request field names
	this._preventCache = "preventCache";
	this._apiKey = "apiKey";
	this._callback = "callback";
	
	
	//useful callback strings
	this._callbackStringStart = "sciverse.Backend._requests.";
	this._callbackStringEnd = ".callback";
	
	//useful url chars
	this._equals = "=";
	this._connector = "&";
	this._post = "?";
			
	//functions calling this method need to provide a callback method which is
	//in the form function(response).  This is due to the fact that this is an 
	//asyncronus library so when control is returned, processing is not done.
	//When the search is complete submitSearch will call the callback function.
	this.submitSearch = function(searchObj, apiKey, callback)
	{

		if(this._busy == true){
			//debug.write("Search already in flight...ignoring search request");
			return;
		}else{
			//set busy to true
			this._busy = true;
			
			//debug.write("Search submitted: query="+searchObj.getSearch());
			this._sciverseCallback = callback;
			
			var searchRequestURL = this._sciverseURL+this._post;
					
			//add in browser cacheing prevention.  This is used to change the generated URL
			//slightly each time to prevent the browser from caching a response to identical searches.
			//That's bad because if it happens the browser won't "run" the response.
			searchRequestURL = this.appendVarToURL(searchRequestURL,this._preventCache,this.randomString());
			
			//add in apiKey
			searchRequestURL = this.appendVarToURL(searchRequestURL,this._apiKey,apiKey);
			
				
			
			searchRequestURL = this.appendVarToURL(searchRequestURL,this._doi,searchObj.getDoi());
			searchRequestURL = this.appendVarToURL(searchRequestURL,this._eid,searchObj.getEid());
			searchRequestURL = this.appendVarToURL(searchRequestURL,this._scp,searchObj.getScp());
			searchRequestURL = this.appendVarToURL(searchRequestURL,this._pii,searchObj.getPii());
			searchRequestURL = this.appendVarToURL(searchRequestURL,this._issn,searchObj.getIssn());
			searchRequestURL = this.appendVarToURL(searchRequestURL,this._isbn,searchObj.getIsbn());
			searchRequestURL = this.appendVarToURL(searchRequestURL,this._vol,searchObj.getVol());
			searchRequestURL = this.appendVarToURL(searchRequestURL,this._issue,searchObj.getIssue());
			searchRequestURL = this.appendVarToURL(searchRequestURL,this._title,searchObj.getTitle());
			searchRequestURL = this.appendVarToURL(searchRequestURL,this._firstPg,searchObj.getFirstPg());
			searchRequestURL = this.appendVarToURL(searchRequestURL,this._artNo,searchObj.getArtNo());
						
			this.addRequestToHeader(searchRequestURL);
			//setup a timeout in case bad things happen
			
		}
	}
	
	//if the value is not null this appends a field and value to an URL 
	//and returns it.  Otherwise it just returns the URL
	this.appendVarToURL = function(url, field, value){
		if(value != null && value != ""){
			url += this._connector+field+this._equals+value;
			return url;
		}else{
			return url;
		}
	}
	
	//Adds an URL to the header of an HTML document in a javascript tag
	//The purpose here is to cause the browser to load the new URL asyncronusly
	this.addRequestToHeader = function(searchURL){
		var head = document.getElementsByTagName("head")[0];
 		script = document.createElement('script');
 		script.id = 'sciverseSearch';
 		script.type = 'text/javascript';
 		script.src = searchURL;
 		head.appendChild(script);
	}
	
	//Creates a random string that is 20 chars long.
	this.randomString = function() {
		var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
		var string_length = 20;
		var randomstring = '';
		for (var i=0; i<string_length; i++) {
			var rnum = Math.floor(Math.random() * chars.length);
			randomstring += chars.substring(rnum,rnum+1);
		}
		return randomstring;
	}

}

//This class is effectivly a bean, and represents all of the fields that a 
//user can specify in a search 
function searchObj(){

//For cited By search identifiers and input variables

	this._doi	 		= 	null;
	this._eid			= 	null;
	this._scp			=	null;
	this._pii			=	null;
	this._issn			=	null;
	this._isbn			=	null;
	this._vol			=	null;
	this._issue			=	null;
	this._title			=	null;
	this._firstPg		=	null;
	this._artNo			=	null;	

	
	this.setDoi = function(doi){
		this._doi = doi;
	}
	this.getDoi = function(){
		return this._doi;
	}
	//get end
	this.setEid = function(eid){
		this._eid= eid;
	}
	this.getEid = function(){
		return this._eid;
	}
	//get end
	this.setScp = function(scp){
		this._scp = scp;
	}
	this.getScp = function(){
		return this._scp;
	}
	//get end
	this.setPii = function(pii){
		this._pii = pii;
	}
	this.getPii = function(){
		return this._pii;
	}
	//get end
	this.setIssn = function(issn){
		this._issn = issn;
	}
	this.getIssn = function(){
		return this._issn;
	}
	//get end
	this.setIsbn = function(isbn){
		this._isbn= isbn;
	}
	this.getIsbn = function(){
		return this._isbn;
	}
	//get end
	this.setVol = function(vol){
		this._vol = vol;
	}
	this.getVol = function(){
		return this._vol;
	}
	//get end
	this.setIssue	 = function(issue){
		this._issue	 = issue;
	}
	this.getIssue = function(){
		return this._issue;
	}
	//get end
	this.setTitle		 = function(title){
		this._title		 = title	;
	}
	this.getTitle = function(){
		return this._title;
	}
	//get end
	this.setFirstPg		 = function(firstPg){
		this._firstPg		 = firstPg	;
	}
	this.getFirstPg = function(){
		return this._firstPg;
	}
	//get end
	this.setArtNo		 = function(artNo){
		this._artNo		 = artNo	;
	}
	this.getArtNo= function(){
		return this._artNo;
	}
	//get end



	
}



 



 