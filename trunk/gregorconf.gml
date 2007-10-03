<gm:page title="GregorConferenceMap" onload="load()">

  <script>
    var geocoder = null;

    function load() {
      if (GBrowserIsCompatible()) {
        geocoder = new GClientGeocoder();
      }
    }

    function moveMapToLocation(entry) {
      var location = new GPath("gd:where/@valueString").getValue(entry);
      var map = google.mashups.getObjectById("map").getMap();
      geocoder.getLatLng(location,
        function(point) {
          if (point) {
            var marker = new GMarker(point);
            map.addOverlay(marker);
            google.mashups.getObjectById("bubbleItem").setEntry(entry);
            marker.openInfoWindow(document.getElementById("bubbleItem"));
            map.setCenter(point, 7);
          }
        }
      );
    }
</script>

<h1>Gregor's Conference Travel</h1>

<table width="900">
  <tr valign="top">
    <td width="300">

      <gm:list id="myList" data="http://www.google.com/calendar/feeds/k6bnejmmglue0r1tsg6bfhnku8@group.calendar.google.com/public/full" pagesize="10">
        <gm:handleEvent event="select" execute="moveMapToLocation(event.entry);"/>

      </gm:list>
      <gm:item id="item" template="itemTemplate">
        <gm:handleEvent src="myList"/>
      </gm:item>

    </td>

    <td class="mainPanel">
      <gm:map id="map"/>
    </td>
  </tr>

</table>

<div style="visibility:hidden">
  <gm:item id="bubbleItem" template="bubbleTemplate"/>
</div>

<gm:template id="itemTemplate">
  <div>
    <b><gm:text ref="atom:title"/></b><br/>
    <gm:text ref="gd:where/@valueString"/><br/>

    <gm:text ref="gd:when/@startTime"/> &nbsp;until&nbsp; <gm:text ref="gd:when/@endTime"/>
  </div>
</gm:template>

<gm:template id="bubbleTemplate">
  <div>
    <gm:link ref="atom:content" labelref="atom:title"/>
    <br/>

    <gm:text ref="gd:where/@valueString"/><br/>
  </div>
</gm:template>

</gm:page>