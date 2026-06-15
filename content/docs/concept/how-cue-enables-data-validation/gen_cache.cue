package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "T1A3GJyNiyv700WTnVZQLhRW9zzZ195m8dxjMR9pfyk="
								"data: bryn (broken)":           "d3RfrwrunSLpZFtcY1DrjLLrM7NmbpGoshHzvnw5T/k="
								"data: charlie":                 "CwSGY6hs1oygbyyJpljRi+nOrpQ70E3CFCiN9MrI3aM="
								"schema: CUE":                   "Z2t4q9den47JIVr11/WGP/tfy2fJpBRXBQNu46MDk64="
								"data: bryn (fixed)":            "sED0R+K/8nGE2UVj+wZOQ+5mgq5Zx9mWxUvAlJpBwj0="
								"data: alex (reminder)":         "yaHZHOO+O0Gy4IyHwmsvBaJ/K1AQ+KatIlN3ICpSimA="
								"data: bryn (reminder)":         "ChsZkVCZgaAkJCUENGhDO07ma0MhcWmjkRzjpvVl8io="
								"data: charlie (reminder)":      "QFnzzUGgetyo4T5QSAkG5RMBcsEvU9T8cQ+bfqTvzno="
								"schema: CUE (reminder)":        "1YITqpInggEjLlsRck42C/Z4spGzyGfvirjt+4EgD+Q="
								"policy: CUE (too restrictive)": "WM5lHXacm8s5+3y3gHqqEZ8xoHWg5dD8iCQVDHrS6Tg="
								"policy: CUE (correct)":         "R871pML4cmUApd4JV8y1ewafjlabFRtEDhe9EJhLStk="
								"schema.proto":                  "hOvGzw5b10gAwZc5eHPANpcxnQRQOFADfN7T3r8k5wI="
								"schema.json":                   "DBhnN6FVwN8PKGxgVg2cMnAJWleI1T9yQx9qcyNVf+0="
								"policy.cue":                    "GIfKnluSuGrLzGuOmy1EKhVgsCAjhlKwGgTu220Kd1A="
								"data.yml (broken)":             "WBMP+eb3891dKeRIEF91k9gv5EdIdzZpakpSJIXQLFw="
								"data.yml (fixed)":              "4vB7JIc/lLpdnD69miEe5W0o+KM7q0I7+xvoVHZP+Jg="
							}
							code: {
								constraints: "nAIEv49vyZQ3ONBdfCReX1txlTyBWxEaeWZj+wvIaNc="
								definition:  "ER+iMw2HPyk3dMP1Rr94MTAXXPqOESmK+95nOQNPufU="
							}
							multi_step: {
								hash:       "N7B5VQCMI9EF2813GBLHCGV3VMFO8UF0TFN035HR08S7MI3G42HG===="
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
											    ./schema.json:9:22
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:22
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:22
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
