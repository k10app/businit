FROM alpine
RUN apk add curl openssl &&\
 mkdir /businit &&\
 curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" &&\
 chmod +x kubectl && mv kubectl /bin/kubectl
WORKDIR /businit
ENV TARGET_NAMESPACE=k10app
COPY ["businit.sh", "/businit/businit.sh"]
ENTRYPOINT [ "/businit/businit.sh" ]
