package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "WlnkVfCmmhaaKmCy26QiXQPhDT8F9p714poQbgr+3jY="
								"data: bryn (broken)":           "SIaQYg9oHNn9tZgMJadq9AUMVjLI7Faqd/XDzAoWLzQ="
								"data: charlie":                 "dL0WUoBB1WGuClRvuKYC5fXtye/GkeExRL/E2E60x4U="
								"schema: CUE":                   "DuTHJCFxggCl/FKUueKQkhMbI7G3RLngNleM+TnUyNQ="
								"data: bryn (fixed)":            "QAX/X46lyl0x+LBVp+282BV69tu10x7SOMYz0qS+3a4="
								"data: alex (reminder)":         "hjftW3nIDSrE2tB357loX1L1wOmiH5qlxKMbAVVU0C4="
								"data: bryn (reminder)":         "ssz3hOv3x/Yd0Qjet3WvbWAesKWSXiPN2eZL+Gry4og="
								"data: charlie (reminder)":      "8pnabnvYu7u0B4fn+q+nEJ0XDcC5Hd7t5T2OfulCnn0="
								"schema: CUE (reminder)":        "YyT6Bg9KkY+6gU8quBSWpuNbyvgz6Kvddc9Wm0DBKYY="
								"policy: CUE (too restrictive)": "UeFFVnHF/i1fF/bleAtWzSJyGafsOBA2OHpGBsNcPSU="
								"policy: CUE (correct)":         "wlD64d2weD/INFh8BwpuB8Lhne1UShnY3M2+Rtx/VQU="
								"schema.proto":                  "O913UuCL5iX9SO7qRfBdAvYhkyp/MpPVzm6gt4dkJ4Q="
								"schema.json":                   "Wz0cN2qwElRlXr3qxPCDN3lOzxlqLyi8c8S0AfvuvBo="
								"policy.cue":                    "Yn1f7xRIz5Nlr4iUYf9GhyRx+RHuL5FzsQG6G8+gwRQ="
								"data.yml (broken)":             "HbNp2kWhiRWkIvkQTHhd8VUavfMs2kG9O3wDCFA5g8c="
								"data.yml (fixed)":              "439KEzWlTpZjhHOvOMfp1yRZybYYpo7GBTN4fF/Xphc="
							}
							code: {
								constraints: "ZkUgrbMOHab0tGhpDvKvTcTYOlzmGXI6ihzrrwl14z4="
								definition:  "qSocOd7Y1gceQBI5EWnkBydV31aiLxGaLeCggdtTXcY="
							}
							multi_step: {
								hash:       "KNKRGCRDVD56R4F7U0BT7O41BGBSB0CPOB2CF0S2RQDP6KD90RCG===="
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
