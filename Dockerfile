FROM debian:sid

# auto retry of specific times when fail from apt command
RUN echo 'Acquire::Retries "5";' > /etc/apt/apt.conf.d/99AcquireRetries

# add new apt sources list
ADD http://httpredir.debian.org/debian/project/trace/ftp-master.debian.org /etc/trace_ftp-master.debian.org
ADD http://security.debian.org/project/trace/security-master.debian.org /etc/trace_security-master.debian.org

# run update from apt repo
RUN apt-get update && apt-get -y dist-upgrade && apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

