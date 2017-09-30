FROM phusion/baseimage
RUN apt-get update \
  && apt-get install -y \
  && apt-get install -y python-pip python-dev build-essential
COPY dashboard /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["host_funcs.py"]
