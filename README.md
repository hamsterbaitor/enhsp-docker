# enhsp-docker
A simple docker file which encapsulates the work towards generating MUGS.

# Building
Clone this repository, then on the terminal make sure the following is executed in the folder: 

```docker build -t mugs .```

Once build you can then run the docker container from the folder with the necessary `pddl` files using the following syntax:

```docker run -v $(pwd):/enhsp-xaip/local mugs <domain.pddl> <problem.pddl>```

For instance, using the files provided in this repo, you could run:

```docker run -v $(pwd):/enhsp-xaip/local mugs domain.pddl problem_10_3_3_0.23_42.pddl```

This will generate the MUGS using the `domain.pddl` and `problem_10_3_3_0.23_42.pddl` files.

## Create Alias
Once the docker container is built, if may be easier to create an Alias for using powerlifted. This can be done either by running on terminal or adding to your shell file (e.g. `~/.bash_rc` etc):

```alias mugs='docker run -it -v $(pwd):/enhsp-xaip/local mugs'```

Then the software can be called simply using the form:

```mugs <domain.pddl> <problem.pddl>```

or, as per the example files here:

```mugs domain.pddl problem_10_3_3_0.23_42.pddl```