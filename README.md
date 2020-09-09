# Using Alteryx with InterSystems IRIS

This repository accompanies the [InterSystems Virtual Summit 2020 session](https://www.intersystems.com/virtual-summit-2020/) "Using Alteryx with InterSystems IRIS".

## What you'll find in this repo

### Alteryx

`alteryx/macros/Output Model IRIS.yxmc` is an extension of Alteryx' [existing Output Model macro](https://gallery.alteryx.com/#!app/Output-Model/5d926970826fd30b84537824), publishing the [PMML](http://dmg.org) content to an InterSystems IRIS instance over ODBC rather than just writing it to a file. More on InterSystems IRIS' support for the PMML standard can be found [here](https://docs.intersystems.com/irislatest/csp/docbook/Doc.View.cls?KEY=APMML). It requires the `Alteryx.Util.SQL` class (see below) to be loaded on the IRIS end.

`alteryx/workflow/DemoWorkflow.yxmd` has the raw workflow used for the demo portion of the session. It leverages the above extended macro and connects to an InterSystems IRIS instance over ODBC with the schema and utilities below.

### InterSystems

Source code for the demo application and utility functions can be found under `iris/src`:

* `Alteryx.Encounter` is the base table holding the full dataset. `Alteryx.EncounterHistory` and `Alteryx.EncounterCurrent` are two views presenting a demo-processing-time-friendly subset for the modeling part and an app-friendly tweak, respectively
* TODO...

## Where's the data?

We could not publish the data used for the demo in this repository. You can use InterSystems' `%Populate` utility to build your own dataset or source it from [Synthea](https://github.com/synthetichealth/synthea) with a little bit of work, possibly leveraging [this base repo](https://github.com/intersystems-community/irisdemo-base-synthea).
