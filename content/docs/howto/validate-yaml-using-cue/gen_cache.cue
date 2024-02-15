package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "kwYu44sOCr0GqFpjZGo97MMurwulF1lrz7m0pAEZRbQ="
								"initial x.cue":  "OGaxmV4IgD6+56tGmkg/IKnYlwgI+j9tihKMZLILzlA="
								"another person": "yB7qiXnoT1EBY+2YI9SaQYeQXuZVhQPHZ45MDcZfi7U="
								"fixed yaml":     "bqFusl/BK8WU8c/NIVCcXf7NdN3JGfQbsSmwrGy/Pd0="
							}
							multi_step: {
								"DIC5VMITRRK42UHPBQUFJ8V78T905I77SSOQHH6MFE21044FEBU0====": [{
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
