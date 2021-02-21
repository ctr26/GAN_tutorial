# For the latest tag, see: https://hub.docker.com/r/jupyter/datascience-notebook/tags/
FROM jupyter/minimal-notebook

# GPU powered ML
# ----------------------------------------
RUN conda install -c conda-forge --yes --quiet \
    tensorflow-gpu \
    cudatoolkit=10.1 && \
    conda clean -tipsy

# Allow drivers installed by the nvidia-driver-installer to be located
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/nvidia/lib64
# Also, utilities like `nvidia-smi` are installed here
ENV PATH=${PATH}:/usr/local/nvidia/bin
