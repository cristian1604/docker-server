# Docker Server
A docker composer with three dpcker containers:
 * Apache + PHP 7.1
 * PostgreSQL
 * PgAdmin 4


### Install and run

Simply run

`sudo sh docker-compose.sh up -d`

And it's automatically start to download and install all dependences. The same thing to simply run the containers.

### Parameters

On `docker-compose.yml` file, there are four parameters to modify before run for first time docker-compose.

There are:

**PgAdmin**
 - `DEFAULT_USER = root`
 - `DEFAULT_PASSWORD = changeMe`

**Postgres**
 - `POSTGRES_USER = root`
 - `POSTGRES_PASSWORD = changeMe`

### Configuration

The remaning configuration is set the timezone on Postgres and PHP servers.

Later I will to explain this.

### Use it!

On your browser go to the following URLs:

**PgAdmin4**

`localhost:5050`

When add your server database, on the address to the database put `db` on port `5432`. It will route to the postgres container.

**Apache + PHP**

`localhost`

**Connect to PostgreSQL database**

This use the standard Postgres port, wich is `5432`

`localhost:5432`

Or from another docker container on this repository, using the address `db`.

### Remove the containers

To remove the three container instances run:

`sudo sh docker-compose.sh down`