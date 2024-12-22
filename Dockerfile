FROM hashicorp/tfc-agent:latest

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils apt-transport-https ca-certificates curl gpg gnupg python3 python3-pip && \
    apt-get clean

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    apt-get update && \
    apt-get install -y google-cloud-cli google-cloud-cli-gke-gcloud-auth-plugin && \
    apt-get clean

USER tfc-agent