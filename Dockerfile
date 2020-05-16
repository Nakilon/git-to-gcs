FROM google/cloud-sdk:alpine
COPY main.rb /main.rb
CMD sh -c "apk add ruby && ruby /main.rb"
