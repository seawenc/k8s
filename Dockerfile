FROM centos:7
RUN echo "[kubernetes]" > /etc/yum.repos.d/kubernetes.repo && \
	echo "name=Kubernetes" >> /etc/yum.repos.d/kubernetes.repo && \
	echo "baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64" >> /etc/yum.repos.d/kubernetes.repo && \
	echo "enabled=1" >> /etc/yum.repos.d/kubernetes.repo && \
	echo "gpgcheck=1" >> /etc/yum.repos.d/kubernetes.repo && \
	echo "repo_gpgcheck=1" >> /etc/yum.repos.d/kubernetes.repo && \
	echo "gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg" >> /etc/yum.repos.d/kubernetes.repo && \
	echo "exclude=kube*" >> /etc/yum.repos.d/kubernetes.repo 
RUN yum list | grep kubelet
RUN yum makecache -y
RUN yum install  --downloadonly -y kubelet-1.11.4 kubeadm-1.11.4 kubectl-1.11.4 --disableexcludes=kubernetes
