FROM ubuntu:18.04
RUN apt-get update && apt-get install -y gcc zlib1g-dev wget

RUN wget -O graalvm.tar.gz https://github.com/oracle/graal/releases/download/vm-1.0.0-rc2/graalvm-ce-1.0.0-rc2-linux-amd64.tar.gz \
 && tar -xzf graalvm.tar.gz \
 && rm graalvm.tar.gz
ENV PATH /graalvm-ce-1.0.0-rc2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
WORKDIR /graalvm-demo
COPY . /graalvm-demo
RUN ./gradlew nativeImage

FROM alpine
WORKDIR /graalvm-demo
COPY --from=0 /graalvm-demo/app .
EXPOSE 4567
CMD ./app