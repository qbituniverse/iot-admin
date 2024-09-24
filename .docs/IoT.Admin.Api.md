# IoT.Admin.Api

Api (REST) project used to control the Raspberry Pi GPIO pins.

## Endpoints

For a complete OpenAPI specification please refer to [IoT.Admin.Api.Spec.json](IoT.Admin.Api.Spec.json) file. Use [Swagger](https://swagger.io/) tools to browse this OpenAPI spec.

|Controller|Endpoint|Details|
|-----|-----|-----|
|**Gpio**|POST /api/gpio/open<br />Query Parameters:<br />pinNumber: integer|Open GPIO pin specified in the request.|
||POST /api/gpio/close<br />Query Parameters:<br />pinNumber: integer|Close GPIO pin specified in the request.|
||POST /api/gpio/close-all|Close all GPIO pins.|
|**Admin**|GET /api/admin/ping|Prints out Ping OK healthy response.|
||GET /api/admin/config|Prints out current Api configuration.|

## Ports

|Environment|Port|
|-----|-----|
|Development|8001|
|Test|8002|
|Production|8003|

## Configuration

|Key|Value|Description|
|-----|-----|-----|
|**Environment**|Development|Use for local development where Raspberry Pi is not connected.|
||Test|Use for testing the deployment where Raspberry Pi is connected.|
||Production|Use this for the final production deployment of the running application on your network with Raspberry Pi connected.|
|**LogLevel**||Log levels to capture.|
|LogLevel.Console|See options|Log level to record in the database repository.<br />_Options: Verbose, Debug, Information, Warning, Error, Fatal_|
|LogLevel.Database|See options|Log level to record in the database repository.<br />_Options: Verbose, Debug, Information, Warning, Error, Fatal_|
|**Repository**||Repository configuration.|
|Repository.Type|Mock|Defaults to *empty string ("")*. Hard-coded in-memory data, no persistent storage.|
||SQLite|SQLite database backend.<br>_NOTE: Works on AMD and ARM architectures_.|
||MySql|MySql database backend.<br>_NOTE: Works on AMD and ARM architectures_.|
||MongoDb|MongoDb database backend.<br>_NOTE: Works on AMD and ARM architectures (Pi 5 or higher)_.|
|Repository.SQLite||SQLite details.|
|Repository.SQLite.Url|Connection string|Connection details to SQLite.|
|Repository.MySql||MySql details.|
|Repository.MySql.Url|Connection string|Connection details to MySql.|
|Repository.MongoDb||MongoDb details.|
|Repository.MongoDb.Url|Connection string|Connection details to MongoDb.|
|**Modules**||Modules configuration.|
|Modules.Gpio||Gpio details.|
|Modules.Gpio.Type|Mock|Defaults to *empty string ("")*. Hard-coded module not requiring Pi.|
||Pi|Running on Pi and making GPIO calls.|

### Schema

```json
{
  "Configuration": {
    "Environment": "string",
    "LogLevel": {
      "Console": "string",
      "Database": "string"
    },
    "Repository": {
      "Type": "string",
      "SQLite": {
        "Url": "string"
      },
      "MySql": {
        "Url": "string"
      },
      "MongoDb": {
        "Url": "string"
      }
    },
    "Modules": {
      "Gpio": {
        "Type": "string"
      }
    }
  }
}
```

### Example

```json
{
  "Configuration": {
    "Environment": "Development",
    "LogLevel": {
      "Console": "Information",
      "Database": "Error"
    },
    "Repository": {
      "Type": "SQLite",
      "SQLite": {
        "Url": "PATH_TO_DATABASE\\DATABASE_NAME"
      },
      "MySql": {
        "Url": "Server=127.0.0.1;Port=3307;User ID=root;Password=YOUR_PASSWORD;Database=DATABASE_NAME"
      },
      "MongoDb": {
        "Url": "mongodb://localhost:27007"
      }
    },
    "Modules": {
      "Gpio": {
        "Type": "Mock"
      }
    }
  }
}
```