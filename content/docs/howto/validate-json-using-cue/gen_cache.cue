package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "u6/nVYuulxVFREjGkZnSKEVdSu32Swo//tTLTiuNxf4="
								"x.cue":        "lqvu5naQ1Mq8inNE2bXb8SuOP8YvrJ4uOog7GKI1vL8="
								"x.json v2":    "rv/+mPENrU6GxuOwVkUs4O0n5piJXz+fB2AJCCi8NnY="
								"fixed x.json": "TWWIT95J2imKr9LdOVGmt8EKy4wSa5Cu0Mgd7Jw6eEM="
							}
							multi_step: {
								hash:       "7H9C7TI07EP0ASPNSANKLH2S2KOUR7PIGOFDCJDRF5OCRTIBH3TG===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
