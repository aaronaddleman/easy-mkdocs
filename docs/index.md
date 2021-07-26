# Welcome to Easy-MkDocs

## Docker instructions

To use the docker image:

```shell
docker run -v "$PWD:/app" aaronaddleman/easy-mkdocs:0.0.1 __command_goes_here__
```

## Commands to use

* make a new project

This will initialize a project from no MkDocs. I have included a `mkdocs.yml` and `./docs` files for getting a project started. While this might not apply to 
all projects, it tries to cover most. To skip this and start your own plain project use the `mkdocs new .` command instead which is documented down below.

```
docker run -v "$PWD:/app" aaronaddleman/easy-mkdocs:0.0.1 init_project
```

* serve

This will start MkDocs in the `serve` mode for previewing in your browser. Since we are in docker, the `--dev-addr` has to be set to `0.0.0.0` 

```
docker run -it -p 8000:8000 -v "$PWD:/app" aaronaddleman/easy-mkdocs:0.0.1 serve
```

* mkdocs

Running this will just pass all commands and options over to the `mkdocs` program.

```
mkdocs new [dir-name] - Create a new project.
mkdocs serve - Start the live-reloading docs server.
mkdocs build - Build the documentation site.
mkdocs -h - Print help message and exit.
```

## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.
