package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "mSmB7hRg1GjnMXqoGdGUvqz+ircyA+NriJig/OEG/5o="
								"data: bryn (broken)":           "tboztOwlg870mE9NhK50Zod6uGaTd/NuKCA/7g6ZXqs="
								"data: charlie":                 "hGpg4ph6F/1BgB9qqS2oHA1i+7HUW2QXyJzE4dlYPFE="
								"schema: CUE":                   "g1NSHpiyTyMUC6xEvoi6R07WmPC9k9am1cMjnhv/wZg="
								"data: bryn (fixed)":            "dMbow3I/U2wLMP/YLAhfJeYGtg6788TgyaFHKnVgaDE="
								"data: alex (reminder)":         "DhzvpUFwm+ZRzR7iMhwAzbcPsBSSNqjMLJ+Y6l0Dg04="
								"data: bryn (reminder)":         "lmXeq9Qres1Gmo32PfJhB8USTcGgjW0GD7ojM6a54QI="
								"data: charlie (reminder)":      "ylSla7RSh/0LUAww0VRtPM8vv8g9h6mTE8P6BVJ3FxA="
								"schema: CUE (reminder)":        "lCbocegq9IgBtg+A1oFO0qhIJCO4EleHuMlipXkOwig="
								"policy: CUE (too restrictive)": "YO1mVrgbGxEctcyAi9uNV62PGmRObQNgPII76uNrnro="
								"policy: CUE (correct)":         "plD5IY0oymU87XhJU5bCKAxGaA+n0kEZKxpogDJRYWk="
								"schema.proto":                  "cXQqHOwo4VRoupxbXrnDAXA376gpX1H4yZ4FpA0QTm4="
								"schema.json":                   "6TRPyvCQIlfyZHZcXHPp2nmaX16AuHLPlJMTiGqSEEw="
								"policy.cue":                    "LOMfZ/rHL9lHXD+YhQnIRvYsyLM9hTCiiy8JarMRlAI="
								"data.yml (broken)":             "NrIamuGlyAujOfkf5UyBuY9Dnrq3Be6cWw/SGz7+xjQ="
								"data.yml (fixed)":              "D4cqrORPz2XzjgmlPH2JIFAuyxxpsW+TWtxIVlo9C3U="
							}
							code: {
								constraints: "s/fR941dq87YgPQL/dzHrP3L+Czp+DDiL2Ums+P9Rv4="
								definition:  "5ZYQ58LiQdPHGwtZWJg70vkwDWOMocBemj+wLx3F+sQ="
							}
							multi_step: {
								hash:       "GICNC4M0HBP38AD9EH33NBGFIV4SOD0A1G3O1VADN15AD1H36L30===="
								scriptHash: "5IRU0HUMAKN4O1TE41F2439MMECK8AS890TU89R3REV16HVJRUN0===="
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
