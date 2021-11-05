FROM mono:latest

RUN apt update
RUN apt install -y curl
RUN apt install -y unzip

WORKDIR /shogi
RUN curl -LO http://shogigui.siganus.com/shogigui/ShogiGUIv0.0.7.24.zip && \
  unzip ShogiGUIv0.0.7.24 && \
  rm ShogiGUIv0.0.7.24.zip