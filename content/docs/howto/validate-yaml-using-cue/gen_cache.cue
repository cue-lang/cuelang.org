package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "tj3CWUZAiEtVs7Ldj9zel9kMLeKV2jQBEI8V/BQ56mw="
								"initial x.cue":  "EINTPvQKetRVQGnI5yzrF8X/OInbMSwXkudacCqctOc="
								"another person": "03HN+FLomV9YObYXp1dQieMBoKqtINX1284SR0Lljx4="
								"fixed yaml":     "xrc/kqTwYvGaDGnvyb5i3DiMDke2eCt6rziUbPigjpk="
							}
							multi_step: {
								"OFI19QC6EHUVN02LVJA0IGH1QUVO74G2OGC5OVBQJ13OA90G0KE0====": [{
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
