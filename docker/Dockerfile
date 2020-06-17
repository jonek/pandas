FROM jupyter/base-notebook:latest

RUN conda install \
  pandas \
  xlrd \
  matplotlib \
  jupyter_contrib_nbextensions \
  jupytext

RUN jupyter nbextension enable --py jupytext
RUN jupyter nbextension enable python-markdown/main