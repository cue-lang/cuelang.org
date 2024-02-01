package site
{
	content: {
		docs: {
			tutorial: {
				"working-with-a-private-module-registry": {
					page: {
						cache: {
							upload: {
								"schema-v0.0.1":            "1c94eOV9Y8PKasLgA4n1walyOJWIef6gz/907i6F8yM="
								"config.cue":               "dv35WYjXzt34W5pAh6v4c/S6wCK4RDmQkKHCdr0V48U="
								"module.cue":               "EQvyS0AQh+r1h1D7gxD5ARG/flFFvHFq6LIgLWMzWls="
								"second-module-to-publish": "AhPxoQg3fVNlhKYpRnLZ5bso9ilwbh/RPNmqd/gZ0lM="
								"update-frostyapp":         "AlxDYnD2fceWwP63QPXOHcycoaV72uJiwjebtSaOIiA="
								"schema-v0.0.2":            "Gd5Uy0QuiW7XaJpR+zC+La8/oBZxyMVww5JZWJCz6UY="
								"edit-dependency-version":  "K2+yJvsgurh9EgYoty7Ltyb6jXy83z1uk7ThTt19HaM="
							}
							multi_step: {
								"TK171Q8CIKNRKJDV0NEJRDOOTU9HUC377R1VL6D3F4KT3DV36TF0====": '''
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
