package site
{
	content: {
		docs: {
			tutorial: {
				"working-with-a-private-module-registry": {
					page: {
						cache: {
							upload: {
								"schema-v0.0.1":            "8qszdsoYIXzdIc9Ve7XA8DvjIM4yUlme9wQPKuiFGsg="
								"config.cue":               "pe1niQSQVrgBY8H2q1R5biuy1VzM9xHAdI5Wr/GzyGM="
								"second-module-to-publish": "hdBV2a26UGH2DFwZLZ3DYJPdSJeFKH1KQi9Xv/SmPYI="
								"update-frostyapp":         "gBQ3ZCXuypuComgSw9Vnh6QQlXi8ryylFE8EYTNzP3g="
								"schema-v0.1.0":            "4zch0y+4tKXJgUeBdOsSKHOhHPmm3HMmKdcnquKO7qU="
								"edit-dependency-version":  "AQ3zVSvyTlr1KkPM3etd5ha0ohybunsL3ekyeTh76Ys="
							}
							multi_step: {
								"BV494K2IE1DL57GOO3F8N010RJ92RQ0QMFSEG9U0E9UOH7BS4A8G====": '''
										$ mkdir -p 'frostyconfig'
										$ cat <<EOD > frostyconfig/config.cue
										package frostyconfig

										// #Config defines the schema for the FrostyApp configuration.
										#Config: {
										\t// appName defines the name of the application.
										\tappName!: string
										\t// port holds the port number the application listens on.
										\tport!: int
										\t// debug holds whether to enable debug mode.
										\tdebug?: bool
										\t// features holds optional feature settings
										\tfeatures?: {
										\t\t// logging enables or disables logging.
										\t\tlogging?: bool
										\t\t// analytics enables or disables analytics.
										\t\tanalytics?: bool
										\t}
										}

										EOD
										$ mkdir -p 'frostyapp'
										$ cat <<EOD > frostyapp/config.cue
										package frostyapp

										import "glacial-tech.com/frostyconfig@v0"

										config: frostyconfig.#Config & {
										\tappName: "alpha"
										\tport:    80
										\tfeatures: logging: true
										}

										EOD
										$ mkdir -p 'frostytemplate'
										$ cat <<EOD > frostytemplate/template.cue
										package frostytemplate

										import "glacial-tech.com/frostyconfig@v0"

										// Config defines a set of default values for [frostyconfig.#Config].
										Config: frostyconfig.#Config & {
										\tport:  *80 | _
										\tdebug: *false | _
										\tfeatures: {
										\t\tlogging:   *true | _
										\t\tanalytics: *true | _
										\t}
										}

										EOD
										$ mkdir -p 'frostyapp'
										$ cat <<EOD > frostyapp/config.cue
										package frostyapp

										import "glacial-tech.com/frostytemplate@v0"

										config: frostytemplate.Config & {
										\tappName: "alpha"
										}

										EOD
										$ mkdir -p 'frostyconfig'
										$ cat <<EOD > frostyconfig/config.cue
										package frostyconfig

										// #Config defines the schema for the FrostyApp configuration.
										#Config: {
										\t// appName defines the name of the application.
										\tappName!: string
										\t// port holds the port number the application listens on.
										\tport!: int
										\t// debug holds whether to enable debug mode.
										\tdebug?: bool
										\t// maxConcurrency specifies the maximum amount of
										\t// concurrent requests to process concurrently.
										\tmaxConcurrency?: int & >=1
										\t// features holds optional feature settings
										\tfeatures?: {
										\t\t// logging enables or disables logging.
										\t\tlogging?: bool
										\t\t// analytics enables or disables analytics.
										\t\tanalytics?: bool
										\t}
										}

										EOD
										$ mkdir -p 'frostyapp/cue.mod'
										$ cat <<EOD > frostyapp/cue.mod/module.cue
										module: "glacial-tech.com/frostyapp@v0"
										deps: {
										\t"glacial-tech.com/frostyconfig@v0": {
										\t\tv: "v0.1.0" // Note: this changed from before.
										\t}
										\t"glacial-tech.com/frostytemplate@v0": {
										\t\tv: "v0.0.1"
										\t}
										}

										EOD


										'''
							}
						}
					}
				}
			}
		}
	}
}
