FROM python:3.7-slim

RUN apt-get update \
&& apt-get install -y --no-install-recommends git

COPY . .
# COPY root/kserve to container dir
COPY /mnt/c/local-development/kserve/python .
RUN pip install -e ./kserve
RUN pip install --no-cache-dir --upgrade pip
# RUN pip install --no-cache-dir kfserving==0.5.1
RUN pip install --no-cache-dir kfserve
RUN pip install --no-cache-dir -e .
ENTRYPOINT ["python", "-m", "image_transformer"]
