# File Copying

## Описание
Программа для резервного копирования файлов. Позволяет копировать файл или несколько файлов в различные директории.

## Цель проекта
Создать инструмент для копирования файлов с возможностью запуска в Docker-контейнере.

## Архитектура проекта
file-copying/
├── src/
│   ├── guiModule.py    
│   └── main.py
├── .dockerignore
├── .gitignore
├── Dockerfile
├── README.md
├── requirements.txt

# Локальный запуск
Запуск производится через файл run.bat или можно запустить самому
run.bat требует установки VcXsrv, альтернативно можно запустить файл main.py в папке src

# Запуск через Docker
docker build -t file-copy-app .
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix file-copy-app

# Установка зависимостей
pip install -r requirements.txt

# Пример 1: Копирование одного файла
Заходим в программу и выбираем режим "Копировать один файл"
В примере была выбрана директория "C:\Users\artem\Desktop\test\test1" и выбранный файл "C:\Users\artem\Desktop\test\text.txt", без дополнительных опций
Журнал операций:
<img width="973" height="203" alt="изображение" src="https://github.com/user-attachments/assets/2486f2d4-120a-4943-b9ee-f0fe142b7568" />
