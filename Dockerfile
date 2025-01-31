FROM fedora:latest
CMD env

# install packit
RUN dnf copr enable packit/packit-dev
RUN dnf install packit -y
RUN sudo dnf upgrade packit -y

COPY . .
RUN dnf install pip -y
RUN dnf install pipx -y
RUN pipx install poetry
RUN pipx ensurepath
RUN source ~/.bashrc && poetry --version && packit srpm && packit validate-config .packit.yaml
