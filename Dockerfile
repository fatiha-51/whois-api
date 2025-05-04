FROM python:3.10-slim

# Installer les dépendances système
RUN apt update && apt install -y whois

# Copier les fichiers
COPY main.py /app/main.py
COPY requirements.txt /app/requirements.txt
WORKDIR /app

# Installer les dépendances Python
RUN pip install --no-cache-dir -r requirements.txt

# Lancer le serveur
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
