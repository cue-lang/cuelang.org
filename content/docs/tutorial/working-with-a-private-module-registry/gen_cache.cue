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
								"config.cue":               "YYkN6zGvQ6zhZ0PMCOD1cN96l5NH/g10+4CMHy4yfyY="
								"module.cue":               "Bn0gXHaZBOWUGqEq1kcWwV0WyCPkhuMXVBwfvB3sSiI="
								"second-module-to-publish": "SZXA7VqY1TeCOEQf/Gd2OQnh9ZhzDKGrDvcMMsfSLpM="
								"update-frostyapp":         "cZ5I6usUVJ75SogbmRDRiWIZqkCkFrUCuBRjU2t9vUE="
								"schema-v0.0.2":            "qRt9oGxQORmYecDiA3yjxi8ttZyxdTxjzqHd7OUrlb0="
								"edit-dependency-version":  "I9QmvlTrqH3Ypxqel456LEbOdL3eVjM1aMAdP4//JHQ="
							}
							multi_step: {
								"85T580AQIG6Q9HS5DK9EN1RC43K119UHNN4PHNNMR4HBEUD5V1R0====": '''
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

										import "github.com/glacial-tech/frostyconfig@v0"

										config: frostyconfig.#Config & {
										\tappName: "alpha"
										\tport:    80
										\tfeatures: logging: true
										}

										EOD
										$ mkdir -p 'frostyapp/cue.mod'
										$ cat <<EOD > frostyapp/cue.mod/module.cue
										module: "github.com/glacial-tech/frostyapp@v0"

										EOD
										$ mkdir -p 'frostytemplate'
										$ cat <<EOD > frostytemplate/template.cue
										package frostytemplate

										import "github.com/glacial-tech/frostyconfig@v0"

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

										import "github.com/glacial-tech/frostytemplate@v0"

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
										module: "github.com/glacial-tech/frostyapp@v0"
										deps: {
										\t"github.com/glacial-tech/frostyconfig@v0": {
										\t\tv: "v0.0.2" // Note: we've just changed this version
										\t}
										\t"github.com/glacial-tech/frostytemplate@v0": {
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
