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
									"cue export # package x1":         "zcoJnAgkI38zBp7vML4iNezUw+7meoO94bZziFi66TQ="
									"! cue export # package x2":       "9Y8pfUuVSGvncE/ictVCzzW1uhLHwuYT3RYodPDsEYk="
									"cue export .:one":                "wkZ1kTueZ9/ja4oTapitFP6cWKK0dkrtzFfwrqDwkBc="
									"cue export data.yaml":            "d3BJGzfPWEHnEgFcgOKgGNRvfn5CCrDJe5/kk9EqEOQ="
									"cue export yaml: some.yaml.data": "dFeCCPQxTLJxtkE35PBoodG9gPLjy8BedTC+VaMpwm4="
									"cue export .:one .:two .:three":  "r69vbAwJhxsd9NE4Stkj8HtkGbmBnA8WGm/EgRvbuvQ="
									"cue export FIXME":                "qH3xnejBPvIjIY+NIRGB4DmVnvFMybmEs+/jB5UUBS0="
								}
								upload: {
									"test cue package inputs prose": "kHmvkO2lzIBuyaEe0bzr856slwOhG+WGU3mV2CyqSWg="
								}
								multi_step: {
									hash:       "6UVUPT14R7UVRFP1LTIR1USO8DC8V0LKEV99S65ABDPCA5Q71HL0===="
									scriptHash: "EVG6HQ4CNFAA2F9CJJ5PV90HC8RT5ENH5T6MJAFGJO88U3T1OG4G===="
									steps: [{
										doc:      "# A CUE package input can be combined with other CUE package inputs"
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
										doc:      "# ... or with any other types of input."
										cmd:      "cue export .:A data.cue"
										exitCode: 0
										output: """
												{
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A b.cue"
										exitCode: 0
										output: """
												{
												    "y": 2,
												    "x": "foo"
												}

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A data.yml"
										exitCode: 0
										output: """
												{
												    "y": 2,
												    "x": "foo"
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
										doc:      "# A CUE package input cannot be combined with other CUE package inputs and other types of input."
										cmd:      "cue export .:A .:B data.cue"
										exitCode: 1
										output: """
												too many packages defined (2) in combination with files

												"""
									}, {
										doc:      ""
										cmd:      "cue export .:A .:B b.cue"
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
										cmd:      "rm a.cue b.cue data.cue data.yml schema.json"
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
