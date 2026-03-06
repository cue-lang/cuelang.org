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
									"default output":             "PhYjqw3veCvX4vxzKQeWr+Fk/bVE57fzxojSUuGWgnM="
									"stdout yaml":                "BA+laf4GLi1S3ALAKPBgS/FLoJl3Z9YUGkJe633V72c="
									"yaml:-":                     "5EWFDXutdrfer895wInw7cf6ncPqryyNhslKSbj3APo="
									"--out cue":                  "iCUFRVbe3qjk42SQVNITectio4vCA5z/BqiX+kKMvIY="
									"--out cue no hidden fields": "5nukLV4liroixZzmTdAvXNdMJlfYorJxsjpBiZmxSww="
									"--out cue --package foo":    "BycLCoFglHm0Lj32pv/rrr3hQ/ZFCFTAfxOJLFr0vRw="
									"--escape":                   "N2UtIVtOvMBMCPyN+W4dWFdjVH3BPKndDn/B2iujx2s="
								}
								upload: {
									"--outfile data.yml":            "iVNhjmYCp/flotOG3acYHMRPhUnm+4CYala6yV2B1R8="
									"--outfile data.txt":            "sSJxvNfldj39hz39qbxus6ns9aFJLys4gFt9Rja/2sc="
									"--outfile datafile --out json": "ZZWlbmd1UbFqiulsLRrX7FHpNtutl7Ul5/+70zGEnAc="
									"--outfile json:datafile":       "Mzbr0t4rGdjNTV7t28shufKszX1oT+C2ZbHvwomVN6o="
								}
								multi_step: {
									hash:       "1JA24330K1I9EKMU03BFOQJK0OL72NT6GRN1K34OE4LKBLKLK1N0===="
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
