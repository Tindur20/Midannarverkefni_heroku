<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/static/main.css">
	<link rel="stylesheet" href="/static/normalize.css">
	<link rel="stylesheet" href="/static/bootstrap.min.css">
	<title>Gas Vaktinn</title>
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
            <%
			minpriceP = 5000.0
			minpriceD = 5000.0

            le = len(data['results'])
			c = 0
            for i in range(le-1):
				c = i
				if minpriceP > data['results'][i]['bensin95']:
					minpriceP = data['results'][i]['bensin95']
					companyP = data['results'][i]['company']
				end

				if minpriceD > data['results'][i]['diesel']:
					minpriceD = data['results'][i]['diesel']
					companyD = data['results'][i]['company']
				end

            if(data['results'][i]['company'] != data['results'][i-1]['company']):
            %>

            <tr>
                <td><h3><a href="/company/{{data['results'][i]['company']}}">{{data['results'][i]['company']}}</a></h3></td>
            </tr>
            <%
            end
            end
            %>
            </tbody>
		</table>
		</section>
		<section class="col1_1">
			<%
				import datetime
				t = data['timestampPriceCheck']
				t = t[:19] # strippum af millisec
				d = datetime.datetime.strptime(t,'%Y-%m-%dT%H:%M:%S')
			%>
			<div class="info">
				<h3>Besta Verðið / Aðrar Upplýsingar</h3>
				<h4>bensin 95 : <i>{{minpriceP}}</i> er hjá <i>{{companyP}}</i></h4>
				<h4>Díesel: <i>{{minpriceD}}</i> er hjá <i>{{companyD}}</i></h4>
				<h4>Síðasta uppfærsla: {{ d.strftime('%d.%m.%Y Kl: %H:%M') }}  </h4>
			</div>
		</section>



		<section class="col1_1">
		<br>
		% include('fotur.tpl')
		</section>

</body>
</html>
