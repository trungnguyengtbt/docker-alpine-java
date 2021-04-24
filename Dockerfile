FROM alpine:3.7

ENV GLIBC_VERSION=2.33-r0 \
    JAVA_VERSION=11 \
    JAVA_BUILD=21.1.0 \
    JAVA_HOME=/usr/lib/jvm \
    PATH=/usr/lib/jvm/bin:$PATH

RUN apk --no-cache add ca-certificates wget gcc zlib zlib-dev libc-dev

RUN mkdir /usr/lib/jvm; \
    wget "https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${JAVA_BUILD}/graalvm-ce-java${JAVA_VERSION}-linux-amd64-${JAVA_BUILD}.tar.gz" && \ 
    tar -xvf "graalvm-ce-java${JAVA_VERSION}-linux-amd64-${JAVA_BUILD}.tar.gz" && \ 
    mv -f "graalvm-ce-java${JAVA_VERSION}-${JAVA_BUILD}"/* "/usr/lib/jvm/" && \ 
    rm -f "graalvm-ce-java${JAVA_VERSION}-linux-amd64-${JAVA_BUILD}.tar.gz" && \
    rm -rf "graalvm-ce-java${JAVA_VERSION}-${JAVA_BUILD}"

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    &&  wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION/glibc-$GLIBC_VERSION.apk" \
    &&  apk --no-cache add "glibc-$GLIBC_VERSION.apk" \
    &&  rm "glibc-$GLIBC_VERSION.apk" \
    &&  wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION/glibc-bin-$GLIBC_VERSION.apk" \
    &&  apk --no-cache add "glibc-bin-$GLIBC_VERSION.apk" \
    &&  rm "glibc-bin-$GLIBC_VERSION.apk" \
    &&  wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION/glibc-i18n-$GLIBC_VERSION.apk" \
    &&  apk --no-cache add "glibc-i18n-$GLIBC_VERSION.apk" \
    &&  rm "glibc-i18n-$GLIBC_VERSION.apk"