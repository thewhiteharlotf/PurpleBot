FROM sahyam/docker:groovy

RUN git clone -b sql-extended https://github.com/thewhiteharlot/PurpleBot /root/userbot
RUN chmod 777 /root/userbot
WORKDIR /root/userbot/

EXPOSE 80 443

RUN pip3 install  -r https://raw.githubusercontent.com/thewhiteharlot/purplebot/sql-extended/requirements.txt --upgrade pip

CMD ["python3","-m","userbot"]