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
									"default output":             "3R/B4BZT29PypZWBQS0XkHM+irQuSzXwvpUKVQ3KVFo="
									"stdout yaml":                "nZVje1FKNoj0wzrMdv7OXSKpW4bL0ph+HIeNvWg6oK4="
									"yaml:-":                     "siL7wEyLTghik3iFuCCzSmwCkYaFBfu7ATlCq7U7mp8="
									"--out cue":                  "j0KuU0Ya5BYF2lEbY+boCvWISDJXwxTdSVMu8ElGZWM="
									"--out cue no hidden fields": "8tm4kNarixDjZnh7ScSdhIAm7MDskK0ymHFuNAMi7vI="
									"--out cue --package foo":    "Vcd9K9iRLcJZWnkNpgMKEWW2ken7cbacHn0vnzWJgTo="
									"--escape":                   "cv7NqTIgOFNCVBSvWAVjXjS3OXtHrHgeL2mgR5BI/fc="
								}
								upload: {
									"--outfile data.yml":            "aIExDxCbziFGqEdscLcjSGCB6D9c05XbLdQZPFEjGvw="
									"--outfile data.txt":            "tLi1reTahe47QqBXqRH+HTbaZdDBpKROg/8BQpnYAI4="
									"--outfile datafile --out json": "IhzxwffKBb/lND6x/eenz5joc1/vwfTnNUnAOSzuI8w="
									"--outfile json:datafile":       "i4KSu4LE/8GAkkgyQFqBuwwcDDJvcRi8rh/y04S76ZE="
								}
								multi_step: {
									hash:       "DOF0VFR34OEQBDAQ6L8K1O68K4NJ20LALS0D80O1OEKD5VBVQ9L0===="
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
