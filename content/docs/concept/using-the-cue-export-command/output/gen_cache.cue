package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					output: {
						page: {
							cache: {
								code: {
									"default output":             "sjuyoPtxi+Ynwfv5PXcRiB8FhCFCOc/t9e2JjwavcCY="
									"stdout yaml":                "+vUzHCMUUO4FXxbeFmy0LctZvy79rXW5dfXIlFcP+D4="
									"yaml:-":                     "csbr4uNTLmDA3zhlZHzFgs+3OhwEdEL40iGehImFiRQ="
									"--out cue":                  "MYjmE7ANZDF/q0atHNi/nWpU0O6KVWvIQ/bImmoFLzA="
									"--out cue no hidden fields": "OB6tRNb2rxBrc2x/2Ev3i3F234JUE3KD2UEdC5/+2IE="
									"--out cue --package foo":    "4VwsdZWdbGnSJ1ll9e+t2AzGrcyrapv+JnTiU2jFVyA="
									"--escape":                   "sIHQrWks0rBKHWxOwIYJWQ9zsIrpIFo1e78NDGK+2UA="
								}
								upload: {
									"--outfile data.yml":            "u8pn4JgGFBWw9PfZmw67F1dB8t8WL8v3XtPbJnntN74="
									"--outfile data.txt":            "e6VeB9NzUi+e+SDXDN2W7SM06kr14vu+IqGklzhOT+k="
									"--outfile datafile --out json": "U4kjm4nsy5z+25OU07UZAdX0mAGViO7NWLOcDRMDJzQ="
									"--outfile json:datafile":       "PbDq+yquV2fg8FyNrmBkhY/yi5XjfV55wkzPp7B+sOI="
								}
								multi_step: {
									hash:       "86G38LD5MF3RQUS27R7TUDNHPMKGCU79G6FS3TAAOD027795NH60===="
									scriptHash: "TVTCOHK1K6IF54PI4CB62FSIBJMCMB1BAOO6SNBVQ897AIDDN7UG===="
									steps: [{
										doc:      ""
										cmd:      "cue export --outfile data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml"
										exitCode: 0
										output: """
												data:
												  value: A string
												  list:
												    - 1
												    - 2

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile data.txt -e data.value"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.txt"
										exitCode: 0
										output: """
												A string

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile datafile --out json"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile json:datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
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
