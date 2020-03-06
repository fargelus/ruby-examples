FROM ruby:2.7-alpine

ENV SRC_PATH /app
RUN mkdir -p $SRC_PATH
WORKDIR $SRC_PATH

COPY . .
EXPOSE 8080
CMD ["ruby", "main.rb"]
