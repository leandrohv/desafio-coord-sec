FROM python:3.8.3-alpine

RUN python -m pip install --upgrade pip

RUN adduser -D venancio

USER venancio

WORKDIR /home/venancio/app

RUN export PATH="$PATH:$HOME/.local/bin" && echo $PATH && pwd 


# RUN python -m pip install requests

COPY --chown=venancio:venancio requirements.txt ./requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app/main.py"]