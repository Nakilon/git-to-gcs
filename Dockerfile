FROM google/cloud-sdk:alpine
COPY main.rb /main.rb
CMD sh -c "cat /github/workflow/event.json && ls -la && apk add ruby && ruby /main.rb"
