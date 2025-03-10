FROM nvcr.io/nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

# Required for Python 3.10
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update

# Install Python 3.10 and other necessary dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    python3.10 \
    python3.10-dev \
    python3.10-venv \
    python3.10-distutils \
    libgl1-mesa-glx \
    libglib2.0-0 \
    git \
    unzip \
    tar \
    && rm -rf /var/lib/apt/lists/* && apt-get clean

# Install pip
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

# Set Python 3.10 as the default python version
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# Create and activate a virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN echo 'source /opt/venv/bin/activate' >> ~/.bashrc

# pytorch
RUN pip install torch==2.1.1 torchvision==0.16.1 torchaudio==2.1.1 --index-url https://download.pytorch.org/whl/cu118

COPY requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /home