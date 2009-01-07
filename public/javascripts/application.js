// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
     
var cityList = new Array();
var cityId = 0;

// ===================
//  Event Functions
// ===================
function addCity(){
  var cityBean = getCityBean();
  
  addToTable(cityBean);
  addToMap(cityBean);
  addToArray(cityBean);
  //debug();
}

function deleteCity(e){
  var tr = getParentRow(getEventTarget(e));
  var cityId = tr.id;
  
  deleteFromTable(cityId);
  deleteFromMap(cityId);
  deleteFromArray(cityId);
  //debug();
}

// ===================
//  Form Functions
// ===================
function getCityBean(){
  var cityBean = new Object();
  
  cityBean.city = document.getElementById("city").value;
  cityBean.state = document.getElementById("state").value;
  cityBean.longitude = document.getElementById("longitude").value;
  cityBean.latitude = document.getElementById("latitude").value;
  cityBean.country = document.getElementById("country").value;
  cityBean.population = document.getElementById("population").value;
  cityId++;
  cityBean.id = "city" + cityId;
  return cityBean;
}

function populateForm(cityBean){
  document.getElementById("city").value = cityBean.city;
  document.getElementById("state").value = cityBean.region;
  document.getElementById("longitude").value = cityBean.longitude;
  document.getElementById("latitude").value = cityBean.latitude;
  document.getElementById("country").value = cityBean.country;
  document.getElementById("population").value = cityBean.population;
}

// ===================
//  Array Functions
// ===================
function addToArray(cityBean){
  cityList[cityList.length] = cityBean;
}

function deleteFromArray(cityId){
  var position = findById(cityId);
  var newList = new Array();
  
  if (position > -1) {
      for (var i = 0; i < cityList.length; i++) {
          if (i != position) {
              newList[newList.length] = cityList[i];
          }
      }
      cityList = newList;
  }
}

function findById(cityId){
  for (var i = 0; i < cityList.length; i++) {
      if (cityList[i].id == cityId) {
          return i;
      }
  }
  
  //if not found
  return -1;
}


// ===================
//  Table Functions
// ===================
function addToTable(cityBean){
  var tbl = document.getElementById("cityTable");
  var newRow = tbl.insertRow(tbl.rows.length);
  newRow.id = cityBean.id;
  
  var deleteCell = newRow.insertCell(0);
  var deleteButton = document.createElement("input");
  deleteButton.type = "button";
  deleteButton.name = "Delete";
  deleteButton.value = "Delete";
  registerListener(deleteButton, "click", deleteCity, false);
  deleteCell.appendChild(deleteButton);
  
  var cityCell = newRow.insertCell(1);
  cityCell.appendChild(document.createTextNode(cityBean.city));
  registerListener(cityCell, "mouseover", displayCityOnMap, false);
  
  var stateCell = newRow.insertCell(2);
  stateCell.appendChild(document.createTextNode(cityBean.state));
  registerListener(stateCell, "mouseover", displayCityOnMap, false);
  
  var longitudeCell = newRow.insertCell(3);
  longitudeCell.appendChild(document.createTextNode(cityBean.longitude));
  registerListener(longitudeCell, "mouseover", displayCityOnMap, false);
  
  var latitudeCell = newRow.insertCell(4);
  latitudeCell.appendChild(document.createTextNode(cityBean.latitude));
  registerListener(latitudeCell, "mouseover", displayCityOnMap, false);
}

function deleteFromTable(rowId){
  var row = document.getElementById(rowId);
  var tbl = row.parentNode;
  tbl.removeChild(row);
}

function getParentRow(node){
  var tr = node;
  
  //walk up the tree until we find the parent row (tr)
  do {
      tr = tr.parentNode;
  }
  while (tr.nodeName != "TR")
  
  return tr;
}

// ===================
//  Map Functions
// ===================
var usCenterPoint = new GPoint(-98.583333, 39.833333);
var initialCenterPoint = usCenterPoint;
var initialZoomLevel = 13;
var initialMapType = G_HYBRID_MAP;
var pushpinsCycle = 0;
var clickListener;
var buttonOn = "Now Adding Cities";
var buttonOff = "Click to Add Cities";
var map = null;

function initMap(){
  map = new GMap(document.getElementById("map"));
  map.addControl(new GLargeMapControl());
  map.addControl(new GMapTypeControl());
  resetMap();
}

function resetMap(){
  map.centerAndZoom(initialCenterPoint, initialZoomLevel);
  map.setMapType(initialMapType);
}

function addToMap(cityBean){
  var point = new GPoint(cityBean.longitude, cityBean.latitude);
  cityBean.marker = new GMarker(point);
  map.addOverlay(cityBean.marker);
}

function deleteFromMap(cityId){
  var position = findById(cityId);
  
  if (position > -1) {
      var cityBean = cityList[position];
      map.removeOverlay(cityBean.marker);
      map.closeInfoWindow();
  }
}

function displayCityOnMap(e){
  var tr = getParentRow(getEventTarget(e));
  var cityId = tr.id;
  var position = findById(cityId);
  var cityBean = cityList[position];
  
  var description = "<div>";
  description += cityBean.city + ", " + cityBean.state + "<br/>";
  description += " (" + cityBean.longitude + ", " + cityBean.latitude + ")";
  description += "</div>";
  
  //Safari aggressively line-breaks each word on whitespace and hyphens 
  //in InfoWindows. This normalizes display across browsers.
  description = description.replace(/ /g, "&nbsp;");
  description = description.replace(/\-/g, "&minus;");
  
  cityBean.marker.openInfoWindowHtml(description);
}



