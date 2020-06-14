# Pandas in Jupyter Notebook

## What?

A super easy way to run [Jupyter notebooks](https://jupyter-notebook.readthedocs.io/en/stable/notebook.html) with [Pandas](https://pandas.pydata.org/pandas-docs/stable/index.html) locally without installing anything.

Assumes you have Docker installed.

## How?

This project contains everything you need to build and run a custom Docker container to execute a Jupyter notebook with Pandas locally.
It is derived from the [Jupyter base notebook](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-base-notebook) Docker image.

```sh
./build.sh
./run.sh
# do some work with your notebooks
./stop.sh
```

A browser window should open automatically showing the [ExampleNotebook.ipynb](/example/ExampleNotebook.ipynb).

## Options

You can optionally specify custom directories to be mounted into the Docker container:

- `DATA_DIR`  
  mounted to `/data` inside the container  
  *(default: `$(pwd)/data`)*
- `NOTEBOOK_DIR`  
  mounted to `/notebooks` inside the container  
  *(default: `$(pwd)/example`)*

Specify the variables like this when executing `run.sh`:

```sh
$ DATA_DIR=/home/foo/someData NOTEBOOK_DIR=/home/foo/myNotebooks ./run.sh
```
