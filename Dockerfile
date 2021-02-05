FROM kenhv/kensurbot:alpine

RUN mkdir /PurpleBot && chmod 777 /PurpleBot
ENV PATH="/PurpleBot/bin:$PATH"
WORKDIR /PurpleBot

RUN git clone https://github.com/thewhiteharlot/PurpleBot -b sql-extended /PurpleBot

COPY ./sample_config.env ./userbot.session* ./config.env* /PurpleBot/

EXPOSE 80 443

RUN pip3 install  -r https://raw.githubusercontent.com/thewhiteharlot/purplebot/sql-extended/requirements.txt --upgrade pip

CMD ["python3","-m","userbot"]