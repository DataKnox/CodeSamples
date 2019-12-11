FROM ubuntu:18.04

MAINTAINER Knox Hutchinson "khutchinson@cbtnuggets.com"

RUN apt-get update -y && apt-get install -y python3-pip python3-dev

CMD ["ufw allow 5000"]

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY ./myAPI/myAPI.py /app

ENTRYPOINT ["python3"]

CMD ["myAPI.py"]