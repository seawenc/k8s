FROM centos:7
RUN echo "[kubernetes]" > /etc/yum.repos.d/kubernetes.repo && \
	echo "name=Kubernetes" > /etc/yum.repos.d/kubernetes.repo && \
	echo "baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64" > /etc/yum.repos.d/kubernetes.repo && \
	echo "enabled=1" > /etc/yum.repos.d/kubernetes.repo && \
	echo "gpgcheck=1" > /etc/yum.repos.d/kubernetes.repo && \
	echo "repo_gpgcheck=1" > /etc/yum.repos.d/kubernetes.repo && \
	echo "gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg" > /etc/yum.repos.d/kubernetes.repo && \
	echo "exclude=kube*" > /etc/yum.repos.d/kubernetes.repo 

RUN setenforce 0 && \
    sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config && \
    yum makecache && \
    yum install  --downloadonly -y kubelet kubeadm kubectl --disableexcludes=kubernetes
