FROM python:3.12-slim

LABEL maintainer="Henry Zhu <daya0576@gmail.com>"

COPY requirements.txt .

# libsass requires some features introduced by the recent C++ standard. 
# You need a C++ compiler that support those features. 
RUN apt-get update \
    && apt-get install -y gcc g++ libffi-dev \
    && pip install --no-cache-dir -r requirements.txt \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove gcc g++ libffi-dev

COPY . .
CMD ["sh", "start.sh", "prd"]
