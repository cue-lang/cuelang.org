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
									"default output":             "svDJLMQmPoN9ep9Nlwd5LpD6LNsxQExwc6hBvf6Ui0k="
									"stdout yaml":                "voxIbmdS8zPHJvNBTy0UN+dr/Slrd56LwLQJRADruVE="
									"yaml:-":                     "DPFmL3QuAd25Q6Di4DfqrizASV9ZnjfltTwNV2L5gSA="
									"--out cue":                  "ZExd7fMvG/joDsnVWxwoGe8BuyGH8dvbvs7tuwlH0pA="
									"--out cue no hidden fields": "/ktr89JXtjM4ODaYyUrGX/E+Pd5WLZeP5UFM2CY8aTA="
									"--out cue --package foo":    "CY9EGN/VHVW26Lgq+AiroNbAl3xo1V7dqrDfwGPCR4k="
									"--escape":                   "3WxMGMF3T69fXjlqGdymmDwZgeVwVAHz/O4Qnbr2w2w="
								}
								upload: {
									"--outfile data.yml":            "7k7f9zxkMK2MawlgrJR2u8S0J6GDBmcoBF7vbrgjJgQ="
									"--outfile data.txt":            "X25qAs9WWK4rHavh7wnZoTsZTSmQfvvfLtUR8i8Pxfk="
									"--outfile datafile --out json": "wWOpWES9DSWRejgqpGPTkIStk8ArP58l45QcYvOeBEA="
									"--outfile json:datafile":       "yJnSlK7oMfDZK5ljGYvWSyH763FdGPhtmaDGHLHZijc="
								}
								multi_step: {
									hash:       "IG4S2C7BP8L241C7LDB4UN9K7HFGIC8AC4OMNVTF0NHGNHHONT6G===="
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
