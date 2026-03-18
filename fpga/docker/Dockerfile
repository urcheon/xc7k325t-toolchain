# ==============================================================================
# Stage 1: Builder - Build tools from source
# ==============================================================================
FROM ubuntu:22.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive
ENV LLVM_VERSION=19.1.0

# ------------------------------------------------------------------------------
# Install Build Dependencies & Repositories
# ------------------------------------------------------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    gnupg \
    ca-certificates \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Add LLVM repository for clang-16 (Required for Bambu)
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    echo "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-16 main" >> /etc/apt/sources.list

# Add GCC repository (Required for GCC-10 plugin headers)
RUN add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update

# Universal build toolchain - used by everything below
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    cmake \
    ninja-build \
    curl \
    wget \
    pkg-config \
    unzip \
    python3 \
    python3-pip \
    python3-dev \
    bison \
    flex \
    libfl-dev \
    gperf \
    libtool \
    automake \
    autoconf \
    autoconf-archive \
    texinfo \
    clang-16 \
    lld-16 \
    llvm-16 \
    llvm-16-dev \
    llvm-16-tools \
    libclang-16-dev \
    g++-10 \
    gcc-10 \
    g++-10-multilib \
    gcc-10-multilib \
    gcc-10-plugin-dev \
    libstdc++-10-dev \
    && rm -rf /var/lib/apt/lists/*

# Python packages for build scripts
RUN pip3 install --no-cache-dir \
    pyyaml \
    mako \
    click \
    simplejson \
    fasm \
    intervaltree \
    python-utils \
    progressbar2

# ------------------------------------------------------------------------------
# Build Bambu HLS (From Source)
# ------------------------------------------------------------------------------

# Bambu-specific deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    libboost-all-dev \
    libeigen3-dev \
    libreadline-dev \
    libffi-dev \
    zlib1g-dev \
    tcl-dev \
    libtinfo5 \
    libbdd-dev \
    libxml2-dev \
    libmpfr-dev \
    libmpc-dev \
    libgmp-dev \
    libssl-dev \
    libsuitesparse-dev \
    libblas-dev \
    liblapack-dev \
    libglpk-dev \
    liblzma-dev \
    libexpat1-dev \
    libedit-dev \
    swig \
    libncurses5-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN git clone https://github.com/ferrandi/PandA-bambu.git

COPY Kintex-7-VVD.xml /opt/PandA-bambu/etc/devices/Xilinx_devices
COPY xc7k325t-1ffg676-VVD.xml /opt/PandA-bambu/etc/devices/Xilinx_devices
COPY xc7k325t-1ffg676-VVD-seed.xml /opt/PandA-bambu/etc/devices/Xilinx_devices
COPY panda.diff /opt/PandA-bambu

RUN cd PandA-bambu && \
    git submodule update --init --recursive && \
    patch -p0 < panda.diff && \
    make -f Makefile.init && \
    mkdir build && cd build && \
    CC=clang-16 CXX=clang++-16 ../configure --prefix=/opt/bambu \
      --disable-flopoco \
      --disable-sollya \
      --enable-release \
      --with-opt-level=fast && \
    make -j$(nproc) && \
    make install

RUN mkdir -p /opt/bambu/etc && \
    cp -r PandA-bambu/etc/devices /opt/bambu/etc && \
    cp -r PandA-bambu/etc/scripts /opt/bambu/etc && \
    cp -r PandA-bambu/etc/lib /opt/bambu/etc && \
    gzip -c /opt/bambu/etc/devices/Xilinx_devices/Kintex-7-VVD.xml > /opt/bambu/share/panda/wrapper/synthesis/xilinx/Kintex-7-VVD.data && \
    gzip -c /opt/bambu/etc/devices/Xilinx_devices/xc7k325t-1ffg676-VVD.xml > /opt/bambu/share/panda/technology/xc7k325t-1ffg676-VVD.data

# ------------------------------------------------------------------------------
# Build Yosys (From Source)
# ------------------------------------------------------------------------------

# Yosys-specific deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    libtbb-dev \
    libgoogle-perftools-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN git clone --recursive https://github.com/YosysHQ/yosys.git && \
    cd yosys && \
    git submodule update --init --recursive && \
    make -j$(nproc) && \
    make install

# ------------------------------------------------------------------------------
# Build Project X-Ray (prjxray)
# ------------------------------------------------------------------------------

# prjxray has no deps beyond the universal toolchain

WORKDIR /build
RUN git clone https://github.com/f4pga/prjxray.git && \
    cd prjxray && \
    git submodule update --init --recursive

WORKDIR /build/prjxray/build
RUN cmake -DCMAKE_INSTALL_PREFIX=/usr/local -Wno-dev .. && \
    make -j$(nproc) && \
    make install

WORKDIR /build/prjxray
RUN cp build/tools/xc7frames2bit build/tools/bitread build/tools/xc7patch /usr/local/bin/ && \
    cp utils/fasm2frames.py /usr/local/bin/fasm2frames && \
    cp utils/bit2fasm.py /usr/local/bin/bit2fasm && \
    chmod +x /usr/local/bin/fasm2frames /usr/local/bin/bit2fasm && \
    mkdir -p /usr/local/lib/python3.10/site-packages/prjxray && \
    cp -r prjxray/* /usr/local/lib/python3.10/site-packages/prjxray/

# ------------------------------------------------------------------------------
# Build Nextpnr-xilinx
# ------------------------------------------------------------------------------

# nextpnr has no deps beyond the universal toolchain + boost (pulled in by Bambu above)

WORKDIR /build
RUN git clone https://github.com/openXC7/nextpnr-xilinx.git && \
    cd nextpnr-xilinx && \
    git submodule update --init --recursive

RUN mkdir -p /usr/local/share/nextpnr/external/prjxray-db && \
    cp -r /build/nextpnr-xilinx/xilinx/external/prjxray-db/* /usr/local/share/nextpnr/external/prjxray-db/

WORKDIR /build/nextpnr-xilinx/build
RUN cmake -DARCH=xilinx \
          -DBUILD_GUI=OFF \
          -DBUILD_TESTS=OFF \
          -DUSE_OPENMP=ON \
          -DCMAKE_INSTALL_PREFIX=/usr/local \
          .. && \
    make -j$(nproc) && \
    make install

# ------------------------------------------------------------------------------
# Generate ChipDB for Kintex-7
# ------------------------------------------------------------------------------
WORKDIR /build/nextpnr-xilinx
ENV PYTHONPATH="${PYTHONPATH}:/build/nextpnr-xilinx/xilinx/python:/usr/local/lib/python3.10/site-packages"

RUN python3 xilinx/python/bbaexport.py \
    --device xc7k325tffg676-1 \
    --bba xc7k325tffg676.bba && \
    build/bbasm -l xc7k325tffg676.bba xc7k325tffg676.bin && \
    mkdir -p /usr/local/share/nextpnr/external/prjxray-db/kintex7/ && \
    cp xc7k325tffg676.bin /usr/local/share/nextpnr/external/prjxray-db/kintex7/

# ------------------------------------------------------------------------------
# Build openFPGALoader
# ------------------------------------------------------------------------------

# openFPGALoader-specific deps
RUN apt-get update && apt-get install -y --no-install-recommends \
    libftdi1-dev \
    libusb-1.0-0-dev \
    libudev-dev \
    libhidapi-dev \
    libgpiod-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
RUN git clone https://github.com/trabucayre/openFPGALoader.git && \
    cd openFPGALoader && \
    git submodule update --init --recursive && \
    mkdir build && cd build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
    make -j$(nproc) && \
    make install

# ------------------------------------------------------------------------------
# Prepare Python packages for Runtime
# ------------------------------------------------------------------------------
RUN mkdir -p /opt/python-packages && \
    pip3 install --target=/opt/python-packages --no-compile \
      pyyaml \
      mako \
      click \
      simplejson \
      intervaltree && \
     pip3 install --target=/opt/python-packages --no-compile \
       --no-binary fasm \
       fasm

# ==============================================================================
# Stage 2: Runtime - Minimal image with only runtime dependencies
# ==============================================================================
FROM ubuntu:22.04 AS runtime

ENV DEBIAN_FRONTEND=noninteractive

# Setup Repositories
# We add the repos just in case minor updates are needed, but we try not to install dev tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    gnupg \
    ca-certificates \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Add LLVM repository for clang-16 (Required for Bambu)
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    echo "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-16 main" >> /etc/apt/sources.list

# Add GCC repository (Required for GCC-10 plugin headers)
RUN add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update

# Install Runtime Dependencies (ONLY SHARED LIBRARIES)
# STRICTLY NO -dev packages, NO pip, NO llvm/clang metapackages that pull headers
RUN apt-get update && apt-get install -y --no-install-recommends \
    clang-16 \
    lld-16 \
    llvm-16 \
    llvm-16-dev \
    llvm-16-tools \
    libclang-16-dev \
    g++-10 \
    gcc-10 \
    g++-10-multilib \
    gcc-10-multilib \
    gcc-10-plugin-dev \
    libstdc++-10-dev \
    python3 \
    binutils \
    libpython3.10 \
    libgcc-s1 \
    libstdc++6 \
    libboost-filesystem1.74.0 \
    libboost-program-options1.74.0 \
    libboost-iostreams1.74.0 \
    libboost-system1.74.0 \
    libboost-thread1.74.0 \
    libboost-python1.74.0 \
    libboost-regex1.74.0 \
    libboost-graph1.74.0 \
    libgomp1 \
    zlib1g \
    libreadline8 \
    libffi8 \
    libtinfo5 \
    libbdd-dev \
    tcl \
    libmpfr6 \
    libgmp10 \
    libmpc3 \
    libxml2 \
    libtbb12 \
    libusb-1.0-0 \
    libudev1 \
    libhidapi-hidraw0 \
    libgpiod2 \
    graphviz \
    xdot \
    make \
    less \
    vim \
    libnss-wrapper \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    locales \
    && locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Copy Python packages (Installed in builder to /opt/python-packages)
COPY --from=builder /opt/python-packages /usr/local/lib/python3.10/dist-packages
COPY --from=builder /usr/local/lib/python3.10/site-packages/prjxray /usr/local/lib/python3.10/dist-packages/prjxray

# Copy Bambu HLS
COPY --from=builder /opt/bambu /opt/bambu

# Copy Yosys & Nextpnr & PrjXray Tools & openFPGALoader
COPY --from=builder /usr/local/bin/yosys* /usr/local/bin/
COPY --from=builder /usr/local/bin/nextpnr* /usr/local/bin/
COPY --from=builder /usr/local/bin/xc7* /usr/local/bin/
COPY --from=builder /usr/local/bin/bit* /usr/local/bin/
COPY --from=builder /usr/local/bin/fasm* /usr/local/bin/
COPY --from=builder /usr/local/bin/openFPGALoader /usr/local/bin/

# Copy Share directories
COPY --from=builder /usr/local/share/yosys /usr/local/share/yosys
COPY --from=builder /usr/local/share/nextpnr /usr/local/share/nextpnr

# Final Configuration
# Add LLVM/Clang and Bambu to PATH and library paths
ENV PATH="/usr/lib/llvm-16/bin:/opt/bambu/bin:/usr/local/bin:${PATH}"
ENV LD_LIBRARY_PATH="/usr/lib/llvm-16/lib/:${LD_LIBRARY_PATH}"
ENV PRJXRAY_DB_DIR="/usr/local/share/nextpnr/external/prjxray-db"

# Version check file
WORKDIR /work
RUN echo "=== HLS & FPGA Toolchain (Source Build - Clean Runtime) ===" > /work/VERSIONS.txt && \
    echo "Bambu HLS: $(bambu --version 2>&1 | head -n1)" >> /work/VERSIONS.txt && \
    echo "Yosys: $(yosys -V)" >> /work/VERSIONS.txt && \
    echo "Nextpnr-Xilinx: $(nextpnr-xilinx --version)" >> /work/VERSIONS.txt && \
    echo "Clang: $(clang --version | head -n1)" >> /work/VERSIONS.txt && \
    echo "openFPGALoader: $(openFPGALoader --version 2>&1 | head -n1)" >> /work/VERSIONS.txt

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
