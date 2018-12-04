FROM centos:7
RUN wget https://dl.k8s.io/release/stable-1.11.txt && \
    echo 'begin.......................' && \
    cat stable-1.11.txt  && \
    echo 'end.........................'
