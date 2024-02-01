package site
{
	content: {
		docs: {
			tutorial: {
				"working-with-a-private-module-registry": {
					page: {
						cache: {
							upload: {
								"schema-v0.0.1":            "zEv2f7oSE3uXocqEdZGwgSOwJ1hw4Ug3WtI1LVJyUSM="
								"config.cue":               "qFczjJgD1GFzTiIYwGEu/jM23zjK+4F8ZDfNAQ09y10="
								"module.cue":               "Ep8kOrM6Ck6xunPz6m3UUhclAkM4QKkdeUqWd02qvyc="
								"second-module-to-publish": "rzl8lYuJvSrtZOrG1N7j04M+UkL1yN4h/+4LSmQ3IXM="
								"update-frostyapp":         "cejIikLHAo3frm6yw2JB5Prp+sCybr7M2gzJug7XLFc="
								"schema-v0.0.2":            "zJK6CyWVZGRgdKSrC2ZbVvRxNItq3TIeeSzy+tpWM6w="
								"edit-dependency-version":  "XHkD5au0Qgods3ZbtZIuQSk2FP/iFo3f9dnlQr8NMyc="
							}
							multi_step: {
								"740SNMFCO6UL284D4EERMTLJAP17KL0SFN0QMONBML77BC1R61F0====": '''
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
