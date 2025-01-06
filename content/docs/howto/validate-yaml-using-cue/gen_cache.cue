package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "0/7LZ7/P9bxRqD4rqAeAb/RB/ao5olZc3A6YpDYh5s8="
								"initial x.cue":  "rLt0lGuCypQfTQ9KW01eElXeG+CtpkvQgxtyYfY815w="
								"another person": "IBWUSSyCHAdMSABBjIrIO4VK3mbXFeI/tiN/yXMlDX8="
								"fixed yaml":     "6NdSdYMlCsnmV6lPL3tHT5lU89lVuUac6iU+OQn74TI="
							}
							multi_step: {
								hash:       "2QU09J2QON86GEQJAQP8BHQ0HV33CQRKT34N7C3CNB1A4LUM042G===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
