package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "g1gVHExFiF/gfsgVsH2LGP+DYdYS4ETYEZnY+ECxbGM="
								"data: bryn (broken)":           "rZ8C9fIL/X8Hu5ZPizt/0t09e+6jzSqoupoI/d0gS+M="
								"data: charlie":                 "/vTu8MBCFT6TXDm0/LWnsStWcEGwkK6AeGoEJFBGry4="
								"schema: CUE":                   "IG5Vb0ZbuvZhiOo1goKe2SQWsaCUVUG69pzQmb7uNdo="
								"data: bryn (fixed)":            "0fvLOsx2CyigD+EvQZqP5pqXu/yk9lFqe+insn8st38="
								"data: alex (reminder)":         "NUP5OVUTFlIIdrAzsmgDRNgVVPykEqmPB1UOADFaOs4="
								"data: bryn (reminder)":         "se5SNHLSzwWY9ibr+3TsD+fk9ZA9SXATQJ6JkOsVceM="
								"data: charlie (reminder)":      "cEpoAKi0ojtCC0KjcYgBnT8B6gfyHuHzEtREn5yAisA="
								"schema: CUE (reminder)":        "VOrur0Am6UM2kokJqqiudPxquprlRI7lrE38Mc8u01I="
								"policy: CUE (too restrictive)": "HJaXPxyuk8vs5EtnDqfVaIhIfvN+uJNHMoDPK4C2Ksg="
								"policy: CUE (correct)":         "V2L67wI0rd3SHaBhwrBlCS4ZpCHIuri/7kzou8C3uGU="
								"schema.proto":                  "5hCIhgElrO3q4rqqOXP6CcO2/kMaFUzL/Ymaz0URl40="
								"schema.json":                   "sXKkgp39GI3OQIZyrD7IGL9wKATSOXEEVhNAnxUgnXo="
								"policy.cue":                    "2s6pKYZS38AC1T5dALqLPBYz7Ig1iBZqDtNUVya5osY="
								"data.yml (broken)":             "e4Wefy8TTkdz/oZ8TltRWmIV6NhZVsbWS7XfSP8G3t4="
								"data.yml (fixed)":              "8D3kzqKlMjRiO/f0wPXTU5lfKFeixFCIiMA/sht2xTw="
							}
							code: {
								constraints: "HsXv+CWvPSPn/XQOMr8oOaJAI0YJcEA1/LA2MYXaFV4="
								definition:  "xRTZQxidKAz01TzRfu1NL0HZ5AbvurUq9hXxTgRtJ7Y="
							}
							multi_step: {
								hash:       "K2PUTSL969KTUOTIRPJO201E7NM61S83U6GLAESLQAS6IJB61GGG===="
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
