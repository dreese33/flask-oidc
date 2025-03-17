FROM fedorapython/fedora-python-tox:latest

# begin automated testing
COPY . .
RUN dnf install -y git python-devel python-tox
RUN pip install --upgrade "poetry>=1.2.0"
RUN git config --global --add safe.directory $PWD
RUN tox
