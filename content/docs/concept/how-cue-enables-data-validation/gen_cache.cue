package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "r0l64gwKDOoO+THjh9hXsTXhEBgRm1D3zM3bImjCkBs="
								"data: bryn (broken)":           "142zkI5X4vl8Iyr+MSMFT9MIJtFTLZiOSGBKRSIDZGA="
								"data: charlie":                 "mlHsXR/WtjvCfgrfnt0CNLbwnhC3zldbIS3lW9rmND0="
								"schema: CUE":                   "UFZUac+VbGFtv5MLJ+f8yrclsDWTZ+NXmm5Jz216Zbk="
								"data: bryn (fixed)":            "KeGa3yUTJHyqwSuwQws8efP73/04uVd86LaoYDs1760="
								"data: alex (reminder)":         "+tiBeazo8Il6ITKY+kf+ygVPB4MeMuJl3zqPz7wv36Y="
								"data: bryn (reminder)":         "j6OP8b9sdpECB5/kws4bqhIyFsYPM6P9VYvs266IwOE="
								"data: charlie (reminder)":      "JuAhjszxqGf6kckehQKlVMndjUYyLzo8LTsCXs+lpUY="
								"schema: CUE (reminder)":        "ZnAhtR73estMqNaH+G6sMg7YCTQERqws9OBbs4W46y0="
								"policy: CUE (too restrictive)": "0QrJ3y7DHf0p0eYOr+uHlbr66Aae84ocF6fMy7F/y8g="
								"policy: CUE (correct)":         "3S0kO3pfYe00zxYr9pSUOXScD8lxHSiIPPU6S55dcmc="
								"schema.proto":                  "szGV9Ju8Kfx9lPFTCPmwT4woCGmRxhg0xpVNmsPWXj4="
								"schema.json":                   "XghB1DhViGlj1bbgyO3/p5lvI3teaLSokoxZpkN86O8="
								"policy.cue":                    "Ddu52XC3IBXPpg0jhPDUGXtYaF2bQrzbw3VP04mlnlM="
								"data.yml (broken)":             "qs/VHP0cME5Qna5yVON0eKhqKJwPxjImjT+/JvaJGsw="
								"data.yml (fixed)":              "4z8r967XyuExn4VMahQSHLeleb2hXc7hx7U9VIwokzc="
							}
							code: {
								constraints: "vzRBfqOGOs9bJF8Ea/4gzm876BxaivgKvq1kKJR2K34="
								definition:  "PbRax5Mysh9GyCYqCXmEzIkqAlg/r2cOAqkTDYM/Z4k="
							}
							multi_step: {
								hash:       "L1D8N7D74I3HG4F0F8G1LCFSRO3B7I9I4NKPO1D8P8R8DOH15B90===="
								scriptHash: "RN67I70D239QM6H3VGAOVAJ0TE0TU4E0VRE9P511LGBLBQKT396G===="
								steps: [{
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											type: 2 errors in empty disjunction:
											type: conflicting values "cat" and "goldfish":
											    ./bryn.json:3:13
											    ./policy.cue:3:18
											type: conflicting values "dog" and "goldfish":
											    ./bryn.json:3:13
											    ./policy.cue:3:10
											height: invalid value 2 (out of bound >10):
											    ./policy.cue:4:10
											    ./bryn.json:4:15

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
									exitCode: 1
									output: """
											aBool: conflicting values "this is not a boolean value" and bool (mismatched types string and bool):
											    ./data.yml:4:8
											    ./schema.proto:5:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (does not satisfy strings.Contains("25")):
											    ./policy.cue:6:12
											    ./data.yml:1:10
											    ./policy.cue:6:29
											    ./schema.json:9:21
											    ./schema.proto:2:3
											anInt: invalid value 5 (out of bound >99.0):
											    ./policy.cue:9:10
											    ./data.yml:2:8
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3

											"""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
