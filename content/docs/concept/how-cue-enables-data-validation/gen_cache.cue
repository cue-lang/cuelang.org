package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "JBtptdHzWoxCkMTiHYuZskyNqIDQ7boeY7QUqqr/sY4="
								"data: bryn (broken)":           "Iv81gL+WdwVVMtXGh5kcK5A0UQvR0d3bf6m1WZ6rXAY="
								"data: charlie":                 "zaEe9Wdf1e5qHiamjf5onCtHoACIcyi5V9CW1k6qIVg="
								"schema: CUE":                   "52mIZ9qS8aK0elTy1e2YDesypSt/24G8FMvPIwP3ooI="
								"data: bryn (fixed)":            "Qt8tVByQ3SDN2tcx/n/GI5dnX7wZxMgJ896CtYPiVCw="
								"data: alex (reminder)":         "RYybrbvN8PczzvC/5w5Kxcwbefo+cuBlVj/d7i6qYss="
								"data: bryn (reminder)":         "k/D4eOchzNLaJLkzqx3b3ASm0DnfqdVojrDS3FMagh0="
								"data: charlie (reminder)":      "rmkqvMHay1M1Z7KYnJYZaA9p84+tpvXmyOLv3yQt54g="
								"schema: CUE (reminder)":        "Wn8I/9pVJgMJokxT/vyMDVLUheNt257lkRwdPMzqWW8="
								"policy: CUE (too restrictive)": "1CA26A0xVdR1aox9buW7h7VvY1E4zqCBAnSC1xTIOmQ="
								"policy: CUE (correct)":         "4KMwHWdop7L8zbNDgtN8WXWghflA9vTGrIl4MKhnH1w="
								"schema.proto":                  "ijZy+mY5LWUd0Za4i8sW02veVUNrGqxFubLdDmZnM/E="
								"schema.json":                   "7i4ffKc/uzf1BaOihiDqRTogp5XEX1Ni6z2PfhuiyUY="
								"policy.cue":                    "OVAzGoDRLgS8naVQHBDPcWWWeNRbSYf7EWWvns61C4Y="
								"data.yml (broken)":             "2/E7Zh4XK3xsLKt/6XQm7rUFzzRvr3rl9EMzvA8tYew="
								"data.yml (fixed)":              "jeMw1/P7HrqW7y548+G2TjQFBoGSzx9Ip4QgblJoPR4="
							}
							code: {
								constraints: "xgV9ttJp8oG4an9BXpYq+wGYURFvmyfOB6ATc7cOeXY="
								definition:  "5m4Z34TlXQsq9+UTFgMt6WzB3IJMzh22XDQoyTc1QyU="
							}
							multi_step: {
								hash:       "GQ1I3PJCN76OIBQ4FQTL0GFL62B3B7QLBEGG23MCKNE71OPQK56G===="
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
											anInt: incompatible integer bounds >99.0 and <100:
											    ./policy.cue:9:10
											    ./schema.json:14:21
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (does not satisfy strings.Contains("25")):
											    ./policy.cue:6:12
											    ./data.yml:1:10
											    ./policy.cue:6:29
											    ./schema.json:9:21
											    ./schema.proto:2:3
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
