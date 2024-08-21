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

# Install pertpy
RUN pip install pertpy[de]
