FROM python:3.8.6-alpine3.12
LABEL Author="loca1h0st<chenjh.network@gmail.com>"
ENV TIMEZONE Asia/Shanghai

COPY ./www /var/www
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && apk add gcc g++ make libffi-dev rust cargo openssl-dev && \
    echo ${TIMEZONE} > /etc/timezone && \
    pip install --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install -r /var/www/requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

ENTRYPOINT [ "/usr/local/bin/python", "/var/www/run.py" ]