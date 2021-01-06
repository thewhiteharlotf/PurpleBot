FROM movecrew/one4ubot:alpine-latest

RUN mkdir /PurpleBot && chmod 777 /PurpleBot
ENV PATH="/PurpleBot/bin:$PATH"
WORKDIR /PurpleBot

RUN git clone https://github.com/thewhiteharlot/PurpleBot -b sql-extended /PurpleBot

#
# Copies session and config(if it exists)
#
COPY ./sample_config.env ./userbot.session* ./config.env* /PurpleBot/

#
# Make open port TCP
#
EXPOSE 80 443


RUN pip3 install  -r https://raw.githubusercontent.com/thewhiteharlot/purplebot/sql-extended/requirements.txt


#
# Finalization
#
CMD ["python3","-m","userbot"]