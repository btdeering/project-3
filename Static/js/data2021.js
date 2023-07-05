const data = [
    ["Nevada", 227046, 3143, 1.3173768606822136],
    ["Washington", 246752, 3461, 1.2270356465279317],
    ["Alaska", 47019, 206, 0.502313765750558],
    ["Hawaii", 22397, 289, 1.1479425703346695],
    ["Wyoming", 44409, 438, 1.141455044650462],
    ["Montana", 81555, 961, 1.7939490923471328],
    ["Oregon", 113909, 1477, 1.5206404990824236],
    ["Idaho", 141077, 1436, 1.0351705448314845],
    ["Colorado", 362438, 5435, 1.441517846370029],
    ["California", 2434974, 26298, 0.8585567100389627],
    ["Utah", 276612, 1269, 0.5955710680086482],
  ];
  
  const map = L.map("mapid").setView([37.8, -96], 4);
  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "&copy; OpenStreetMap contributors",
  }).addTo(map);
  
  data.forEach((d) => {
    const state = d[0];
    const latLng = getStateLatLng(state);
  
    const marker = L.marker(latLng).addTo(map);
    marker.bindPopup(
      `<b>${state}</b><br>Confirmed: ${d[1]}<br>Deaths: ${d[2]}<br>Case Fatality Ratio: ${d[3]}%`
    );
  });
  
  function getStateLatLng(state) {
    const stateLatLng = {
      Nevada: [39.5, -116],
      Washington: [47.5, -120.5],
      Alaska: [64, -150],
      Hawaii: [20.8, -157.3],
      Wyoming: [43, -107.5],
      Montana: [47, -110],
      Oregon: [44, -120.5],
      Idaho: [45.8, -114],
      Colorado: [39, -105.5],
      California: [36, -119],
      Utah: [39.5, -111.5],
    };
  
    return stateLatLng[state];
  }
  