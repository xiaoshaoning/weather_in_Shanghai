weather: weather.l
	flex weather.l
	gcc -o weather lex.yy.c -lfl
url2file: url2file.c
	gcc -o url2file url2file.c -lcurl
test:
	./url2file http://www.weather.com.cn/weather/101020100.shtml 2>/dev/null
	./weather page.out > weather.txt
	tail -n 1 weather.txt > weather.json
	python3 weather.py
