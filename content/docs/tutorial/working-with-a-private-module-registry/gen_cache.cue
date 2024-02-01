package site
{
	content: {
		docs: {
			tutorial: {
				"working-with-a-private-module-registry": {
					page: {
						cache: {
							upload: {
								"schema-v0.0.1":            "6Hb+pEeGqM1oF1d1S/UY60yjeaTBZ/HfGsdrBuOfHMw="
								"config.cue":               "cFb7cIQD4mPQ+ANpUi1rRib7RQu/sn2cGYSh22hng6U="
								"module.cue":               "FgQvlPsLO+o9b+C3keL14olwzuR/AC6cuTiy6+j2fwo="
								"second-module-to-publish": "FIHTSK++HU+PV2Ef6pqNOg0ZBCnvhpTLeLdhAYwbvnQ="
								"update-frostyapp":         "wRS5/W1kUgnQ95BU6kRb9jrwUsk2dO1Wu/SKAWqKPlc="
								"schema-v0.0.2":            "xNK27aNNi0xsiHXabD5XBP01W69Cnmv63iFpqpcxZ/8="
								"edit-dependency-version":  "qS4HuNLfGeV5mtX4jUMFiaaN3Pt0Tmp7KSiuwfFSEXU="
							}
							multi_step: {
								"DNCOR67C4D61MAVE9V26H4LNNU22OJSK5JQBQJRK4TC2LQ25KARG====": '''
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
