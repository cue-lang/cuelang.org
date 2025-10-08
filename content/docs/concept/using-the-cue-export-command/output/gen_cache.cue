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
									"default output":             "kzkjSUFKNXH3/TxDKmbJwsISTGAdR+kV8HWPLnQfMjo="
									"stdout yaml":                "i/fm4dBhvTY4GrBT3aQuvzbinv1PAmNWgXN/WduFKDM="
									"yaml:-":                     "tIRfto3yOcw4auoU51bAbg3vlserrnvf1ixZHP0BxEc="
									"--out cue":                  "OveeiHAr+TJtUdCUl6ROpJK3Ipl5d/FJnyLWnmykeUg="
									"--out cue no hidden fields": "aiYx18CfpCUTSxiI+hQJ/bUvv5cKE98uPRpGvQtBpvY="
									"--out cue --package foo":    "hcwkbGxTaVRD5wczW9Z2l3XvKqbAWtLtCF6uAA/LRqA="
									"--escape":                   "p84wBMWvfKg2lCofwv8yBceVASEG+TQBVn0IPjIOvNI="
								}
								upload: {
									"--outfile data.yml":            "dY2uceaqwEDih2/IAAfU/fZw01avzQluAmKYcSjB5Jw="
									"--outfile data.txt":            "WFWOYZQgxpnO563zxfFSuLEaEYQAuhHKhCgXt4fBv4o="
									"--outfile datafile --out json": "lLpAaw1ftXPxL8+Qzr+rDg1vW2UGf+2WZRgujljmuwM="
									"--outfile json:datafile":       "ZjPqpe9ep7t8RfuHsqkQXwlIge9ZVOnz7oYAf4zd+9o="
								}
								multi_step: {
									hash:       "KH92LVJ42RI293HPS98UMEIMDV4QIGJ305IEJ9560FU8G9MSQNJG===="
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
