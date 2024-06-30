FROM steamcmd/steamcmd:debian
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt upgrade -y && apt install -y libxi6 xvfb && rm -rf /var/lib/apt/lists/*
RUN steamcmd +login anonymous +app_update 1007 validate +app_update 1963720 validate +quit
EXPOSE 27015/udp
EXPOSE 27016/udp
ENTRYPOINT ["/root/.local/share/Steam/steamapps/common/Core Keeper Dedicated Server/_launch.sh"]
