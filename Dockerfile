FROM python:3.10-slim

WORKDIR /app

#RUN apt update -y && \
#    apt install default-libmysqlclient-dev build-essential -y

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY . .

#RUN pip install mysqlclient
RUN pip install --no-cache -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]
