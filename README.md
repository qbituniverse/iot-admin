# IoT Admin

Admin tools to manage Raspberry Pi deployment. Allows access to control GPIO pins directly on the Pi.

![IoT.Admin](/.docs/IoT.Admin.Application.png)

## Modules

### Gpio

Use to control GPIO pins running on the Raspberry Pi.

|Type|Description|
|-----|-----|
|Mock|Module is controlled through mock calls, no Pi required.|
|Pi|Module is executing GPIO commands on the Pi. Raspberry Pi is required for this.|

## Repository

Backend database details, used across all projects in the Admin solution.

|Object|Name|Description|
|-----|-----|-----|
|**Database**|Admin|Main database name for the Admin solution.|
|**Tables**|ApiLogs|Store the API execution logs.|
||WebLogs|Store the Web app execution logs.|

### Configuration

|Name|Description|
|-----|-----|
|Mock|Defaults to *empty string ("")*. Hard coded in-memory, stateless, mock calls to sample data set, no data persistance.<br /> Connection string is not required.|
|SQLite|SQLite backed database that stored on a host machine file system as _.db_ file.<br />Communication with the database through a file system.<br />Default SQLite deployment doesn't configure any user credentials and can be accessed without such permissions.<br>_NOTE: Works on AMD and ARM architectures_.|
|SQLite.Url|PATH_TO_DATABASE\DATABASE_NAME.db|
|MySql|MySql backed database that can run either in Docker container or as standalone installation on the machine.<br />Communication with the database is on port _3306_ over the network (IP Address) or localhost (127.0.0.1).<br />Use the default _root_ account and password of your choice that is configured during MySql database deployment.<br>_NOTE: Works on AMD and ARM architectures_.|
|MySql.Url|Server=127.0.0.1;Port=3306;User ID=root;Password=YOUR_PASSWORD;Database=DATABASE_NAME|
|MongoDb|MongoDb backed database that can run either in Docker container or as standalone installation on the machine.<br />Communication with the database is on port _27017_ over the network (IP Address) or localhost (127.0.0.1).<br />Default MongoDb deployment doesn't configure any user credentials and can be accessed without such permissions.<br>_NOTE: Works only on AMD architecture_.|
|MongoDb.Url|mongodb://localhost:27017|

## Projects

|Name|Description|
|-----|-----|
|[IoT.Admin.Domain](/.docs/IoT.Admin.Domain.md)|Domain project containing reusable models, modules and data repositories.|
|[IoT.Admin.Api](/.docs/IoT.Admin.Api.md)|Api (REST) project used to control the Raspberry Pi GPIO pins.|
|[IoT.Admin.Web](/.docs/IoT.Admin.Web.md)|Web app project used to control the Raspberry Pi GPIO pins through the IoT.Admin.Api.|