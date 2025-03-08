package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "x1Cf3sw9Q+kHr5iodGlQZfgANj7octJMAeRknqh3ZME="
								"data: bryn (broken)":           "rFgnPZWXEPBAvYGoChzEWE++AOnb8yaHa/qYQy09xIA="
								"data: charlie":                 "00mujtD5JvPo+w5+WFJpnHWrX8CJjfuK8OgA0JzBcng="
								"schema: CUE":                   "LSSOEoYndHcP9SCx8qToOt/1YjsmVyHgLwZYqZkkmQE="
								"data: bryn (fixed)":            "29EpD6m7BTBCHOKgN4FTZpjVc6gutUqfULZV0xp+M/A="
								"data: alex (reminder)":         "qOcs57TAoKlOGp9J2WmTRKQhYRCwWSjrldSudXdupHA="
								"data: bryn (reminder)":         "7NXQzZN63Uub2CwmqSomkpKox9/znzy/RX2R9ozJTO8="
								"data: charlie (reminder)":      "bnScaCDCljSEjKtYUS/6ne/U7Yts2BBcCjGR4zE9aP8="
								"schema: CUE (reminder)":        "M4XR1X4hXfADtNdKGXGr0rB7ijLp2ZvNOq/asejK3Us="
								"policy: CUE (too restrictive)": "135hU35FIdTtf9ONdy2aoElKgKxZ2+d3II1cpBLxuI0="
								"policy: CUE (correct)":         "aKZm7HS5K4lnbJTLKFM7l1xD8QrrPvvjfcbos767f/A="
								"schema.proto":                  "Vfh5rvtWS0XMPD2wTUIYNEF2hzBW93fRs/G6/y+G99o="
								"schema.json":                   "AHHbeS9Ze4Q/PGj2idfi0gpH3Gc+jDhLmg3bkqzU3Fk="
								"policy.cue":                    "2BagNnJdNj4/uipPN347Hgcumo8vKljUsPLHYdReEM4="
								"data.yml (broken)":             "Ex1B6HdapPjyX0JUuPUtN1vxdTApqPzrmaAzXS9EMvA="
								"data.yml (fixed)":              "r6vG9oNT+BdzEHcDbT2W9P22dUgHxIoIGr9ClAVA4Cw="
							}
							code: {
								constraints: "VgnDnk6TSCrndhD8u1dkErr5mnYRoJH7lB7RWOLYJWE="
								definition:  "Uos+jVFTiIKOWtt7mZ+tVrXXa0sKuy8V5OA5U9+O3qU="
							}
							multi_step: {
								hash:       "8KJ0C3T1FTAKH2C1RLO0GDP6TRGC3QJVRE27N2UTS6QQ1QQB064G===="
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
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:21
											    ./policy.cue:9:10

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
