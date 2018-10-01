<html>
<head>
    <%
	    import urllib.request, json
	    with urllib.request.urlopen("http://apis.is/petrol") as url:
        data = json.loads(url.read().decode())

     for i in data['results']:
                if i['key'] == k:

                lat = i['geo']['lat']
                lon = i['geo']['lon']

    end
    end
	%>
	<link rel="stylesheet" href="/static/main.css">
	<link rel="stylesheet" href="/static/normalize.css">
	<link rel="stylesheet" href="/static/bootstrap.min.css">
     <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcf5Fh2zoFuO5yq3Eiy52J-X4lUz5sPaU&callback=initMap"
  type="text/javascript"></script>
    <script>
                function initMap() {
                    new google.maps.Map(document.getElementById('map'),{
                    center:{lat:{{lat}} , lng:{{lon}},
                    zoom: 18
                    });
                }
    </script>

	<title>json skrár</title>
</head>
<body onload="initMap()">
	% include('haus.tpl')


		<section class="col1_1">
		<br>
		<br>
		<table class="table table-striped">
            <tbody>
                <tread>
                <th>Fyrirtæki img</th>
                <th>Fyrirtæki</th>
                <th>Staðsetning</th>
                <th>Bensin</th>
                <th>Diesel</th>
                </tread>
            <%
            cnt = 0
            for i in data['results']:
                if i['key'] == k:

                lat = i['geo']['lat']
                lon = i['geo']['lon']
            %>
                <tbody>
                    <tr>
                       <td><img src="/static/{{i['company']}}.png" class="imgResize"></td>
                        <td class="fontStyle"><a href=""></a>{{ i['company'] }}</td>
                        <td class="fontStyle">{{ i['name'] }}</td>
                        <td class="fontStyle">{{ i['bensin95'] }}</td>
                        <td class="fontStyle">{{ i['diesel'] }}</td>
                        <h3>Lat og lon á mapi: {{i['geo']['lat']}},{{i['geo']['lon']}}</h3>
                    </tr>
                    <%
                    end
                    end
                    %>
                </tbody>
            </table>
            </tbody>
		</table>
		</section>
        <section>


            <div id="map" style="width: 100%; height: 500px;"></div>
        </section>
		<section class="col1_1">
		<br>
		% include('fotur.tpl')
    </section>
</body>
</html>
