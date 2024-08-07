package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "pJT8D1YxlJyaTVsNpIF1IPHizxH4SwTDbQm1e9N+Jdc="
								"x.cue":        "zi58a4zdS47zP9qpgorVh0ceqHX2k/0dZxG+cCzKTP4="
								"x.json v2":    "ox1nqH+QeW+Ybk4gSDvM7PDlAg2tB0b6+roD+vm0UJw="
								"fixed x.json": "Dd0WbNqSxoOu4uVUaJEVJxCOU644zGCm8J+bhN8Fbw4="
							}
							multi_step: {
								hash:       "NUJMA45GGVHBEIMDDQFMULDVR4OBUMI5M9PFSUODS3O7JM0PT80G===="
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
