FROM python:3.11-slim

# Устанавливаем только Tkinter (остальное уже есть в Python)
RUN apt-get update && apt-get install -y python3-tk && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY src/ ./src/
CMD ["python", "src/main.py"]
