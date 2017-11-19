FROM amazonlinux

# First, make able to install Node 6.x from upstream
# Second, install Python3.6, GCC, Make and MySQL-devel for native Python modules and a CLI editor
# Third, install the serverless framework globally
# Fourth, install/upgrade pip, awscli, mysqlclient for both Python 2.7 and Python 3.6
# Fifth, clean up after ourselves
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - && \
  yum install -y python36 python36-pip gcc-c++ make mysql-devel python36-devel python27-devel python27-pip nodejs nano && \
  npm install -g serverless && \
  pip-3.6 install --no-cache-dir --upgrade pip awscli mysqlclient && \
  pip-2.7 install --no-cache-dir --upgrade pip awscli mysqlclient && \
  yum clean all

ENTRYPOINT ["/bin/bash", "-c"]
