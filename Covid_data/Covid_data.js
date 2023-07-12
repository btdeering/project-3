  // Creating the map object
  const map = L.map('map').setView([37.8, -96], 5);

  // create a layer to add the markers
  let layerGroup = L.layerGroup().addTo(map);

  // let regionPolygonData =  {
  //   type:"FeatureCollection",
  //   features:[
        // {
        //     "type":"Feature",
        // "id":"01",
        // "properties":
        // {"name":"Alabama",
        // },
        // "geometry":
        // {"type":"Polygon",
        // "coordinates":[[]]
        // }
        // }
//]
 //};
// Adding the tile layer
	const tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
		maxZoom: 19,
		attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
	}).addTo(map);

// Use this link to get the GeoJSON data. (this is the default link when page is loading)
let link = '../Clean/clean_2021.json';


//Create a controls to add the year and region dropdown to add on the map as control
const year = L.control();

	year.onAdd = function (map) {
		this._div = L.DomUtil.create('div', 'year');
		this.update();
		return this._div;
	};

  
	year.update = function (props) {
		const contents = `
    <div class='container'>
    <label class='label'>Year</label>
    <select id='year' class='formcontrol' onChange='selectYearandRegion()'>
    <option selected value='2021'>2021</option>
    <option value='2022'>2022</option>
    <option value='2023'>2023</option>
    </select>
    </div>
    <div class='container'>
    <label class='label'>Region</label>
    <select id='region' class='formcontrol' onChange='selectYearandRegion()'>
    <option selected value='All'>All</option>
    <option value='Southeast'>Southeast</option>
    <option value='Southwest'>Southwest</option>
    <option value='Pacific'>Pacific</option>
    <option value='Midwest'>Midwest</option>
    <option value='Northeast'>Northeast</option>
    <option value='Rocky_Mountain'>Rocky Mountain</option>
    </select>
    <div>`;
		this._div.innerHTML = `${contents}`;
	};

	year.addTo(map);

	function getColor(d) {
    return d > 15000 ? '#800026' :
    d > 12000  ? '#BD0026' :
    d > 10000  ? '#E31A1C' :
    d > 7000  ? '#FC4E2A' :
    d > 5000   ? '#FD8D3C' :
    d > 3000   ? '#FEB24C' :
    d > 1000   ? '#FED976' : '#FFEDA0';
	}

  const legend = L.control({position: 'bottomright'});

	legend.onAdd = function (map) {

		const div = L.DomUtil.create('div', 'info legend');
		const grades = [1000, 3000, 5000, 7000, 10000, 12000, 15000];
		const labels = [];
		let from, to;

		for (let i = 0; i < grades.length; i++) {
			from = grades[i];
			to = grades[i + 1];

			labels.push(`<i style="background:${getColor(from + 1)}"></i> ${from}${to ? `&ndash;${to}` : '+'}`);
		}

		div.innerHTML = labels.join('<br>');
		return div;
	};

	legend.addTo(map);
// function to call when the year and region values are selected 
function selectYearandRegion(){ 
const year = document.getElementById('year').value; // get the selected year value 
const region = document.getElementById('region').value; // get the selected region value

//clear the layer to remove the markers when values are changed from the year and region dropdowns
layerGroup.clearLayers();

// based on the selected year change the JSON file path to load 
  if(year == '2021'){
    link = '../Clean/clean_2021.json';
  }
  if(year == '2022'){
    link = '../Clean/clean_2022.json';
  }
  if(year == '2023'){
    link = '../Clean/clean_2023.json';
  }

  //load the JSON file and get the data 
  d3.json(link).then(function(data) { 

//     let transformedData = data.reduce((acc, d) => { 
//       if (Object.keys(acc).includes(d.Region)) return acc;
  
//       acc[d.Region] = data.filter(g => g.Region === d.Region); 
//       return acc;
//   }, {})
// let index = 0;
//   for(let region of Object.entries(transformedData)) {
//     const feature = {
//            type:"Feature",
//         id: index++,
//         properties:
//         {name:region[0],
//         },
//         geometry:
//         {type:"Polygon",
//         coordinates:[[]]
//     }
//       region[1]

//   }

  let filteredData = data;
    if(region !== 'All') {
      //filter the data for the selected region 
      filteredData = data.filter(val=> val.Region === region);
    } 

    //loop through the filtered data and add markers on the map and its details for the in the popup.
    filteredData.map(value => {

      const myCustomColour = getColor(value.total_deaths);
      const markerHtmlStyles = `
  background-color: ${myCustomColour};
  width: 2rem;
  height: 2rem;
  display: block;
  left: -1.5rem;
  top: -1.5rem;
  position: relative;
  border-radius: 2rem 2rem 0;
  transform: rotate(45deg);
  border: 1px solid #FFFFFF`
  
      const myIcon = L.divIcon({
        className: "my-custom-pin",
        iconAnchor: [0, 24],
        labelAnchor: [-6, 0],
        popupAnchor: [0, -36],
        html: `<span style="${markerHtmlStyles}" />`
      })
      

      L.marker([value.lat, value.long],{icon: myIcon}).addTo(layerGroup).bindPopup(`<h2>${value.State}</h2><hr>
      <b>Total Confirmed: </b><i>${value.total_confirmed}</i>
      <br><b>Total Deaths: </b><i>${value.total_deaths}</i>
      <br><b>Average Fatality Ratio:</b> <i>${value.average_case_fatality_ratio}</i>`);
    });
    
});
  
}


//calling function on the load to load data of year 2021 for all regions as default. 
  selectYearandRegion();



  // function getStateColor(value) {
  //   // Define your color ranges and corresponding colors here
  //   const colorRanges = [
  //     { min: 0, max: 100, color: 'green' },
  //     { min: 101, max: 200, color: 'yellow' },
  //     { min: 201, max: 300, color: 'orange' },
  //     { min: 301, max: Infinity, color: 'red' }
  //   ];
  
  //   // Find the color range that matches the state's value
  //   const range = colorRanges.find(range => value >= range.min && value <= range.max);
  
  //   // Return the corresponding color
  //   return range ? range.color : 'gray'; // Default color for values outside defined ranges
  // }
  