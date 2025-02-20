package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "E/3ywX1uUg3Fc80DGZAJg97OR9ySiggi9VWd9636h1Y="
								"initial x.cue":  "nlldT0hC7ofKw/50Ifa1CF1qRJICWasrwLFI7fYshuw="
								"another person": "gDhJ5bLP9hzWlNNxNSBSzEeBh9Hd2uD8b4r5M6ubGow="
								"fixed yaml":     "EkZ5aOzAAjhpbFzv8z9VKs2/vm0fGyotxsHDnHHzFKk="
							}
							multi_step: {
								hash:       "O3O7VI4AC96AGA01SRID9VNMM446DS99S9CB25BC7KRE5KEG8T10===="
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
