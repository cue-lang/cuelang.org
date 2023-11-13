package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "/lANCFzuaarYLhgjO9cPSIpDKMrKL6sRaMh7XKFemGc="
								"initial x.cue":  "5JI4cpidX3FFvJBSesC73KFjMm8nQhdI0CZKtx3tFAU="
								"another person": "5PdnQTDNQo264AQy3caaZN+hjOjGOQEmuXvy6C0gJHM="
								"fixed yaml":     "On9KNHV6F0D0OAwUVFvhXSzDgFm2HmSusWxv4iTPZEI="
							}
							multi_step: {
								"4U94QA2H5T8UU7C5UBKGNODOO6CC1BBDEIGQO6A52IOK0GPH5HM0====": [{
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
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
