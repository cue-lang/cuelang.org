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
									"cue export # package x1":                                   "Iyx/lAJpaPXBQAB86I+8BgISCuNjHN8oTkHPbGXR650="
									"! cue export # package x2":                                 "WwnQT5QlJajZscLVrGTE/U/hMDP4omNeUMev/aBQC2o="
									"cue export . # package x1":                                 "RNW6NQYF8qtxxzJzcgDLhRvCULsqjfCuyRVI3dJB3s0="
									"cue export .:one":                                          "NJ/QZf/OL0kOkmwK0fa33GHwL/hva0KowCfyBfPNpVo="
									"cue export data.yaml":                                      "YvDRKrfLQHA/gJjOqSfcdVU+Gd7IEs+f1MOy7k1KSZs="
									"cue export yaml: some.yaml.data":                           "yp3/GpTtS/6w+V3paX6GGeiJtcvkHOrEkIpwbA8Qqxg="
									"cue export .:one .:two .:three":                            "ForEWY5wWszV+uP8poAz7inmFrJ+e7U0BZv/6FF3bSA="
									"cue export package + package file + data + packageless":    "kdoRIg0hbdradSbcrazQL2EGPr7zS2blu6O+0NfiFXg="
									"package file + data":                                       "l3dJrvQa5mwmeQXaxFJ68XdRMsO/nREOLcu6WdMm/D0="
									"cue export package + 2x package file + data + packageless": "mwTJpR3F8xcxQzqv64biOKWHJePCm+I4cKPBQt5sE8g="
									"data file inputs":                                          "77qyAzY6fDA4itSqt6oCLGIAICsopNW2DizMQyCLNd4="
									"data file inputs failure":                                  "X8zzWOmbdidp6xq3UarYsP8Qgnh+m4eEpZu1Kd89HMA="
									"constraint file validating data":                           "JAtMOg29YXNcbXEe4whYGonXNP5dvP572L3dkfHuuLI="
									"constraint file exported as data":                          "1H/a53UTaizQgbcetpKwYmroDw5ZTGIXWprByCxLKwA="
									"-l static single":                                          "Ls+p2E0jVQ52oQCBk6RV+H4Wk/JtQmH7/oIqHa1cl+s="
									"-l static multiple":                                        "kM0k58Si2RsxgiKMHuNfgcFXqLX4ATWau93Fs/qZoIM="
									"-l static multiple files":                                  "l/gAzvphqVbY0GXglV5sF5RUJQJdYJiV7nRpfWDstvg="
									"-l dynamic single":                                         "dfh6uOVWyg4aLZRNO+kBBM34UNxfNFWZU/sdGQgm3dk="
									"-l dynamic single with function":                           "BNr3Fyd9LLYkCSB/j0xzrVi94vyzCxbjbTUTIjpG+L0="
									"-l dynamic --with-context":                                 "plFbxv5gbPxIstw5iBd8TDtJ97iKZMrE7cF8a/HsGZU="
									"multi-doc merge":                                           "74a389lKVlehSw8klaYOdwHcs1TfP+7jkthJO/s0vSw="
									"multi-doc list":                                            "Uer4hF71tZUNMC73McQOy4sjLhbEBEqG0SzBFlDi0F0="
								}
								upload: {
									"test cue package inputs prose":              "5yJgE6uGqXKUa6zx2Jof3LphxIUYsVPUfmfOqMT/Bag="
									"test multiple cue package inputs prose":     "viNiQ90qcNNN3p2hO1f5FVRBTur6yqlQg84b5z2jDdU="
									"test cue package + other input types prose": "CjMKiWmi2ZZdh61zedqU1zd7xV5wbX1YJksUkOx15Zk="
									"stdin data":                                 "KF+y3n7Kp35vC6VtOwQep7SUa7gweX4CZ0qyD/BO/tc="
								}
								multi_step: {
									hash:       "E2UL0IBGMF66QPIMKHT3KHICM9Q0VN3544ICPLDEON3KCUI4MO40===="
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
												    "y": 2,
												    "x": "foo"
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
												    "y": 2,
												    "x": "foo"
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
												    "y": 2,
												    "x": "foo"
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
