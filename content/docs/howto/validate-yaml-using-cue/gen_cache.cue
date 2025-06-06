package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "fJtBYYF49W/jDSSBt/Ac3BB5jrck+WEJW/ICyqSVXRE="
								"initial x.cue":  "Dicgd0wIqTCYcbhMW6HsDstSBJf/OTmjxK2k1gd99a4="
								"another person": "+5W21WNm+pAKSHT5ZgRgWfIIEhqG8YlYky5OZXDO7OY="
								"fixed yaml":     "0hi8u1qz6sOu/H3J92wYcpBPN9Av1D2+27Ixa9vpUEA="
							}
							multi_step: {
								hash:       "6T9D2MUCGIEFOGCBT5NOO9RKP74J9A6A37BP50NC5CH7Q87QF07G===="
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
