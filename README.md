# Docker Server
A docker composer with three containers:
 * Apache + PHP 7.1
 * PostgreSQL
 * PgAdmin 4


### Install and run

Simply run

`sudo sh docker-compose.sh up -d`

And it's automatically start to download and install all dependences.

### Configuration

The remaning configuration is set the timezone on Postgres and PHP servers.

Later I will to explain this.

### Parameters

On `docker-compose.yml` file, there are four parameters to modify before run docker-compose.

There are:

**PgAdmin**
 - DEFAULT_USER = root
 - DEFAULT_PASSWORD = changeMe

**Postgres**
 - POSTGRES_USER = root
 - POSTGRES_PASSWORD = changeMe

### Connect it!

On your browser go to the following URLs:

**PgAdmin4**

`localhost:5050`

**Apache + PHP**

`localhost`

**Connect to PostgreSQL database**

This use the standard port to Postgres, wich is `5432`

`localhost:5432`

