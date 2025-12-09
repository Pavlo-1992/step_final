# Базовий образ
FROM python:3.10-slim

# Робоча директорія
WORKDIR /app

# Копіюємо файли
COPY app.py .

# Встановлюємо залежності
RUN pip install flask

# Порт
EXPOSE 8000

# Команда запуску
CMD ["python", "app.py"]
