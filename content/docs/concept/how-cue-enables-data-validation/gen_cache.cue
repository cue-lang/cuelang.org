package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "l18nLKktLLgbGsHu+TFfAkGTond006lTVIRf9SiJEPo="
								"data: bryn (broken)":           "EQSDCcbth9K/LRSmVGOE9hS6zzxHbkX9TSocuyCoPXg="
								"data: charlie":                 "SnZRnq699JGCHj7IvcEy/vDNxIXvX5pnm9Hqu29zU7c="
								"schema: CUE":                   "x1Y2QGO5g3wD7ZVFKRqqgGUbT+KZhVRqR+czcfv1UkI="
								"data: bryn (fixed)":            "lLCRT5tvz+30S++ACaYSTFUQZzWEAg5ksQQdfkBmucw="
								"data: alex (reminder)":         "fc55aa0H2ACIFvEU0GhX8EMe9RuNKohYBbRzkIywTRI="
								"data: bryn (reminder)":         "0vv/k+plDXDls4Ox/7oh+/MCJRYgGWzxBadumJcV4jg="
								"data: charlie (reminder)":      "XfNRvRteHix33QKfCgyfQ1Bu53P+UulCHB6BrzR8Mu0="
								"schema: CUE (reminder)":        "bhZMPiTWopRoaEnth1wedaX1Et0F0c5Cr6PWpg46Ot0="
								"policy: CUE (too restrictive)": "eiVhofR5MXjULOb/57d21RxIsqr6Mtzflyzq74AQ/ag="
								"policy: CUE (correct)":         "fgJ9EF+uKEIAZNmnBr79h4P2CDz1oqAzVjk7nOKJKzQ="
								"schema.proto":                  "FbT0s3Jbl28mi4gnpi0xgJK3ufAZxx6dfzyEFMhogCE="
								"schema.json":                   "sHAciu0dRpuWgnKBWwRRkQjnZxAI6lofjvpsAxQwasg="
								"policy.cue":                    "xJV+AeczMQ4liXbmB5FmqpWQKkrRLxvIIN3WAbM0YLE="
								"data.yml (broken)":             "FYN+xkJu9Zt3Fz5v+g1iEymXxW1rLXc5S5r2ajfqovE="
								"data.yml (fixed)":              "A5ZTtlMS0hDGJ7wWen+dYbDL7Ps9OxU6bdEt2sK91vg="
							}
							code: {
								constraints: "knUD6vou/MUDMN4LsRHrj02fme01KuThHS1BTz661/A="
								definition:  "+8L8+AVX8nswJqxUR7ZfDS+qtedY4qh5h/SSraNaakU="
							}
							multi_step: {
								hash:       "8PLTE3BPEKPS92VBQNU50UGLOKMREKUDGL33S7R4BJ9C4JLEOP20===="
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
