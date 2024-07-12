package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "A1E6OtmOGv0uJPjt8bgck/VSX6M42wOgjWvto8OhL5o="
								"data: bryn (broken)":           "CpTgdVj1wKn/dGceL3VdRkeDHD+59wxM7wtYHzuJ3Xc="
								"data: charlie":                 "wrZeb287L8u2WdRad9EPoZ8r6ePo3qmDUyhf7XL+n14="
								"schema: CUE":                   "9WHDuzknhQ+m/TOA8Jn3uKrNpLhcsfAXt5cq0YSE0uk="
								"data: bryn (fixed)":            "HXYLOiYHhhEDoP2U4Dzqj3wyxdKpWJx6imNgGrJ58Fg="
								"data: alex (reminder)":         "65pz2l6ganhFDoG05m1TshIuug8mGoXk6XxAR+L2XPs="
								"data: bryn (reminder)":         "iUBts97VGSCVgZXZL1OYx9wGtflBl4cEiCUEoTcDh28="
								"data: charlie (reminder)":      "AgYZbY0cIG5PmEF+UhAaUTjsNToKLDsqtOzRidWHpw4="
								"schema: CUE (reminder)":        "jooM4BgZG8Hl2tAAd6NiHzRZEIaTY4hkAgrBZXEyUzE="
								"policy: CUE (too restrictive)": "hI0pGByGYVvI6v6d4smE07WSsjz6MLTYPUr/5DyDiy4="
								"policy: CUE (correct)":         "Zv72zFhSSsnZHYSW0BoTVbrVlcyhWc2DPLXaGK4ONCE="
								"schema.proto":                  "uayHs/mcl2k4lhmw+7aM81bDji0ndSegPjhbFNMfkS8="
								"schema.json":                   "PiwOUKTOy6zUT8nYmn3V0YXIZufx2LxowHM2atNRIvU="
								"policy.cue":                    "UOo581HE5hwkbRXr+tyxz799OdBpzUZt5r/Br4E3M08="
								"data.yml (broken)":             "NigNx9ToBZbOiTUBLW76/Owq+0YwUTC5BmH8v41u2ec="
								"data.yml (fixed)":              "iKhcFXm0Q80AvtAydx0wK2pdEUEstOEZgIUU5ScDQN0="
							}
							code: {
								constraints: "pP8fv4bAiYOiYTB/P5EnRG6QNLLXN8n7WK4DPJEoh24="
								definition:  "05JU9PYB6Xz8ZDeL2FOw7Be2trWucVgKapav0p8PMcE="
							}
							multi_step: {
								hash:       "2V3S959PF2KA1CACRFMQ16FQEF3D75DO6TMFHB715FGLQ2JVDVIG===="
								scriptHash: "3UTP5PNA8DAN79NI2608LE566NUGOT51A65SSH4PNGVB9HCPNDB0===="
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
