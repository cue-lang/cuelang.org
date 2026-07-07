package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "6oZNaFpUx9vnFkD4newp/vKRvYnywMKY9tkRSQRMS7c="
								"initial x.cue":  "W+eJmbhsTYvNsYrXMNQTSh3JEGh6eC7PQlnby9wQ2yo="
								"another person": "2rVCrOfnEO1/o/855n2UZ0rkRubMn+0IB9TbHYeh3U4="
								"fixed yaml":     "WC8KwpjOJGihhAxLvenA4FOYmSLYohf2CeK2hae6tjQ="
							}
							multi_step: {
								hash:       "MQ4UKNREN6Q30J3LDET1UTTP3AESFGM3AQLFLOA3EFT1LJV0VDH0===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
