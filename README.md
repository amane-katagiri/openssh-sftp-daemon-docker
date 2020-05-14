# openssh-sftp-daemon-docker

## Run OpenSSH SSH daemon for SFTP with default host keys

```
docker run --rm -p 22222:22 -e PASSWORD="mysecretpassword" amane/openssh-sftp-daemon
```

## Run OpenSSH SSH daemon for SFTP mounted your host files

```
docker run --rm -p 22222:22 -v "/path/to/host/dir:/data" -e PASSWORD="mysecretpassword" amane/openssh-sftp-daemon
```

## Run OpenSSH SSH daemon for SFTP with your host keys

```
mkdir -p ./etc/ssh
ssh-keygen -A -f .
docker run --rm -p 22222:22 -v "$PWD"/etc/ssh:/host_keys:ro -e PASSWORD="mysecretpassword" amane/openssh-sftp-daemon
```

You can mount remote directory with SFTP by `sshfs sftp-user@localhost:/ -p22222 mnt`.
