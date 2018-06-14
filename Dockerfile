FROM amazonlinux

# Make able to install Node 6.x from upstream
# Install Python3.6 and Python2.7 with pip and devel
# Install GCC, Make and MySQL-devel, NodeJS, Nano, findutils, and libyaml for parsing .yml (serverless) via Python
# Clean-up after ourselves
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - && \
  yum install -y python36-pip python36-devel python27-devel python27-pip \
  gcc-c++ make mysql-devel nodejs nano findutils libyaml libyaml-devel git && \
  yum clean all

# Install the serverless framework globally
RUN npm install -g serverless

# Install/upgrade pip, awscli, mysqlclient for both Python 2.7 and Python 3.6
RUN pip-3.6 install --no-cache-dir --upgrade pip awscli mysqlclient pyyaml && \
  pip-2.7 install --no-cache-dir --upgrade pip awscli mysqlclient pyyaml
  
ENTRYPOINT ["/bin/bash", "-c"]
