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
									"cue export # package x1":                                   "efLe+U1lvgxZl48LRYmDu8jEXhs3iPttUvRDTXAIsns="
									"! cue export # package x2":                                 "4San55hu/ZpgmQ9iaGkDp+p/vtlHp6zQHeSDK6YzJSc="
									"cue export . # package x1":                                 "EQQA426wqk5sbP9foe/juNjJTxS+SvU9J8+VIDb8EF4="
									"cue export .:one":                                          "UMj3wRDvsIgP+CEWOhzI+165qrAuCwkHKawEufJiVPg="
									"cue export data.yaml":                                      "50CWHP/eHXgbK3c2wD0wDmPBw1N9/in6DxuH15F6YJY="
									"cue export yaml: some.yaml.data":                           "q2NYy0WV8JeHIxUwnl7FZpiLAYuYbPE2bJ+rGzap7a4="
									"cue export .:one .:two .:three":                            "tlWrXqtV2qqzjyji7U/1ia9MKKYF4J2U0DGItr2lrG8="
									"cue export package + package file + data + packageless":    "Rv1iO09ViqCg7/XhcUm13fCSZWqPwBN1yKDDPgYEie0="
									"package file + data":                                       "40GQKjipOwtVwQXV+YMr5F/n6Nd5Qw1XwN26aXewtus="
									"cue export package + 2x package file + data + packageless": "uu3f7qeWR7+D8NhmndcglCV/KIqtbOrJHcMtW6XQFt4="
									"data file inputs":                                          "M+9KZA1dhuUYAGa5Iv23Ipc9hHMsyD9gHVC2JvrDUq8="
									"data file inputs failure":                                  "O8jqGVrtdklmUzmeVuuhUhlX3CeKYlFcOY4weqayD3g="
									"constraint file validating data":                           "KEub3Y2xYP5FMwv29yMT6Z/cfij8Vy4obuybi6dmWSQ="
									"constraint file exported as data":                          "0EkUnvqMJ7DFjvW9V/Hz2RH7D8vpIOUH/waNTnim47M="
									"-l static single":                                          "AaCLWwZZYS3JEhOcktarZp40QcJelOcc5X3yB/iI/Ow="
									"-l static multiple":                                        "zyxXduI/5/pMmt9h5MKC6EE3vkNs2wMTnW6ueaJakQY="
									"-l static multiple files":                                  "S4OWySq76/5H3pohyHTz1pxrewn5doLD32Fl3br4uZ4="
									"-l dynamic single":                                         "iuCL+536ICNKllJKe00Vd74/I7LbTlsCSis4G0XoX30="
									"-l dynamic single with function":                           "JY6GqHINlB6ZA8JMEVJEz8GLGFb7Itp3mvbXtdqTXYM="
									"-l dynamic --with-context":                                 "EZ2k/e4u0CzM2PlBfw+K6dc7YEsEXq3rDzDU6CHcvFM="
									"multi-doc merge":                                           "jhVMroj55IzSmTH5LELScZgaOlKoMWZMFAsu40deKKE="
									"multi-doc list":                                            "g0uwBu4B50ee9xCTxn+lpBu67LGHwHjMdNLtC0TzFRE="
								}
								upload: {
									"test cue package inputs prose":              "yhEzZzNB7cgyEicxS6GTVq0C5aQckWqnv5jiYG+Krq0="
									"test multiple cue package inputs prose":     "lsO8P68DGYtT2HsAmm3pA7PR7nhZfmbgSXF9xY2xyyk="
									"test cue package + other input types prose": "RAQ00DjZ6BV5FdOepoNGeJ4+sy8DhaczcObLuI/vzzo="
									"stdin data":                                 "sxCYcrtOokHoEZFQkGpWidIlJQR/7/seLQnSgP/ERD8="
								}
								multi_step: {
									hash:       "JBO2D0FQEEILDVRNSAFNM2DA5F6COAAR0AHR3JMPP2VUE3LSJAKG===="
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
