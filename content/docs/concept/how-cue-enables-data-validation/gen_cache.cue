package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "+xa+GZaDwSHfsHUEIK7iuvuAXqsiwUb+R3Aa+PBZi0I="
								"data: bryn (broken)":           "tz/drri+pzwOoLkXiMFg3FAjiHsXNUmY1QSu5jHueZY="
								"data: charlie":                 "XH4mGpqh77mwYkPmlP/GSXMS+6y0pFGGuU9QGSeiNWw="
								"schema: CUE":                   "V0Hp9klXVotFQVvmK4bmeL/bcLdRXXho9h6Brg5nS88="
								"data: bryn (fixed)":            "Bdy5kaZzgRfCyRBWmZN1TzL3XOhJ+CGHJLZFSjxoX4Y="
								"data: alex (reminder)":         "emeDs64vV33NoIKxwsB9KWSECzYj1XwjHHDxJOOJoFk="
								"data: bryn (reminder)":         "UBYxSj7RADet+1BrD7HXFzrLBCdxxcl8VYCHXrFUlIU="
								"data: charlie (reminder)":      "rsDorGeWxKvXXYJMJqu6RquFTpFRNEFyM0pN5heofAQ="
								"schema: CUE (reminder)":        "NjD2u8WV6YJwJcM3mR5ZUqJRdLK3WLh9CF/zjJGzdFs="
								"policy: CUE (too restrictive)": "GzFfjtBAYCpbk4KHR/p2ufCJ9AmiI3FbVcbCFrlCF0I="
								"policy: CUE (correct)":         "opMSNi9hb0PMBkOOV1yudUJ7Cx0bpX2+kovqJTUwL7k="
								"schema.proto":                  "8OyvVbSi7clgDRLoDrDNgQpeYfH+BH4zJLqvTlkumAI="
								"schema.json":                   "3og/4dClrdELnsyth0dCCCJDVw1RVwscqmnmKULqaG0="
								"policy.cue":                    "abeCREXF2MeJq3PrH3GeppYm3OGOwCCnCblJZZBQPFE="
								"data.yml (broken)":             "GhC821j1O52M8MXYIkf2iBd2s9PlX6hE3YGEbX+roJA="
								"data.yml (fixed)":              "YquIs3rbrgLvMri40u6NPz3Ucg92WmrcX5NqTf/K5MI="
							}
							code: {
								constraints: "vt4N/URZj35+fD6QD7zYcOc1L0jmkuuhUOrEaeASq2s="
								definition:  "KV9ojGfzEM5YaGoAc5xOGIkwHp5cmgd/Au97WD8+m5M="
							}
							multi_step: {
								hash:       "CF44AKKDEQ2QTRU7JBU96S1MJP2OSUTH7N6R1LJ7EJRMLV9FMU90===="
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
