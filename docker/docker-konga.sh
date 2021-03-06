#!/bin/bash

#docker run -p 1337:1337 \
#             --network {{kong-network}} \ // optional
#             --name konga \
#             -e "NODE_ENV=production" \ // or "development" | defaults to 'development'
#             -e "TOKEN_SECRET={{somerandomstring}}" \
#             pantsel/konga


# https://hub.docker.com/r/pantsel/konga


docker run -p 1337:1337 \
             --name konga \
             -e "NODE_ENV=production" \
             -e "TOKEN_SECRET=btlab16*" \
             pantsel/konga
