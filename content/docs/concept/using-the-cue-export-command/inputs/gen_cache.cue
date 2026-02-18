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
									"cue export # package x1":                                   "iVc92l+UCPvfIiqCnOpJoDwHX1fkTcuaxl1tBbLv45Y="
									"! cue export # package x2":                                 "tWCsLTRdoVfGk3/D8XVuUa9poIS4nXNNmUBu2WsdUT4="
									"cue export . # package x1":                                 "DbEHa7C/nGLalqFzttiulUpcogoZMieY52TwRgQs+s4="
									"cue export .:one":                                          "lwvJZoERSSkCgaJf1YXSKH2oIGD3C3/6RJZfvmzXEto="
									"cue export data.yaml":                                      "wD0+tA/6BMPPQwAUJP59zaYz4xw4623WRbKuqIDddcM="
									"cue export yaml: some.yaml.data":                           "dovuPeIfPqbJ+D/LJ6cQzbf2McXBiY+TAZ+oECCHOPE="
									"cue export .:one .:two .:three":                            "jhW3a73FxWrQFU0dG81+1XV29uCf9y/l4LQ/pygWxOs="
									"cue export package + package file + data + packageless":    "s0ehb14ko1wXIGTlY0lNwDl+u0viOERw5hGGRF38wgs="
									"package file + data":                                       "c71c113cK6uHNqOjNczlgxhXnm0nhlRNdujbEIOtQLs="
									"cue export package + 2x package file + data + packageless": "VNx1belqGe/kCCxDGJuf3JkSCqKg4ePDE9abxbdoi1c="
									"data file inputs":                                          "Yxr72ZHRgMRRRBqz1APNC8tVr2mIqay9WWSAlKBltbI="
									"data file inputs failure":                                  "3po5nH8JmR1IVlivleIwMBSNnxnAxJDlxatP90FGqRc="
									"constraint file validating data":                           "Z0xR9aEpzKnBvuaRoZU3LALNSEZgcBxb7HhgtKUyzfg="
									"constraint file exported as data":                          "055EP/bnhc7gmQDsrr5s/SdPbXj8bluLxSqPrvIGj8A="
									"-l static single":                                          "ntlsg370zPDRD/DOOEdSZ52cxvaxTiBy+IR6pxIObYY="
									"-l static multiple":                                        "ibNuIKzf8i28i9GJDst0jRm1w8oMW5/dC95BegD1qKE="
									"-l static multiple files":                                  "g5VPN5ani5fn0QTpVdPHOK3R/hyd1OfIa/WU7hn8NKE="
									"-l dynamic single":                                         "Qth0nWfYuozkE28HF9VdPboGt303b01uZh7JREIL8/0="
									"-l dynamic single with function":                           "hOddhnplcvFDx3sxdWx/JLfic2d/NhMEXwiQHl5NXng="
									"-l dynamic --with-context":                                 "DHQ93LRWbG8dwm6EraJBut4HPefaEkmp+SP53p/zoLM="
									"multi-doc merge":                                           "XuCgt8Ng3D++2gFJkZfL5qqJ/IO68D8sgGL4kE27p4c="
									"multi-doc list":                                            "GoEf5v+LxT+Sc5tgDa9D3YF4F+DO8SIKqXKYpp6MmOc="
								}
								upload: {
									"test cue package inputs prose":              "HNHzOygn/L3D70OSYjWWA0E73iWgwj5P1wH5S1andFE="
									"test multiple cue package inputs prose":     "vz7/fnHfARwXCFmQoxUPmmiJOVLgC+Sn+gcdJb7bJDU="
									"test cue package + other input types prose": "6N12M5yoSPhTH7AVqL62Nsn54e340Cp0YEwWwhRU4tA="
									"stdin data":                                 "9y6Z0rpdNQdyuPE+gJL0kDztO4BC/IZnviCvsmAH3ag="
								}
								multi_step: {
									hash:       "CQVO59KJ9REJQQE7432L8RFFLVS54TQOUPTNLU81653CD5QHPECG===="
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
