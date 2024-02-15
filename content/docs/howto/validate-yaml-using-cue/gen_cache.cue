package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "N2+ZIwHPuqWHs4paDYTd/taLK0KBQaquSHc+9EVQBIc="
								"initial x.cue":  "SMdE2xNJNpLT3ZQSNS4c7+36ElP1ga/fE1ZLAAn8C4k="
								"another person": "Owk08UJ2GkU2ARs3zwYxOzlp4IHSkhy1obLgD43PQYI="
								"fixed yaml":     "t8vj2pkAVPT+PLanGx1OvrM33kzoTNgPklD475mN7cQ="
							}
							multi_step: {
								"H0P5VGAD3LG354CPH24T4NF4ASM84BSJE6ARDM7C669FRJ56LBB0====": [{
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
