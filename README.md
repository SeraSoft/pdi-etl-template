# PDI ETL Template
Template to start PDI processes with an already pre-defined structure.

The templates gives the PDI project a predefined structure to manage confguration files and process from within a same bundle that can easily be distributed.

Following features are implemented:

* Load process' configuration from a configuration file.
* Ability to start the PDI Process by defining multiple configurations to manage multiple environments (Test, Production, etc.)
* Manage feedbacks via email messaging in case of success or failure. Ability to either set both feedbacks on or off or separately if required.
* Ability to configure the feedback message. Currently the template defines simple specific message templates for both the feedback types that can be extended depending on the projects' use-cases.

#### TO DO

* Integrate path for Unit Test procedures
* Integrate script to configure logs import into Elasticsearch through Logstash
* OTHER...
