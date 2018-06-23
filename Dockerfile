FROM szymonrychu/ros-melodic-base:latest

USER root

RUN apt-get update && \
    apt-get install -y \
        freenect \
        ros-melodic-rgbd-launch \
        build-essential

COPY build_entrypoint.sh /build_entrypoint.sh
RUN chmod +x /build_entrypoint.sh

USER ros

VOLUME /build

ENTRYPOINT ["/build_entrypoint.sh"]