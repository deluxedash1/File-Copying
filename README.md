# Website Monitor

## Описание
Программа для мониторинга доступности веб-сайтов. Проверяет HTTP-статус, время ответа и доступность URL-адресов. Поддерживает проверку как отдельных URL, так и списков сайтов из файла.

## Цель проекта
Создать инструмент для быстрой проверки доступности веб-ресурсов с возможностью запуска в Docker-контейнере.

## Архитектура проекта
website-monitor/
├── src/
│   ├── __init__.py
│   ├── checer.py    
│   └── main.py
├── .dockerignore
├── .gitignore
├── Dockerfile
├── README.md
├── requirements.txt
└── urls.txt

# Локальный запуск
# Установка зависимостей
pip install -r requirements.txt

# Проверка отдельных URL
python -m src.main --urls "https://google.com" "https://github.com"

# Проверка из файла
python -m src.main --file urls.txt

# С указанием таймаута
python -m src.main --urls "example.com" "yandex.ru" --timeout 15

# Пример 1: Проверка нескольких сайтов
python -m src.main --urls "google.com" "github.com" "example.com"
# Вывод:
🔍 Checking 3 website(s)...
🌐 Website Monitoring Report
==================================================
✅ https://google.com - Available (200) - 1007.59ms
✅ https://github.com - Available (200) - 546.06ms
✅ https://example.com - Available (200) - 841.93ms
==================================================
Summary: 3/3 sites are available

python -m src.main --urls http://this-website-definitely-does-not-exist-12345.com/
# Вывод:
🔍 Checking 1 website(s)...
🌐 Website Monitoring Report
==================================================
❌ http://this-website-definitely-does-not-exist-12345.com/ - Failed - HTTPConnectionPool(host='this-website-definitely-does-not-exist-12345.com', port=80): M
ax retries exceeded with url: / (Caused by NameResolutionError("<urllib3.connection.HTTPConnection object at 0x0000022614AF9A50>: Failed to resolve 'this-website-definitely-does-not-exist-12345.com' ([Errno 11001] getaddrinfo failed)"))
==================================================
Summary: 0/1 sites are available

# Пример 2: Проверка из файла
python -m src.main --file urls.txt
# Вывод:
🔍 Checking 8 website(s)...
🌐 Website Monitoring Report
==================================================
✅ https://google.com - Available (200) - 1888.99ms
✅ https://github.com - Available (200) - 540.08ms
✅ https://yandex.ru - Available (200) - 734.31ms
❌ https://this-site-does-not-exist-99999.com - Failed - HTTPSConnectionPool(host='this-site-does-not-exist-99999.com', port=443): Max retries exceeded with url: / 
(Caused by NameResolutionError("<urllib3.connection.HTTPSConnection object at 0x00000219A6CB0CA0>: Failed to resolve 'this-site-does-not-exist-99999.com' ([Errno 11001] getaddrinfo failed)"))
❌ http://256.256.256.256 - Failed - HTTPConnectionPool(host='256.256.256.256', port=80): Max retries exceeded with url: / (Caused by NameResolutionError("<urllib3.
connection.HTTPConnection object at 0x00000219A6CB1900>: Failed to resolve '256.256.256.256' ([Errno 11001] getaddrinfo failed)"))
✅ https://httpbin.org/status/404 - Available (404) - 1086.44ms
✅ https://httpbin.org/status/404 - Available (404) - 169.8ms
❌ https://invalid-website-12345.com - Failed - HTTPSConnectionPool(host='invalid-website-12345.com', port=443): Max retries exceeded with url: / (Caused by NameRes
olutionError("<urllib3.connection.HTTPSConnection object at 0x00000219A6C3A950>: Failed to resolve 'invalid-website-12345.com' ([Errno 11001] getaddrinfo failed)"))
==================================================
Summary: 5/8 sites are available