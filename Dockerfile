FROM mono:latest

RUN apt-get update && \
  apt-get install -y \
  libgtk2.0-dev \
  wget unzip

RUN export uid=1000 gid=1000 && \
  mkdir -p /home/shogi && \
  mkdir -p /etc/sudoers && \
  echo "shogi:x:${uid}:${gid}:Developer,,,:/home/shogi:/bin/bash" >> /etc/passwd && \
  echo "shogi:x:${uid}:" >> /etc/group && \
  echo "shogi ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers/shogi && \
  chmod 0440 /etc/sudoers/shogi && \
  chown ${uid}:${gid} -R /home/shogi

RUN chmod uog+rw /etc/mono/registry
RUN rm -Rf ~/.config/.mono

ENV HOME "/home/shogi"

WORKDIR /home/shogi
RUN wget http://shogigui.siganus.com/shogigui/ShogiGUIv0.0.7.27.zip && \
  unzip ShogiGUIv0.0.7.27.zip && \
  rm ShogiGUIv0.0.7.27.zip

USER shogi
WORKDIR /home/shogi/ShogiGUI
ENTRYPOINT [ "/usr/bin/mono" ]
CMD [ "ShogiGUI.exe" ]
