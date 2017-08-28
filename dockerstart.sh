#!/bin/bash
set -e 

USER_UID=${USER_UID:-1000}
USER_GID=${USER_GID:-1000}


# create user group
if ! getent group firefox >/dev/null; then
	groupadd -f -g ${USER_GID} firefox
fi

# create user with uid and gid matching that of the host user
if ! getent passwd firefox >/dev/null; then
	adduser --uid ${USER_UID} --gid ${USER_GID} \
		--disabled-login \
		--gecos 'Firefox' firefox
fi

#changing the user to firefox
su firefox

#opening new browser instance with url
exec firefox $URL
