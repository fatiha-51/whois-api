FROM python:3.10-slim

RUN apt update && apt install -y whois && pip install fastapi uvicorn

COPY main.py /main.py

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
