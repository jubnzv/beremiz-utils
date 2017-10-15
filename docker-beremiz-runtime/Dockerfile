FROM python:2.7

WORKDIR /opt/beremiz_runtime/

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "/opt/beremiz_runtime/Beremiz_service.py", "-x0", "-t0"]
