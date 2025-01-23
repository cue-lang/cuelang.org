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
									"default output":             "wU9Oq/fi5fdCT8apxUVLZkjrg1tNnoPVvdBCvO+M34w="
									"stdout yaml":                "fUaDVIhpXp/vgtfxkyA6nK7nzm3CYRhUGtvxi3fJfU8="
									"yaml:-":                     "IW/Jtpa1R9oFGmxQLOChbrD33ZcG/K9Lza3UgbbVWq4="
									"--out cue":                  "LCpvkDC5JC6bq4D3gtDUSVmZKxncbyjWZEbnzmVEJMI="
									"--out cue no hidden fields": "xIG/SaPU8bYMf6cgkWDESujmeezzKKY9pPIZ+3S7EKI="
									"--out cue --package foo":    "J87jMmlnSroeFU2yqkqVbVkY9vXumGMibnvN7Nf0G2Q="
									"--escape":                   "U7VbYcUTraFbqHn4p+ZbNmxAbGh+cXda5/tKo1UPnsE="
								}
								upload: {
									"--outfile data.yml":            "zAgGo3jH0ziUN4/ubrKXV6StJ8AzuwI6BC663rsguFw="
									"--outfile data.txt":            "EQB9XtdUsfTrHQlU1XhqGYphR6pxBAgF+L5+317Y1UE="
									"--outfile datafile --out json": "Lix4KjQz/RzPNITZG88Dfp2SGIXwu6V56wMfQW9ZwqY="
									"--outfile json:datafile":       "1PR55doCf3/8MCWk44I3D5Y2wp2Yohmng3q/ljRqe5s="
								}
								multi_step: {
									hash:       "QADL2JDP10FS1ITGH36FE3HI5VOQV2B41OFDKCS7RO92144QQDD0===="
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
