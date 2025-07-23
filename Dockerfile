FROM mambaorg/micromamba:1.5.10-noble

cOPY --chown=$MAMBA_USER:$MAMBA_USER flair_diffexp_conda_env.yaml /tmp/conda.yml

RUN micromamba install -y -n base -f /tmp/conda.yml \
    && micromamba install -y -n base conda-forge::procps-ng \
    && micromamba env export --name base --explicit > environment.lock \
    && echo ">> CONDA_LOCK_START" \
    && cat environment.lock \
    && echo "<< CONDA_LOCK_END" \
    && micromamba clean -a -y
USER root
eNV PATH="$MAMBA_ROOT_PREFIX/bin:$PATH"

