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
									"cue export # package x1":                                   "nQshNfGLkGSUkG7z2SNMFsafKJfjx5GaAE5Dzu7zauA="
									"! cue export # package x2":                                 "j1v6HstGR1cp4agVJVh0id2WLgDwcRYglkVaYQtNdvQ="
									"cue export . # package x1":                                 "888jceQVy0xkFqCTfkqGxjcRL7d03nMKkIJCVkUtQ5k="
									"cue export .:one":                                          "p/CTd6jOBY8OW7vUS5wbxDiE6V2G1lPkrJ/7XMM7loU="
									"cue export data.yaml":                                      "tOuESQ4+zw8TCR3t7YP9uaZENae9CkjelJwj9RehY18="
									"cue export yaml: some.yaml.data":                           "6EGVc/dSPQInBHde5XiVQRF3aeLxV2P9Ic5bTQH4ySg="
									"cue export .:one .:two .:three":                            "ZKbT28C+HcdbzfSOnrOcoNJuuJS/ncNbiNnwM+OqqO0="
									"cue export package + package file + data + packageless":    "0jkLfBNWX0VuljX2kiUgS2wXtXPz3jMH1S8gqZ1ur0I="
									"package file + data":                                       "/xQZK1WznsUYvUUSP+8fOSHDyQw2mc9hJTCcLfTOVfw="
									"cue export package + 2x package file + data + packageless": "e2T4kG7VT/QWXQswd9Vp3hSxJ3F2LCl8mlk8r1H1MOA="
									"data file inputs":                                          "ean4gOR+2da4vfN580+FSxeAJqMUO6CezfvKJ02qiko="
									"data file inputs failure":                                  "V5OS8ojzqb2Nv6rr2ATpElFOWDMBc8d4632jjMbh48w="
									"constraint file validating data":                           "+dNZBLlC2ESsBXWRzm6BaG8/Oxfn4lxjXFlnFpzCIE4="
									"constraint file exported as data":                          "xGe/PXb8zyd+hHl0UB3YKM2V9ZcNHfnBQ+Rk8Hz0Uuc="
									"-l static single":                                          "mCWQO8CrSgCMdkz38drksLuZLQCEMdF5ygeWC4bqY/0="
									"-l static multiple":                                        "NvSt6TqbSedSnJXa68DTrw0ja6lB4g+SjsKtzhOGJx0="
									"-l static multiple files":                                  "lTllQHDg4WRzv9QUVJTjP//ldyOaODb0iLs2ea3ltYw="
									"-l dynamic single":                                         "6+LPxPoFhf/zpDWlYbPxcq8oOU+wVwZxkftKT/LTOxY="
									"-l dynamic single with function":                           "ZPzsQQcppaiUlNaID6re9QQb8YBew+kmIvH3U+N5Etc="
									"-l dynamic --with-context":                                 "cswoENrpA6gcCkHPdV30qrR7qI2TjeMrPdrVvE2DRik="
									"multi-doc merge":                                           "g+0nw9O6rUkH0rsdMESxZ+lZ/eBeCfxoImQlL5GOexs="
									"multi-doc list":                                            "JwrQ1WxV+EYcvzBiCSsMJNUjxy5t+7+s3isy4EyAgBo="
								}
								upload: {
									"test cue package inputs prose":              "HawPrUIWAoAMBYpRO22IOmPIf0dTuDMer3TrQOY1i5Q="
									"test multiple cue package inputs prose":     "UHK9YSTM3ENIoaPP3JBbS2JDR9tSOwATfCt2BzZw2v8="
									"test cue package + other input types prose": "Iia3MccxAgC5febG3brtHrOAwodTNAyU4SVheFEfuU4="
									"stdin data":                                 "v9OwmkQb4jH+fs9aMS7vhEqqbVf6zJHmWdrOls8cwCw="
								}
								multi_step: {
									hash:       "J5T2K8S0BQT1PS6HQ95VOJ2KKHRP21S571AC5PCN8RLSURCKHBN0===="
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
