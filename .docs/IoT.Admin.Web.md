# IoT.Admin.Web

Web app project used to control the Raspberry Pi GPIO pins through the IoT.Admin.Api.

## Pages

|Controller|Endpoint|Details|
|-----|-----|-----|
|**GpioControl**|/gpio-control|Send GPIO signals to control the pins.|

## Ports

|Environment|Port|
|-----|-----|
|Development|8004|
|Test|8005|
|Production|8006|

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
|**Api**||Api configuration.|
|Api.Url|Connection string|Connection string to the Api.|

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
    "Api": {
      "Url": "string"
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
    "Api": {
      "Url": "http://localhost:8001"
    }
  }
}
```