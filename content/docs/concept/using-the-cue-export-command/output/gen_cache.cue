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
									"default output":             "iktS7qz05YCzwvQUEgiPpO+s00TAtNGtpyVblxRujTA="
									"stdout yaml":                "//0AfrU0VRnjFU0UDc7xxuKGM4ztEsCAabKN44Mwwzg="
									"yaml:-":                     "zho6VW6jKfLyjo8YSbqt1pMyLj7SQTzJQGTW7Ir5QgY="
									"--out cue":                  "qdXW69XxCCROu4fRQpk68+U8F3JrYrK116hTnklKKOI="
									"--out cue no hidden fields": "sluB+m+7ygv2G/5vHuJGQ8CVi5VCz8d5M2mpGChWAKk="
									"--out cue --package foo":    "hYhM0kr++k4XVKLPzCEQPio1L7yBEwU54ysINgI7Aic="
									"--escape":                   "zN+XWrayzX1eoQTkFzcwGMV2Xpyho0F89plZYMDMO24="
								}
								upload: {
									"--outfile data.yml":            "Pv/Gs7hJoakiV1uS/O14O88t0eDeTUIVVs8vmJp8HYY="
									"--outfile data.txt":            "Qi7MMiWIx8t4VMcJ+eJDO7+e2XWQI8v/Z2nAqClDFtg="
									"--outfile datafile --out json": "P7EiK2Vz1oR/Ard+uas+H/8oCTv/Owg+xa0ohIGz+HU="
									"--outfile json:datafile":       "2PtLvcezkTsJuA7veY/7Xy6+veqd7KHGAApPjbGLj18="
								}
								multi_step: {
									hash:       "8MLFATM6S2U201E2K8K6F44PN8SN1FVSNMJKSIQO09BNG8S87SJ0===="
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
