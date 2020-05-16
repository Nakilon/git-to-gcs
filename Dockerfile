FROM google/cloud-sdk:alpine
COPY main.rb /main.rb
CMD sh -c "env && pwd && ls -l /github/home && ls -l /github/workflow && ls -l /github/workspace && apk add ruby && ruby main.rb"
