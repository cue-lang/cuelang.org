package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "rlT4wnWD1N6ZzLJk0usHy4M7fAk0n7qh//dWiUP8nDU="
								"x.cue":        "t8CG1qflUtITSbD2ATFFsPdM/X3Wb7o1TKi3Z96Rs1M="
								"x.json v2":    "A8qiAJq5VGBiNRV9emjaXg5TH9efkpe4qjdarcdeD/8="
								"fixed x.json": "LoXsgu4+fTm6GkFP23lNCIzyZhJgzElX1VtwVCmJCtU="
							}
							multi_step: {
								hash:       "V3H1MUBFU7706NOL1K5672J3FDVUVQ8KVLK4FQ6J14BE6TETE8LG===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
