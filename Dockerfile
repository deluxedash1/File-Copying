FROM python:3.11-slim

# Устанавливаем Tkinter
RUN apt-get update && apt-get install -y \
    python3-tk \
    tk-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Копируем и устанавливаем зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем исходный код
COPY src/ ./src/

CMD ["python", "src/main.py"]
