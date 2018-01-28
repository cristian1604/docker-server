# Docker Server

### Overview
A docker composer with three docker containers:
 * Apache + PHP 7.1
 * PostgreSQL
 * PgAdmin 4

### Parameters

On `docker-compose.yml` file, there are four parameters to modify before run for first time docker-compose.

There are:

**PgAdmin**
 - `DEFAULT_USER = root`
 - `DEFAULT_PASSWORD = changeMe`

**Postgres**
 - `POSTGRES_USER = root`
 - `POSTGRES_PASSWORD = changeMe`




### Install and run

Simply run

`sudo sh docker-compose.sh up -d`

And it's automatically start to download and install all dependences. The same thing to run the containers.



### Configuration

The remaning configuration is set the timezone on Postgres and PHP servers.

Later I will to explain this.



### Use it!

On your browser go to the following URLs:

**PgAdmin4**

`localhost:5050`

When add your server database, on the address to the database put `db` on port `5432`. It will route to the postgres container.

**Apache + PHP**

`localhost`, or `127.0.0.1`

**Connect to PostgreSQL database**

This use the standard Postgres port, wich is `5432`

`localhost:5432`

Or from another docker container on this repository, using the address `db`.

By default this configuration allows incoming connections from the network. So it's ready to put on production quickly.



### Remove the containers

To remove the three container instances run:

`sudo sh docker-compose.sh down`



### Thanks to
Thanks to [Martin Anacabe][manacabe] and his [docker-lampp-symfony][repo] repository, which was a model and improvement to this one. I left their scripts on `apache/scripts/` in case of you use Symfony framework, npm, nvm and want to preserve permissions of the host user.

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [manacabe]: <https://github.com/martin-anacabe>
   [repo]: <https://github.com/martin-anacabe/docker-lamp-symfony>
