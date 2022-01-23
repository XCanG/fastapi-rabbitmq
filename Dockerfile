FROM rabbitmq:3.8
EXPOSE 4369 5671 5672 25672
# RUN rabbitmq-plugins enable --offline rabbitmq_management
CMD ["rabbitmq-server"]

FROM python:3.9-alpine
WORKDIR /code
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY *.py /code/
RUN python listener.py
CMD ["uvicorn", "api:app", "--host", "0.0.0.0", "--port", "80"]
