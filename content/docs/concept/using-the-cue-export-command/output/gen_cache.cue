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
									"default output":             "4AL9I2qRCV3iNar+mUcTDdebcDuNvJi/j3b/cbXm9/w="
									"stdout yaml":                "SLipSn/NmzkYfUZqAzv2n7i0aN+qlRiGGHiDKYbRMkM="
									"yaml:-":                     "EINqied8fr3aiJ9akmKbiYOouhG8P/JfXIZLEZgL7w8="
									"--out cue":                  "QQPgTVj0TUkSRNNSmyHLVTvtz70/nEFP4U6CK01tMLc="
									"--out cue no hidden fields": "TxV+yJOiP0gRmNQkvTXmd50FKKqCKdXt0lrEBgPebcU="
									"--out cue --package foo":    "yftVsTGUjVFD5PsZF58GFWKTOJFeVzMkmQ0xH6JBC/A="
									"--escape":                   "NDWNHmh0tuVda7bXS9Gy0ogP2dLSkttHAkgsYftKaQA="
								}
								upload: {
									"--outfile data.yml":            "DSXBJIRYsF36egmBmsmH7SBDMQE+efZB8r1F7tE2Leo="
									"--outfile data.txt":            "5VVxaRlHE8rBMz08IIHGHs5v9o/JqtEWYky/WrNKu+c="
									"--outfile datafile --out json": "DVnIHvQgquwBCEJ99qfxmJl6/b9FCxCCIOwLq2Uw0aM="
									"--outfile json:datafile":       "Y6dsq0KqJv3vkV1l4ofHvX8F62JbisaA+3DQb+tAQds="
								}
								multi_step: {
									hash:       "871N0OVGEI0DEL2D81ITJL20THCLBOG7188FQ5OIU15STADL16UG===="
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
