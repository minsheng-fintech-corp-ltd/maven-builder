FROM mskj/java11-base:latest
ARG cnb_uid=1000
ARG cnb_gid=1000

LABEL "io.buildpacks.stack.id"="mskj.cmbc.com.cn.java11"

ENV CNB_USER_ID=${cnb_uid}
ENV CNB_GROUP_ID=${cnb_gid}
ENV PATH=$PATH:/root/.sdkman/candidates/maven/current/bin/
ENV PATH=$PATH:/root/.sdkman/candidates/gradle/current/bin/

RUN set -o pipefail\
 && apk add --no-cache zip curl \
 && addgroup cnb --gid ${cnb_gid} \
 && adduser  cnb -u ${cnb_uid} -D -S -s /bin/bash -G cnb \
 && curl -s "https://get.sdkman.io" | bash \
 && bash -c "set -o pipefail \
            && source /root/.sdkman/bin/sdkman-init.sh \
            && echo 'sdkman_auto_answer=true' > $SDKMAN_DIR/etc/config \
            && sdk version \
            && sdk install maven \
            && sdk install gradle \
            && sdk flush broadcast\
            && sdk flush archives\
            && sdk flush temp" \
 && sh -c "mvn -version" \
 && sh -c "gradle -version"
