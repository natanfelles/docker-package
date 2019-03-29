FROM natanfelles/php-base
RUN apt-get update \
	&& apt-get -y --no-install-recommends install \
	bash-completion \
	sudo \
	vim \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*; \
	useradd -rm \
		-d /home/developer \
		-g root -G sudo \
		-s /bin/bash \
		-p $(openssl passwd -1 "password") \
		-u 1000 developer
COPY --chown=1000 home /home/developer
USER developer
CMD ["bash"]
