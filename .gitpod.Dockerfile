
FROM swift AS build

USER gitpod
FROM gitpod/workspace-full
COPY --from=build /usr/bin/swiftc /usr/bin/

# Install Swift dependencies
RUN sudo apt-get update -q && \
    sudo apt-get install -yq libtinfo5 \
        libcurl4-openssl-dev \
        libncurses5 \
        libpython2.7 \
        libatomic1 \
        libcurl4 \
        libxml2 \
        libedit2 \
        libsqlite3-0 \
        libc6-dev \
        binutils \
        libpython2.7 \
        tzdata \
        git \
        pkg-config \
    && sudo rm -rf /var/lib/apt/lists/*

# Install Swift
RUN mkdir -p /home/gitpod/.swift && \
    cd /home/gitpod/.swift && \
    curl -fsSL https://swift.org/builds/swift-5.2-release/ubuntu1804/swift-5.2-RELEASE/swift-5.2-RELEASE-ubuntu18.04.tar.gz | tar -xzv
ENV PATH="$PATH:/home/gitpod/.swift/swift-5.2-RELEASE-ubuntu18.04/usr/bin"

# Install jakeheis / Ice
RUN mkdir -p $HOME/ice && git clone https://github.com/jakeheis/Ice $HOME/ice
WORKDIR $HOME/ice
RUN swift build -c release
RUN sudo cp -f $HOME/ice/.build/release/ice /usr/local/bin

# Install vknabel / sourcekite
RUN mkdir -p $HOME/sourcekite && git clone https://github.com/vknabel/sourcekite $HOME/sourcekite
WORKDIR $HOME/sourcekite
RUN swift build -c release
RUN sudo cp -f $HOME/sourcekite/.build/release/sourcekite /usr/local/bin