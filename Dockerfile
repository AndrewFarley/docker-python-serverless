FROM amazonlinux

# Make able to install Node 6.x from upstream
# Install Python3.6 and Python2.7 with pip and devel
# Install GCC, Make and MySQL-devel, NodeJS, Nano, findutils, and libyaml for parsing .yml (serverless) via Python
# Clean-up after ourselves
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - && \
  yum install -y python3-pip python3-devel python2-devel python2-pip gcc-c++ make mysql-devel nodejs nano findutils libyaml libyaml-devel git && \
  yum clean all && rm -rf /var/cache/yum

# Install the serverless framework globally
RUN npm install -g serverless

# Install/upgrade pip, awscli, mysqlclient for both Python 2.7 and Python 3.6
RUN ls -la /usr/local/bin
RUN find / -iname "pip*"

RUN pip-3 install --no-cache-dir --upgrade pip awscli mysqlclient pyyaml && \
  pip-2 install --no-cache-dir --upgrade pip awscli mysqlclient pyyaml
  
ENTRYPOINT ["/bin/bash", "-c"]
