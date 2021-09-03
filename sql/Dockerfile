FROM mcr.microsoft.com/mssql/server:2019-latest
RUN mkdir -p /usr/work
WORKDIR /usr/work
COPY . /usr/work/

EXPOSE 1433

CMD /bin/bash ./entrypoint.sh