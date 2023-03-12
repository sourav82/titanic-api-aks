FROM python:3.8-slim-buster

ARG UID=1000
ARG GID=1000

RUN groupadd -g "${GID}" python \
  && useradd --create-home --no-log-init -u "${UID}" -g "${GID}" python

RUN mkdir /home/python/app 

WORKDIR /home/python/app

ADD python /home/python/app

RUN chown -R python:python /home/python/app && chmod -R 755 /home/python/app

RUN ls -l && pip install --upgrade pip && pip install -r ./requirements.txt

USER python

CMD ["python", "run.py"]
