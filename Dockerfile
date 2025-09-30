FROM ruby:3.3.4-bullseye

# RUN cat /etc/os-release && sleep 10

ENV DEBIAN_FRONTEND=noninteractive

ENV HOME=/var/www
ENV APP_HOME=$HOME/decidim-ddgi

# Force Madrid's timezone
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install system dependencies
RUN apt --allow-releaseinfo-change update
RUN apt update -qq
RUN apt install -y \
    build-essential \
    graphviz \
    imagemagick \
    libicu-dev \
    libpq-dev \
    gettext-base \
    tzdata \
    vim \
    locales
RUN apt install -y p7zip
RUN apt install -y ca-certificates

RUN apt install -y --no-install-recommends libjemalloc2
ENV LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so.2
ENV MALLOC_CONF='dirty_decay_ms:1000,narenas:2,background_thread:true'

# Locales configuration
# RUN locale-gen en_US.UTF-8
# ENV LANG=en_US.UTF-8
# ENV LANGUAGE=en_US:en
# ENV LC_ALL=en_US.UTF-8

# Install wkhtmltopdf
RUN apt install -y xfonts-base xfonts-75dpi
RUN curl "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.bullseye_amd64.deb" -L -o "wkhtmltox_0.12.6.1-2.bullseye_amd64.deb"
RUN dpkg -i wkhtmltox_0.12.6.1-2.bullseye_amd64.deb

# Define volumes
VOLUME $APP_HOME/storage
VOLUME $APP_HOME/log

# Configure init scripts
RUN mkdir -p /etc/my_init.d
ADD docker/init.d/fix_permissions.sh /etc/my_init.d/fix_permissions.sh
##########ADD docker/init.d/delayed_job.sh /etc/my_init.d/delayed_job.sh
RUN chmod +x /etc/my_init.d/*.sh

##############################
# Update Ruby ecosystem
##############################
RUN gem update --system 3.3.22 && update_rubygems
RUN gem install bundler:2.6.5 \
 && gem install stringio:3.1.7

##############################
# Install NodeJs & Yarn
##############################
ENV NODE_VERSION=18.17.1
RUN apt update
RUN apt -y install curl gnupg
RUN curl -fsSL https://deb.nodesource.com/node_18.x/pool/main/n/nodejs/nodejs_18.17.1-1nodesource1_amd64.deb -o nodejs_18.17.1.deb \
 && dpkg -i nodejs_18.17.1.deb \
 && rm nodejs_18.17.1.deb
RUN npm -v
RUN npm install -g yarn

##############################
# Prepare working directory & other configurations
##############################

# Create app dir
RUN mkdir -p $APP_HOME
RUN mkdir -p $APP_HOME/tmp

WORKDIR $APP_HOME
RUN chown -R www-data:www-data $HOME
RUN chown -R www-data:www-data $APP_HOME
RUN chown -R www-data:www-data /var/www/.npm

##############################
# Copy app code into docker image
##############################
ADD . $APP_HOME
RUN rm -Rf tmp/*
#RUN rm -Rf docker/*
RUN chown -R www-data:www-data $APP_HOME

USER www-data
ENV RAILS_ENV=production
WORKDIR $APP_HOME

##############################
# Install Node dependencies
##############################
RUN rm -Rf node_modules/ && npm cache clean --force

# COPY ./package.json $APP_HOME/package.json
# COPY ./packages/ $APP_HOME/packages/
RUN npm install

# ##############################
# # Install Bundler dependencies
# ##############################

# ADD Gemfile Gemfile
# ADD Gemfile.lock Gemfile.lock

RUN bundle config --without development test \
 && bundle config set deployment 'true' \
 && bundle install --jobs=10

# ##############################
# # Build app
# ##############################
ENV DISABLE_SPRING=1
RUN RAILS_ENV=production SECRET_KEY_BASE=WHATEVER DOCKER=1 bundle exec rake shakapacker:clobber shakapacker:compile

# make sure nothing gets leacked
RUN rm config/application.yml
RUN touch config/application.yml

# Add a tmp folder for pids
RUN mkdir -p tmp/pids

##############################
# Clean up APT and bundler when done.
##############################
USER root
RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*.
USER www-data

##############################
# RUN image as www-data
##############################
#################RUN chown -R www-data:www-data $APP_HOME
USER www-data
WORKDIR $APP_HOME

# Print the UID and GID (only one CMD is allowed in a Dockerfile, it executes when the container starts)
CMD ["sh", "-c", "echo 'Inside Container:' && echo 'User: `$(whoami)` UID: `$(id -u)` GID: `$(id -g)`'"]
