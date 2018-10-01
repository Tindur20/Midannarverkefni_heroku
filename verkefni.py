from sys import argv
import json
import urllib.request, json
import bottle
from bottle import *

with urllib.request.urlopen("http://apis.is/petrol") as url:
    data = json.loads(url.read().decode())

@route('/')
def index():
       return template("index2.tpl",data=data)


@route('/company/<company>')
def index(company):
    return template('company.tpl',data=data, co=company)

@route('/moreinfo/<key>')
def index(key):
    return template('moreinfo', data=data, k=key)


@route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='./static')


#run(host='localhost', port=8800, debug = True)

bottle.run(host='0.0.0.0', port=argv[1]) #Þetta þarf að vera í gangi til að heruko serverinn mun virka
