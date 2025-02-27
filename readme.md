# install

```bash
sudo apt update
sudo apt install docker.io -y
sudo apt install docker-compose -y
sudo systemctl enable --now docker
```

# access rights

```bash
sudo usermod -aG docker $USER
```

# build

Create proper Dockerfile local:

```bash
docker build --no-cache -t devcon .
```

Create docker image for ghcr.io:

Organisation / user name: emblincram.
Image name: devcon.

```bash
echo "${CR_PAT}" | docker login ghcr.io -u emblincram --password-stdin
docker build -t ghcr.io/emblinkram/devcon:latest .
docker push ghcr.io/emblinkram/devcon:latest
```

Load and use docker image:

```bash
docker pull ghcr.io/emblincram/devcon:latest
docker run -it --rm ghcr.io/emblincram/devcon:latest /bin/bash
```

Remove obsolete image:

```bash
docker rmi <IDENTIFIER>
```
