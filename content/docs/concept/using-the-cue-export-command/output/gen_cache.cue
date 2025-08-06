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
									"default output":             "RrCz6hf3VE/XaJY2ljScBSgH0c05TTys1Q0k9la/+2g="
									"stdout yaml":                "CNSoDlbsHrnZ+GvdQ4Q5ZZCM9C8qemeIbxeMgnFFQtU="
									"yaml:-":                     "qgm2WlxemX2ocDQOUc/AJlsotbIZ8IQz0/jPuFSWZDk="
									"--out cue":                  "vQVlwFLKBx/VeKefkrb4wPL8PAc9p5r+DXz/dsXRLdQ="
									"--out cue no hidden fields": "AfoXJg5bngPd7aMAjHQvBhej9YN3gOc9hAep3LM30xQ="
									"--out cue --package foo":    "Ljh4NVjOomW2Y9SUhysY7DiC6v/LPbTUBjOXQC4lnO0="
									"--escape":                   "YvD1OsjExByprP3g/a9IEYSqtYx91gnPm5q4a6hyNfU="
								}
								upload: {
									"--outfile data.yml":            "t+x4BS5KZbFvMIckkC+YYrQ08XDfpBqjtJuGn7/hbmc="
									"--outfile data.txt":            "6KnqOyfokuxXfYby9LXJrDWyYDzexxmgG5h2b79tkaE="
									"--outfile datafile --out json": "lLeguzD3Mv8twD+0n2I0x+LORmdc2ZtZMOhLdAnAel0="
									"--outfile json:datafile":       "1NNnQYAcYAZtcBzey9cV3+oV2KyK0zyBONio+1nzGGg="
								}
								multi_step: {
									hash:       "KJR9RLVUDSQ77HL1S7VO32EMI829TQ0LKVV4BJS46DE82PVSFTPG===="
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
