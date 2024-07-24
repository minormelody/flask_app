FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/minormelody/flask_app.git /app

RUN pip install --no-cache-dir -r requirements.txt || (cat /root/.pip/pip.log && exit 1)

ENV FLASK_APP=app.py

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]
