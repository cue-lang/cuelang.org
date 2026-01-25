package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "NmfDXKT8v9UfdLTd+0XsiL9T/3TH71zOkER3e1OTj1U="
								"data: bryn (broken)":           "kMkRmojAlvWFpejWj/n4jds2D3PL5DDX4xl+i1ILQYU="
								"data: charlie":                 "7QrP94mrBNqkHeEfMLhhckew+4hMKAI/PJ4/5byDAm0="
								"schema: CUE":                   "C/RLFFRruCfdEFeleFQbkEYS/oovcomWBHu/lvuTo2Y="
								"data: bryn (fixed)":            "CzR9hq2+LvPkQfsAAFJSRtiE/RH+RdFPOFr7KElfY/o="
								"data: alex (reminder)":         "NHzaaIn7lnVICGONqbb8gkapESeSXYPWtcQg0GUHg2A="
								"data: bryn (reminder)":         "G+ilAYyA7DynaTh/Pc7mt4YCFSkK7D9sDXHyXq0h2YQ="
								"data: charlie (reminder)":      "PksP1R8Fy99mZmuas0AvzXeuCWICVRpSskXLkPOqrPU="
								"schema: CUE (reminder)":        "KiRxnUna9qV/0+BkYfkw66+uz1p0CQ+fOyAjHfjpUPg="
								"policy: CUE (too restrictive)": "8ASI+bq4g7yabgPp/Xurl8zkVbwJ1HY98J51dNDQkL8="
								"policy: CUE (correct)":         "sBJilej3KA6VwgGKQ9bHh+wwuIP8jbIgw6rpRl0fjuo="
								"schema.proto":                  "5X5qQmLoipR+e3vPOAyHvQ0/ZQUOkn1nTQnQu8Jfu+4="
								"schema.json":                   "Lq3JNq+LvwYwb2Lw9lmGeSO/WmVlw51Cn+/FxP7Z/sM="
								"policy.cue":                    "EJtG8fZ7+sbiBwasuGgwxxWuLdMydRONd+I5nCrOmdM="
								"data.yml (broken)":             "qppzj65rEDiuKWdPxwb2lAPZ2oR2b4Db60I+oZaaD6k="
								"data.yml (fixed)":              "3bDNRiWtWd5uBZOhoVsvpeRxbqjyYOZwJ8SNrHDTtgU="
							}
							code: {
								constraints: "IJouPcXSX3OO5oTNdxhOYyrcY3p+GGwZQlhWXUVmBZs="
								definition:  "vibOCDupoTWYnHz7LyPm1/If7jmnRPE23COQlWh+V1M="
							}
							multi_step: {
								hash:       "U5H5CN6J9A0PMIBBCBFA75DE1HSSN46AP9D8NRR7N6C2CNO3ANFG===="
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
