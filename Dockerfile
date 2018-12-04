FROM centos:7
RUN yum makecache -y && yum install wget -y
RUN wget https://dl.k8s.io/release/stable-1.11.txt && \
    echo 'begin.......................' && \
    cat stable-1.11.txt  && \
    echo 'end.........................'
