FROM gcfntnu/scanpy:latest

# Install jupyter lab
RUN mamba install --yes \
    jupyterlab \
    readline \
    simplegeneric \
    ipywidgets  \
    r-argparse \
    r-biocmanager \
    plotly \
    plotly-orca \
    dash-table \
    dash \
    jupyterlab-dash \
    colorlover \
    r-plotly \
    r-devtools \
    r-tidyverse \
    rpy2 && \
    mamba clean --all

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager plotlywidget
    
RUN jupyter lab build

# Fix dependencies issues for pertpy
RUN pip install numba==0.57.0 numpy==1.24.1 chex==0.1.86 optax==0.2.3 jaxlib==0.4.30 numexpr==2.8.4

# Install pertpy
RUN pip install pertpy[de]
RUN pip install pertpy[coda]

# Install bin2cell
RUN pip install bin2cell
