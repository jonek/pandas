# Pandas in Jupyter Notebook

## What?

A super easy way to run [Jupyter notebooks](https://jupyter-notebook.readthedocs.io/en/stable/notebook.html) with [Pandas](https://pandas.pydata.org/pandas-docs/stable/index.html) locally without installing anything.

## How?

This project contains everything you need to build and run a custom Docker container to execute a Jupyter notebook with Pandas locally.
It is derived from the [Jupyter base notebook](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-base-notebook) Docker image.

```sh
./build.sh
./run.sh
```

Now point your browser to `http://localhost:8088`.
