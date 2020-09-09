# Using Alteryx with InterSystems IRIS

This repository accompanies the [InterSystems Virtual Summit 2020 session](https://www.intersystems.com/virtual-summit-2020/) "Using Alteryx with InterSystems IRIS".
Please use the [issues](https://github.com/bdeboe/isc-alteryx-demo/issues) section for any questions, comments or contributions.

## What you'll find in this repo

### Alteryx

`alteryx/macros/Output Model IRIS.yxmc` is an extension of Alteryx' [existing Output Model macro](https://gallery.alteryx.com/#!app/Output-Model/5d926970826fd30b84537824), publishing the [PMML](http://dmg.org) content to an InterSystems IRIS instance over ODBC rather than just writing it to a file. More on InterSystems IRIS' support for the PMML standard can be found [here](https://docs.intersystems.com/irislatest/csp/docbook/Doc.View.cls?KEY=APMML). It requires the `Alteryx.Util.SQL` class (see below) to be loaded on the IRIS end, which picks up the PMML file generated by the base macro (still using file as an intermediary to avoid the eventual ODBC string length hickup).

`alteryx/workflow/DemoWorkflow.yxmd` has the raw workflow used for the demo portion of the session. It leverages the above extended macro and connects to an InterSystems IRIS instance over ODBC with the schema and utilities below.

![Screenshot of Alteryx Workflow](docs/workflow.png?raw=true)

### InterSystems

Source code for the demo application and utility functions can be found under `iris/src`:

* `Alteryx.Encounter` is the base table holding the full dataset. `Alteryx.EncounterHistory` and `Alteryx.EncounterCurrent` are two views presenting a demo-processing-time-friendly subset for the modeling part and an app-friendly tweak, respectively.
* `index.html` and `demo.js` make up the demo app, with helper libraries [Bootstrap 4.5](https://getbootstrap.com/), [jQuery 3.4](https://getbootstrap.com/) and [Font Awesome 4.7](https://fontawesome.com/). These just render a tabular view on the "current encounters" and, for each row, an icon capturing the readmission risk as calculated by the model in `Alteryx.PMMLModel`, which is published by the above workflow. 
* `Alteryx.Util.REST` is a simple REST service offering an endpoint to get the current encounters (based on a SQL query on the `Alteryx.EncounterCurrent` view) and to run a readmission risk model on the supplied encounter object (formatted as JSON).
* `Alteryx.Util.SQL` comes with the Alteryx PMML publishing macro described above and just ensures we can trigger picking up the PMML definition through SQL.

![Screenshot of Demo Table](docs/table.png?raw=true)

## Where's the data?

We could not publish the data used for the demo in this repository. You can use InterSystems' `%Populate` utility to build your own dataset or source it from [Synthea](https://github.com/synthetichealth/synthea) with a little bit of work, possibly leveraging [this base repo](https://github.com/intersystems-community/irisdemo-base-synthea).
