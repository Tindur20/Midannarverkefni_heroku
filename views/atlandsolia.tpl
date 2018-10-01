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
    gogn = json.loads(url.read().decode())
	%>

		<section class="col1_1">
		<br>
		<br>
		<table class="table table-striped">
            <tbody>
                <tread>
                    <th>Fyrirtæki</th>
                    <th>Nafn</th>
                    <th>Gengi</th>
                    </tread>
                    <tbody>
                        % cnt = 0
                        % for i in gogn['results']:
                        <tr>
                           <td><img src="static/company/{{"></td><td>{{ i['company'] }}</td><td>{{ i['bensin95'] }}</td><td> {{ i['diesel'] }}</td>
                            % cnt = cnt + 1
                        </tr>
                        %end
                    </tbody>
                </table>
            </tbody>
		</table>
		</section>
		<section class="col1_1">
		<br>
		% include('fotur.tpl')
		</section>

</body>
</html>
