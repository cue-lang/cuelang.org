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
									"cue export # package x1":                                   "glz4bMGB01SaIVhqCsRWgAWb8PdE8isML4sdWBylo+M="
									"! cue export # package x2":                                 "HTlelgZk+gRa5UJVgouGZRpvitZGHntTbkFzRoPKa14="
									"cue export . # package x1":                                 "cPhBR2gkZOzED0qR7SQl1Hp3H9kGd6tZw9GXiEJJBnA="
									"cue export .:one":                                          "LxDPzBPk6yql22YOv9NUtrhCUkjTcW8orwwwuHADj7M="
									"cue export data.yaml":                                      "sPov3GOVyNU8NCLNZs20D4hbxzvl1vbZJ6s8B+9EPf8="
									"cue export yaml: some.yaml.data":                           "ZTqAXySr9eezTtZx4kKND9M45Dg49ASDNZDG6VQwdoE="
									"cue export .:one .:two .:three":                            "Y9DgjiaRlXWTGKY1VMS3dCqYRSrGCSqWys11H95Q+bA="
									"cue export package + package file + data + packageless":    "JNgslStsWoA2t7O9ruq7RtgJWfxeZR4WFI5Rx7N1ywQ="
									"package file + data":                                       "Mi9Ufz6D2GVPmwrCHvsKADgAyDFyjae2WFeAZW9yLnc="
									"cue export package + 2x package file + data + packageless": "yRSF5YYLl+RWWXjgRorHYzlmx5+d1xPkne7fn7Tmx3Q="
									"data file inputs":                                          "07Od3qdvhlCGXjmO0I1ey5chvKKHsRWyGAjl/+XhlM0="
									"data file inputs failure":                                  "OJK9JOqFxxa3KU6dwGkeRV0Dt1wRlLF8KBcmV9qT4c0="
									"constraint file validating data":                           "BQTogwRTIolEEDnz1PQTuYIybTQsr6NaaZFbStfW5zA="
									"constraint file exported as data":                          "CfWlq0nMiLYyIrN5S0JrEGZRLhiW8KmR4UuefK4yjq8="
									"-l static single":                                          "AUOQXnx3e0xTg6WBXXlqig3Oaymk6gtAEtCKvdN3p/M="
									"-l static multiple":                                        "V3wpYnSZPt69aYP3aG6FmVzJtcV71RB9UU+wlxQ4tZA="
									"-l static multiple files":                                  "xg232vSAKlPha33UdU8MmohB0W0Mv9PqxHvGV+wbgS0="
									"-l dynamic single":                                         "CPioa1N2FD8REr10TxYTs0tBqg1hKuAtugbFEe7h+aI="
									"-l dynamic single with function":                           "bBuQFksFLWsbsraneanf9KObPBuDyazwEBFeAubYatk="
									"-l dynamic --with-context":                                 "ZkgptqlCvPqBjyU32vqugZVjd48OS3OX3dCmxcHBbeQ="
									"multi-doc merge":                                           "8aG2K/Gc3bVujZd6ch/ttSFLGED/MfHCHZ6b6qYIS0s="
									"multi-doc list":                                            "JshbK5sVvQUk4avd4of+60acUUUaEx3wQzvuXD1UBd4="
								}
								upload: {
									"test cue package inputs prose":              "gQyeyELh9iGglpIkmtKRWYcMbvReCVoQ52dxcLVYVwA="
									"test multiple cue package inputs prose":     "EkZXUa4YQSgeVA/c4xlRfCSmOk46+NY7qV2mcQAqkbc="
									"test cue package + other input types prose": "o4nrRUN9Z/+OvPtxdv6ZSx7UhajRCL9dcqoAA8hF1ac="
									"stdin data":                                 "60PYt7bnDsVwy2BkR4f5xx9zu5l4zDxoRAs+CS+7PGA="
								}
								multi_step: {
									hash:       "8BUI6MV8ACPMLVN9SV1DQ0N5F5NBCCJD0G0ARI43DQPMH4GTQDAG===="
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
												found packages "A" (packageA.cue) and "B" (packageB.cue) in "."

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
