package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "mKShGSOm38jcGcg3GTs7Yp+3ByPIfF60RtALrEjudzg="
								"data: bryn (broken)":           "qsvHl1uA7UnLa8lAgCS47X0DmanyDNUaPXxU56xX2Yc="
								"data: charlie":                 "KgztHj/k8PU1063HP65AmesDW+N8okANjRDeZXhPvVc="
								"schema: CUE":                   "HO2jp71zLr1oc2fDooCs4Yc9T0yJB/T9BM+SHf4U6oU="
								"data: bryn (fixed)":            "bAv6lhcceO+NYEGKOzeyXFfGN4z0yizAVJc1JkGO4rA="
								"data: alex (reminder)":         "2KFEGQgY5Zw0xPWWCDU5L09Qd4WEF/RXLzVGTPE0TOc="
								"data: bryn (reminder)":         "VnTmXHrn04G3b6drDpVGg7LYEzcjzbPaOp1+8uXp3Fs="
								"data: charlie (reminder)":      "6jv6XrinSKuFkV+df+8epXyFlu2VE1xPN+9A4m6vfCc="
								"schema: CUE (reminder)":        "yqKkqymS17AJM4THYiTK2wxnfVUOkg8Uq38C96iyS3M="
								"policy: CUE (too restrictive)": "2LUA5sUlbOA8tlVqLmqlOCDAV8cD4tffm2nN9v07xb0="
								"policy: CUE (correct)":         "bqD2YXVYF7RcYYAgVwXOWfv5BhuKqOEPEBL57Adxm0k="
								"schema.proto":                  "XQUhCpOTamAcsKVwvd0FMKYpK6nGZus5HfJvzMKo4EY="
								"schema.json":                   "zx77MMIDIpHQvZxi9ohVVpVp1v7HVBUUA72g/GCJnu4="
								"policy.cue":                    "M6z4nP4cxaf0SY/lv4v92tI9pQZf8HjREZUg6z3QwFQ="
								"data.yml (broken)":             "vNjTijNQNJ1HUbfAfm5mZIqdtNnnI4BEBhEDLchbZ+o="
								"data.yml (fixed)":              "JvCLRxG0EEjSYptLifdCbkcT2H2m16hIT0V2U5ZzXGU="
							}
							code: {
								constraints: "c0A+zHB7kTScS4Y7lMHwUoS70AZrBcBPnLjLYngsPIY="
								definition:  "pNCOG/6kZbSBsANZalL8X6luwjcE8eOmfvVDlraBJk8="
							}
							multi_step: {
								hash:       "S134GFLDTH688AUR1AIPESORVK79A3T95RMNPFNHUVVIHS2R05P0===="
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
