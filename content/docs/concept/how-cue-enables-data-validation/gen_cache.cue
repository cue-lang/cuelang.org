package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "ySomfKtM9NWc8siNAgKWnbjUPeCUb8+6AIyc781E1qI="
								"data: bryn (broken)":           "zM80b5RWqaXE6j5VpDJ/cv/wYIz1hPBq7zz9PSSxQsI="
								"data: charlie":                 "wnnQFHr0a6GiB8tpsxoYfzZCUxtFbDMjB6doy/FZJjo="
								"schema: CUE":                   "nBuZcveJ+w/ZOECJDx0eMzPliBmi8doVHgDdu5a3I2o="
								"data: bryn (fixed)":            "qjI0GtvIky3lJPjylXznWeNZq4UIb/eLJ8+YpggG/m0="
								"data: alex (reminder)":         "3sdPF3jFcSz44CtQ5Yn4OiULcEsWlyizEJRqzKe3PJs="
								"data: bryn (reminder)":         "hTprcjJziiawSJraEGr1XvlTCot9OOSUw1tMp+ruK5A="
								"data: charlie (reminder)":      "7ZtPed3THVC02s76mOvcsZo6B46VB6IQmjCwWOb7fEk="
								"schema: CUE (reminder)":        "pZK0p7plEJ+6RrdcCZxbu0AMU7R+/ccomEc+Ik+deRQ="
								"policy: CUE (too restrictive)": "3EyMabQ+7fuZtBYJ5mZF30n8T/+yBuQvQc62XdDooPI="
								"policy: CUE (correct)":         "uKlu7Lke9QPE4FbAeTHXuPutxdhQDEnp6cHjtwvtf/w="
								"schema.proto":                  "HiMK1wFVdv0qbiu96XQ+ZYKGk8riPxAKWuysGcdXk2I="
								"schema.json":                   "60ZSAOJ2aw7ZJ/IO+evYBvu8wyuluucHJJXP50tOgyQ="
								"policy.cue":                    "j8GzzVF7SBixfapQnzwZcsccTvLda/RAG3XrtKVhTHQ="
								"data.yml (broken)":             "uC8nif0NjB3v4Vg2LuSzZP1nQ2iJxdkfpt4eXXSNCTc="
								"data.yml (fixed)":              "GOe/brF9ahsR0imd0NhseNn09ZEFV00OfuUFdWbTvHQ="
							}
							code: {
								constraints: "dC3W7ZFgE5xWwE1vCY457cu8lAyiHMUG9bAMN971s68="
								definition:  "TSKfuBo0CO2cJH4XAa+E84Mrqvrqz8z4LJBBknzyn54="
							}
							multi_step: {
								hash:       "QTURL4LTJ811U9MTU3Q1ODK7HGLB2P7E3EP6Q4RVKED0617IVAU0===="
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
