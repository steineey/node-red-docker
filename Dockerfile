FROM nodered/node-red:3.0.2-minimal

# optional: copy your custom nodered settings.js
COPY ./settings.js /data/settings.js

# optional: install additional nodes to palette
RUN npm install --no-audit \
--no-update-notifier \
--no-fund \
--save \ 
--save-prefix=~ \
--omit=dev \
--engine-strict \
node-red-dashboard@3.4.0 \
node-red-contrib-mongodb4@1.10.0 \
node-red-contrib-axios@1.1.1

# overwrite entry point
ENTRYPOINT ["./entrypoint.sh"]