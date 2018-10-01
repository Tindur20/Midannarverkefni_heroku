<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/static/main.css">
	<link rel="stylesheet" href="/static/normalize.css">
	<link rel="stylesheet" href="/static/bootstrap.min.css">
	<title>json skrár</title>
</head>
<body>
	% include('haus.tpl')
	<%
	import urllib.request, json
	with urllib.request.urlopen("http://apis.is/petrol") as url:
    data = json.loads(url.read().decode())
	%>

		<section class="col1_1">
		<br>
		<br>
		<table class="table table-striped">
            <tbody>
                <tread>
                <th>Fyrirtæki img</th>
                <th>Fyrirtæki</th>
                <th>Staðsetning</th>
                </tread>
            <%
            cnt=0
            for i in data['results']:
                if i['company'] == co:
                cnt += 1
            %>

                <tbody>
                    <tr>
                       <td><img src="/static/{{i['company']}}.png" class="imgResize"></td><td class="fontStyle"><a href="/moreinfo/{{ i['key'] }}">{{ i['company'] }}</a></td><td class="fontStyle">{{ i['name'] }}</td>
                    </tr>
                    <%
                    end
                    end
                    %>
                </tbody>
            </table>
            </tbody>
		</table>

            <h3>Fjoldi bensínstöðvar hjá {{ co }} er {{ cnt }} á landinu.</h3>
		</section>

		<section class="col1_1">
		<br>
		% include('fotur.tpl')
		</section>

</body>
</html>
