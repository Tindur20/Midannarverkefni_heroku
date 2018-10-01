<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/static/main.css">
	<link rel="stylesheet" href="/static/normalize.css">
	<title>json skrár</title>
</head>
<body>
	% include('haus.tpl')
	<%
	import json
	with open("gogn.json", "r", encoding="utf-8") as skra:
    gogn = json.load(skra)
	%>

	<div class="group">
		<section class="col1_1">
			<ul>
		    % cnt = 0
			% for i in gogn['results']:
				<li>
				    <h3>{{ i['shortName'] }} - {{ i['longName'] }}  ISKR: {{ i['value'] }}</h3
				</li>
			%end

			</ul>
		</section>		
	</div>
	<div class="fotur group">
		<link rel="stylesheet" href="/static/main.css">
		% include('fotur.tpl')
	</div>
	
</body>
</html>
