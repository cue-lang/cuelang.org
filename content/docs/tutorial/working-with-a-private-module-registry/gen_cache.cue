package site
{
	content: {
		docs: {
			tutorial: {
				"working-with-a-private-module-registry": {
					page: {
						cache: {
							upload: {
								"schema-v0.0.1":            "KwsxpYK1XW1LTugoU8HMBTmvQHE1BRhuPYPEaMwsLgc="
								"config.cue":               "G5DIdkhVT63CKl2ii4HoEEeKvPkPvjnj+vhCkGplTzI="
								"module.cue":               "2fBbP+fW83cmb6r/0itkg9Uujx+gVz/qwU1ArpFB+lk="
								"second-module-to-publish": "UMiYpjp3fZLnkSYAHs2bF8g0fswnfve0FTyXFlFqad8="
								"update-frostyapp":         "iGcagqwkvVDgxnWJTZSLr8HU6QsLhG8GXOFJG6sfwUY="
								"schema-v0.0.2":            "Cj8Ir0p5EzshzbcuKDdthf7MY5lqy0wNSoe2AgWMP40="
								"edit-dependency-version":  "cnCYSgm7H7VXnOv73TrNVM9fGTNne6ngBChAjm0wKow="
							}
							multi_step: {
								"5DFO6GUB1SOMJI2059CP6SQK3PINMCG1NJHBUOQQGOOL0H8JGN30====": '''
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

										import "github.com/glacial-tech/frostyapp@v0"

										config: frostyapp.#Config & {
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
										package myconfig

										import "github.com/glacial-tech/frostyapp@v0"

										// Config defines a set of default values for [frostyapp.#Config].
										Config: myrepo.#Config & {
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

										// TODO use more realistic contents for this file
										deps: "github.com/glacial-tech/frostyconfig@v0": v: "v0.0.2"

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
