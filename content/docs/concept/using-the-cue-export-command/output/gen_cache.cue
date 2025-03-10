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
									"default output":             "zx3aoWrl7YfifypG2ZlecjKPytlnvRMmdllAeomRqC8="
									"stdout yaml":                "mRSvj7+hFTojIGbYfbNvIcUErHJQgn1Kh8lAZ+hsFYY="
									"yaml:-":                     "JFVO5IReYVSSEu5id54isFYY2V86p/sEkrqeY4pZaj8="
									"--out cue":                  "yVCElvQ2hcsu6OYw+ULyPjkgkDYLH6d2i3YOq4QDEa0="
									"--out cue no hidden fields": "ZGi0Bv31ze86mm4+VOdaSgzRp++7rcE1CWM56JpgRRI="
									"--out cue --package foo":    "G451ARtctS3aSRCr+KU3BJDsV071pEPCIejjPD9EaKw="
									"--escape":                   "b8Q0VlDCxGyZ/u12JBqqIpKGFHb4n8c0L3AuJAsaN/E="
								}
								upload: {
									"--outfile data.yml":            "N5w3HCCDJkqbtY0Rq9Y4Ldq712XNKLyjuG1v9OIxPSI="
									"--outfile data.txt":            "ViEW4jz2ashsUaGG7AF0D6pybELtr6iRSsPSolLCAtg="
									"--outfile datafile --out json": "ATsqfmQl1R9xm0teEmBPtGMhSwpmU8T9jFeokVfZgvA="
									"--outfile json:datafile":       "wJqKeOxsSaDvMd9CwEIv+FEemKEDNUwuitJw2mzHX8Y="
								}
								multi_step: {
									hash:       "BPD64QURAIGCB4TUH2JAAU748I0N19EOOUTNV6HN5DD7PKTKR0R0===="
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
