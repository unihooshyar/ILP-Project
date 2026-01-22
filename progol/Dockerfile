FROM gcc:4.9.4

# optional but useful
#RUN apt-get update && \
#    apt-get install -y --no-install-recommends wget make && \
#    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/progol

WORKDIR /opt/progol

RUN pwd
RUN wget -q "https://www.doc.ic.ac.uk/~shm/Software/progol5.0/progol5_0.tar.gz"
RUN tar vxzf progol5_0.tar.gz

WORKDIR /opt/progol/source

RUN pwd
RUN make

RUN mkdir -p /opt/progol/bin
RUN mv progol /opt/progol/bin

ENV PATH="/opt/progol/bin:${PATH}"

# this directory is assumed to be mounted into the container
RUN mkdir /opt/progol/examples
WORKDIR /opt/progol/examples

RUN pwd

CMD ["/bin/bash"]
