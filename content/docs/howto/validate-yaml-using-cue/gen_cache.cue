package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "LtU4pu4FRTAnW01cfNgx0jsxhiDZwvctP2SyiF1Dogw="
								"initial x.cue":  "I9wjlBvoGQI72eVx3/Y+Bst4oyju6JfIvx+mvfHLlDo="
								"another person": "uLMvG5M/JaIwuJYgRyv3vxGS8/rf4OTXYA/QsXeXKHI="
								"fixed yaml":     "nsKHF/V1U+Bt3tvlGs5SiVgIqQI0oj6hR279VWqCSB8="
							}
							multi_step: {
								hash:       "TAG4JFB21JUAATLQV93S1SGJMA72I0KEBRTR0OE7P22J91NLPVF0===="
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
