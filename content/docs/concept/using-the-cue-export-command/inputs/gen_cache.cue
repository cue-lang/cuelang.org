package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					inputs: {
						page: {
							cache: {
								code: {
									"cue export # package x1":                                   "j/8PWffDGyOv+3cKpQPmkTSFusb4xI0XhmXz0+/Xrfk="
									"! cue export # package x2":                                 "CmUjOFkwq23j1pyW7Q73YE7OyAALEO+p3N6gfJTyxrk="
									"cue export . # package x1":                                 "D2B1FPXVANuPwemKEXqhITZJgbB/mF7bjTjUZMBXKE8="
									"cue export .:one":                                          "cMJdBr5k+1Yv05jCzKtHlZ4MWXkncKpM4Q8S729a6wo="
									"cue export data.yaml":                                      "Pu2QLAU/f49//DYo/MUFn8xQuYTRfgcO3mK+tJhT6Qo="
									"cue export yaml: some.yaml.data":                           "px8dWuUnyHjji5ZgdhvW4zCHN276JuzYJJrk/omMwK0="
									"cue export .:one .:two .:three":                            "Ad/nGdnT2ZIeWhs7cSXN0BOkJb98EaTdRhck36GbJsw="
									"cue export package + package file + data + packageless":    "fJ7hoixEOjjx5dJTkwKWg4mEqQfMtUIQrE/cOe/kALM="
									"package file + data":                                       "bNlWsQh4owTJIrIbMJI6750BDvurDQ8343e/HhLi91k="
									"cue export package + 2x package file + data + packageless": "S00BWGOR4jVnzR3BsXZ61RBQ5xX4MOavmEPGJbIj9kQ="
									"data file inputs":                                          "eVJNbTHtg7zBFi8nmJAaS/ieB7hfV5aIIXjf1IvoviE="
									"data file inputs failure":                                  "lpoGRyUrkyncy1a0JcNJdNjeFfutHwUIAiW00L9UBMo="
									"constraint file validating data":                           "HHCy2e7pNSwAkxDCasFceX9pF1x3aUls3TSe7+hIANw="
									"constraint file exported as data":                          "9s1Yam2l6J9q90wgJYaEcHOTmhyDQJrtuhl+8RQ3GEM="
									"-l static single":                                          "0sYvJ9pqrFGaj3uHszzfhqA+7jXvRUE3JWy6vtLkU3I="
									"-l static multiple":                                        "bjvNZEC9CHON6CWdnY3iuqBzd/rgPTTZldkfpOoMghI="
									"-l static multiple files":                                  "W6Uk8MNSfygVFSyV0kWVWkKzzWKsHJu6seFq9gpvW64="
									"-l dynamic single":                                         "urb8WhDrOxFhz0f6Tg0JTw0ltbxioB1EsVTYrFIfjt4="
									"-l dynamic single with function":                           "9XWLqgj8Op2iEy7OAFKjC+9yIaUOvSZ48h4P6krYqs0="
									"-l dynamic --with-context":                                 "XOCt7YxkT1i+nY/itTRCitkMqQHfUGThjc1NdYR+18k="
									"multi-doc merge":                                           "4I7VXQ4kv+JsfMBOw/d/9HAutSF7sTiZ+BUFS0lNixI="
									"multi-doc list":                                            "rTHUwJ25fDP/7kbTSJuM2MuThTB5kRo3lvsbBBIrGVQ="
								}
								upload: {
									"test cue package inputs prose":              "5R7ihPiUa3ENtWyPS0bmsczdDddZTMkacFz40JO6Ixw="
									"test multiple cue package inputs prose":     "Nkbm8I9I9U79smRfPqCN+Vga4qm7MA0mAEYsae+8n2U="
									"test cue package + other input types prose": "M7gAZ00jfAIKpNzHc06klyibjn/QXzM9gMCE10fQ4EA="
									"stdin data":                                 "ylRaWYvmGl5zo0MpT+qmH3QvOWCJcS2o029LpLcm460="
								}
								multi_step: {
									hash:       "LSCG4R2GL6DFBFCTDHQ1L13OHDDIFPFLSLI5EA39SPIV6OMTE0LG===="
									scriptHash: "89HBMOT8AA8UQ8IK2O3ALTSIC68PN1CPK8P82O16CPN7KV1FOF80===="
									steps: [{
										doc:      "# \"A <u style='text-decoration-style: dotted;'>CUE package</u> input can either be combined with other <u style='text-decoration-style: dotted;'>CUE package</u> inputs,\""
										cmd:      "cue export .:A .:B"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}
												{
												    "y": 2
												}

												"""
									}, {
										doc:      "# \"or with any other types of input.\""
										cmd:      "cue export .:A data.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A packageB.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A data.yml"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A schema.json"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc: """
												# "A <u style='text-decoration-style: dotted;'>CUE package</u> input cannot be combined with other <u style='text-decoration-style: dotted;'>CUE package</u> inputs
												# **and** other types of input."
												"""
										cmd:      "cue export .:A .:B data.cue"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A .:B packageB.cue"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A .:B data.yml"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A .:B schema.json"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      "# Tidy up."
										cmd:      "rm -f *.cue data.yml schema.json *.out"
										exitCode: 0
										output:   ""
									}, {
										doc: """
												# "When multiple <u style='text-decoration-style: dotted;'>CUE package</u> inputs are specified then the resulting CUE
												# evaluation is executed once for each package."
												"""
										cmd:      "cue export .:one .:two >2-packages.out"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat 2-packages.out | grep -c '^{$' | grep -x 2"
										exitCode: 0
										output: """
												2

												"""
									}, {
										doc:      ""
										cmd:      "cat 2-packages.out | grep -c '^}$' | grep -x 2"
										exitCode: 0
										output: """
												2

												"""
									}, {
										doc:      ""
										cmd:      "cat 2-packages.out | grep -c '\"x\":' | grep -x 2"
										exitCode: 0
										output: """
												2

												"""
									}, {
										doc: """
												# "Multiple <u style='text-decoration-style: dotted;'>CUE package</u> inputs
												# cannot be combined with any other input types"
												"""
										cmd:      "cue export .:one .:two data.cue"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:one .:two data.yml"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:one .:two schema.json"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      "# Tidy up."
										cmd:      "rm -f *.cue data.yml schema.json *.out"
										exitCode: 0
										output:   ""
									}, {
										doc: """
												# "Issue #3341 tracks a problem when combining a *CUE
												# package* input with a <u style='text-decoration-style: dotted;'>constraint file</u> and some other input types)."
												"""
										cmd:      "cue export .:A schema.json data.yml >3341.out 2>&1"
										exitCode: 1
										output:   ""
									}, {
										doc:      ""
										cmd:      "grep \"cannot combine packages with individual schema files\" 3341.out"
										exitCode: 0
										output: """
												cannot combine packages with individual schema files

												"""
									}, {
										doc: """
												# "The <u style='text-decoration-style: dotted;'>CUE package</u> input must be the first input specified in the list of
												# arguments"
												"""
										cmd:      "cue export .:A data.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export data.cue .:A"
										exitCode: 1
										output: """
												no encoding specified for file ".:A"

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A data.yml"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export data.yml .:A"
										exitCode: 1
										output: """
												no encoding specified for file ".:A"

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A packageB.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export packageB.cue .:A"
										exitCode: 1
										output: """
												no encoding specified for file ".:A"

												"""
									}, {
										doc: """
												# "If <u style='text-decoration-style: dotted;'>CUE package file</u> inputs are present then their package clauses need to be
												# the same as each other"
												"""
										cmd:      "cue export packageA.cue packageA.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export packageA.cue packageB.cue"
										exitCode: 1
										output: """
												found packages "A" (packageA.cue) and "B" (packageB.cue) in "/home/runner"

												"""
									}, {
										doc: """
												# "but don't need to match the name of any <u style='text-decoration-style: dotted;'>CUE package</u>
												# input that's present."
												"""
										cmd:      "cue export .:A packageB.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo",
												    "y": 2
												}

												"""
									}, {
										doc:      "# Tidy up."
										cmd:      "rm -f *.cue data.yml schema.json *.out"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml | cue export yaml: -"
										exitCode: 0
										output: """
												{
												    "A": [
												        "b",
												        "c"
												    ]
												}

												"""
									}]
								}
							}
						}
					}
				}
			}
		}
	}
}
