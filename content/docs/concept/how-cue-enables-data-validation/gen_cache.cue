package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "UjX+HV4rSypscOfKbnFNB4omUVpQgd5hCZmE1xHBmy0="
								"data: bryn (broken)":           "YAS/DpXkJ6sSUsuTX0jiUXuw4JaaLD2+FW/q0wbe2B8="
								"data: charlie":                 "JAupLS7zsk3z3nQ2dlYKttgbaARSAtN5DcaB37NVUw8="
								"schema: CUE":                   "vnAjE92VpgbKmHi622E+QnrN+vQ0ATx6pnm6+C7Cw4s="
								"data: bryn (fixed)":            "sSS+NXA38dF3SBISjjoxO86txqivpC3Kub9agx9FJvY="
								"data: alex (reminder)":         "YjXQt5mKFjt1tjONcxsZLdytA/pDZrWELn5IxpS0Cgw="
								"data: bryn (reminder)":         "QM8y05ZFLvLuDmt3YPvve3ClTO9pr9XKm2oyHqi9JXw="
								"data: charlie (reminder)":      "e8UF0tjAbjdIzOZJKX5r2gCs8Mvgm8YlFIzzuE/xOiM="
								"schema: CUE (reminder)":        "/ubVDQH0gieJTKhjkf4QJsZuNAhfBfTC2XqBs3icVHQ="
								"policy: CUE (too restrictive)": "DIylAQzeYg65GHWFOSICtuiUaT/wvXQtjDzQd5OBFfs="
								"policy: CUE (correct)":         "3EwadxJEvl6p60sz9tiMVp/N8MVU02BmQWUEBp0pWns="
								"schema.proto":                  "51lDSWg9zs7+LAt0fS9Q3/iIQujPL0z9i2dkQs4GG6M="
								"schema.json":                   "1rgdlrXM+9AS5Pu9r27WRq3NShrUkRb1QE3MeUnOf24="
								"policy.cue":                    "s70B+orVYdvYFq6+blWOJiVAuGJBU+EyhWTQevzGmq0="
								"data.yml (broken)":             "a1tPBUiLHBu3hm9G9SocZw7d6V6i35kMkLFs9lqMLso="
								"data.yml (fixed)":              "yoIgSByKc3FV9O4CvIBKtwgUVdJk+7dQpJKo6XarrxA="
							}
							code: {
								constraints: "uN8TJVNK9Rw/+6hJDH7gy/wiApSJ5RBBD+RPNODzxxs="
								definition:  "nUYCCfEnWvo/YjUHZam2uc/jwSa2CZoUHaHvpbiMZRo="
							}
							multi_step: {
								hash:       "TPKJULHL0OQ248VFMEDV4RVT1UI2HPUU2QJ4FKAEGLP0P42I09L0===="
								scriptHash: "I810RVUS4KMU003KOBIBKJ0OSCMTLPSLOID2M86CFKAO5BUPA5GG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
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
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