function cyclePushpins(){
  var button = document.getElementById("pushpinButton");
  
  switch (pushpinsCycle) {
      //turn on event listener
      case 0:
          pushpinsCycle++;
          clickListener = GEvent.addListener(map, "click", function(overlay, point){
              pushpin(overlay, point);
          });
          button.value = buttonOn;
          break;
          
      //turn off event listener
      case 1:
          pushpinsCycle = 0;
          GEvent.removeListener(clickListener);
          button.value = buttonOff;
          break;
  }
}

function pushpin(overlay, point){
  if (point) {
      var cityBean = new Object();
      cityBean.city = "";
      cityBean.state = "";
      cityBean.longitude = point.x;
      cityBean.latitude = point.y;
      populateForm(cityBean);
  }
}



// ===================
//  Misc Functions
// ===================
function registerListener(domElement, event, listener, captureEvent){
  //Normalize event registration across all browsers
  //1. Mozilla/Opera, 2. IE, 3. Other
  if (domElement.addEventListener) {
      domElement.addEventListener(event, listener, captureEvent);
      return true;
  }
  else 
      if (domElement.attachEvent) {
          return domElement.attachEvent('on' + event, listener);
      }
      else {
          domElement['on' + event] = listener;
          return true;
      }
}

function unregisterListener(domElement, event, listener, captureEvent){
  //Normalize event registration across all browsers
  //1. Mozilla/Opera, 2. IE, 3. Other
  if (domElement.removeEventListener) {
      domElement.removeEventListener(event, listener, captureEvent);
      return true;
  }
  else 
      if (domElement.detachEvent) {
          return domElement.detachEvent('on' + event, listener);
      }
      else {
          domElement['on' + event] = "";
          return true;
      }
}

function getEventTarget(e){
  //Mozilla uses event, IE uses window.event
  var event = e;
  if (!e) {
      event = window.event;
  }
  
  //Mozilla uses target, IE uses srcElement
  var target;
  if (event.target) {
      target = event.target;
  }
  else 
      if (event.srcElement) {
          target = event.srcElement;
      }
  
  return target;
}

function debug(){
  var output = "<ul>";
  for (var i = 0; i < cityList.length; i++) {
      output += "<li>";
      output += cityList[i].id + "-";
      output += cityList[i].city;
      output += "[" + cityList[i].marker + "]";
      output += "</li>";
  }
  output += "</ul>";
  debugOut(output);
}

function debugOut(message){
  document.getElementById("debug").innerHTML = "<p>" + message + "<p>";
}

function pageInit(){
	
  registerListener(document.getElementById("lookupCoordForACityButton"), "click", lookupCityShortcut, false);
  //registerListener(document.getElementById("lookupCoordForACityButton"), "click", lookupCity, false);
  registerListener(document.getElementById("addCityButton"), "click", addCity, false);
  initMap();
}

//pageInit is called after the page is fully loaded
registerListener(window, "load", pageInit, false);


function lookupCity(){
  var cityBean = getCityBean();
  
  // format should be like this city=Denver,CO,US or city=london,UK or city=cairo,EG
  var query = "/map/locate_city_by_name_and_state";
  query += "?city=" + cityBean.city;
  
  var request = GXmlHttp.create();
  request.open("GET", query, true);
  request.onreadystatechange = function(){
      if (request.readyState == 0) {
          errorOut("readyState 0 = uninitialized");
      }
      else 
      if (request.readyState == 1) {
          errorOut("readyState 1 = loading");
      }
      else 
      if (request.readyState == 2) {
          errorOut("readyState 2 = loaded");
      }
      else 
      if (request.readyState == 3) {
          errorOut("readyState 3 = interactive");
      }
      else 
      if (request.readyState == 4) {
			
          if (request.status == 200) {
		  	  
              var responseDoc = request.responseXML;
              var root = responseDoc.documentElement;
              
              if (root == null) {
                  root = responseDoc.firstChild;
              }
              var latitudeNode = root.getElementsByTagName("geo:lat")[0];
              cityBean.latitude = GXml.value(latitudeNode);

              var longitudeNode = root.getElementsByTagName("geo:long")[0];
              cityBean.longitude = GXml.value(longitudeNode);

              populateForm(cityBean);
          }
      }
  };
  request.send(null);
}



function lookupCityShortcut(){
  var cityBean = getCityBean();
  
  // format should be like this city=Denver,CO,US or city=london,UK or city=cairo,EG
  var query = "/map/locate_city_by_name_and_state";
  query += "?city=" + cityBean.city;

  GDownloadUrl(query, function(data, status){
      if (status == 200) {
          var responseDoc = GXml.parse(data);
          var root = responseDoc.documentElement;

          var latitudeNode = root.getElementsByTagName("latitude")[0];
          cityBean.latitude = GXml.value(latitudeNode);

          var longitudeNode = root.getElementsByTagName("longitude")[0];
          cityBean.longitude = GXml.value(longitudeNode);

          var city = root.getElementsByTagName("city")[0];
          cityBean.city = GXml.value(city);

          var accentedCity = root.getElementsByTagName("accent-city")[0];
          cityBean.accentedCity = GXml.value(accentedCity);

			// region or state 
          var region = root.getElementsByTagName("region")[0];
          cityBean.region = GXml.value(region);

          var country = root.getElementsByTagName("country")[0];
          cityBean.country = GXml.value(country);

          var population = root.getElementsByTagName("population")[0];
          cityBean.population = GXml.value(population);

          populateForm(cityBean);
      }
      else {
          errorOut("Bad things happened. status=" + status);
      }
  });
  request.send(null);
}
