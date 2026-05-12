# BigDataFlink
## Инструкция по запуску
1. Склонировать репозиторий: ```git clone https://github.com/AminaKhabirova/BigDataFlink.git```
2. Запустить контейнер: ```docker-compose up -d```
3. Подключиться к Jupyter Notebook с параметрами:
<br>Хост: ```localhost```
<br>Порт: ```8888```
<br>Токен: ```3f223808d1e5f9c14fba523633a761ee8d779a50e788147b```
4. Открыть ноутбук ```./work/input_to_kafka.ipynb``` и выполнить все ячейки
5. Открыть ноутбук ```./work/flink_transformation.ipynb``` и выполнить все ячейки
6. Создать соединение с PostgreSQL в DBeaver с параметрами:
<br>Хост: ```localhost```
<br>Порт: ```5433```
<br>База данных: ```postgres```
<br>Пользователь: ```postgres```
<br>Пароль: ```mysecretpassword```