# Use a lightweight base image with Java pre-installed
FROM docker.io/library/openjdk:11-jre-slim

# Set environment variables
ENV SQLCL_VERSION=latest \
    SQLCL_HOME=/opt/sqlcl

# Create a directory for SQLcl
WORKDIR $SQLCL_HOME

# Install unzip utility to extract SQLcl and postgresql-client for data transfer
RUN apt-get update && apt-get install -y --no-install-recommends curl unzip postgresql-client && \
apt-get clean && rm -rf /var/lib/apt/lists/* && echo "APT cache cleaned successfully"

RUN curl -s \
    https://download.oracle.com/otn_software/java/sqldeveloper/sqlcl-${SQLCL_VERSION}.zip \
    > $SQLCL_HOME/sqlcl-${SQLCL_VERSION}.zip

RUN unzip sqlcl-${SQLCL_VERSION}.zip && \
rm sqlcl-${SQLCL_VERSION}.zip && \
chmod +x $SQLCL_HOME/sqlcl/bin/sql

# Add SQLcl to PATH
ENV PATH=$SQLCL_HOME/sqlcl/bin:$PATH

# Optionally set a new working directory
WORKDIR /work

ENTRYPOINT ["sql"]

# The "/nolog" argument starts SQLcl without logging into a database by default
CMD ["/nolog"]
