package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "E32tDWVS57I4zcIlbXtp2OrmsxdhCUC1AtUkF/V1SUc="
								"data: bryn (broken)":           "av5OSWtRyMd3Mkqfy3QkUolUUMPae1YUDgs4NieSr54="
								"data: charlie":                 "on0bEHfwr0IXp7fj4w6OOu6x2odibynXM02y3r3E9ag="
								"schema: CUE":                   "XC5xxVbd9j+fsAH+AQ3o3NrvayBHBjtLEimY8g5yKo8="
								"data: bryn (fixed)":            "VtSHTToYy/PS1F/sCiwKIckemRwgLh9FasYE9Bd+9Dk="
								"data: alex (reminder)":         "KLHyVvNriDKep6AhnsacH+rJ3Ofdu18MAcQInqiWekM="
								"data: bryn (reminder)":         "PRkjJ37CW/7wK4wepPHsIN4X+mmvsYgh7SvBUI9rdi8="
								"data: charlie (reminder)":      "qDNmsGz5h5sScLrZtbgC/Ly1xGLLJjGpRaLcROdAPrY="
								"schema: CUE (reminder)":        "yy55peLQJMwqfGHyqVi9XZweLtPWT7LbuNlt7Vy9OB0="
								"policy: CUE (too restrictive)": "aqa4aFpvose7KVzEL8m+4KZCfvIioaVgIZalCCq/UkM="
								"policy: CUE (correct)":         "hZ5m9vzZPWZ/MM8g5VFtIKCvYUyQNwzlzt/CJzNXO+A="
								"schema.proto":                  "AcGHCzYdHtTb7FMxMvPz6mlFR47ajZ7MouMlpGofBWc="
								"schema.json":                   "zBa/vxMD02zHDjvjFRqDQ5L6DsT+gh2MNlwxo4eocY4="
								"policy.cue":                    "QBlZ0itsfaM8WNOtWXl5NmIwOsdKyJIpctSvR6elMvU="
								"data.yml (broken)":             "kxK6XLBBkpIoq1+n0dWpNhKS4J2jWFZ9y3vW/kLkFg0="
								"data.yml (fixed)":              "1XqhfNLFyxBhoRJIsUOOTJRigwxxdOgOUHpRUZ4D6wk="
							}
							code: {
								constraints: "f8xGcPD0RWaaxckQVijskH41pZ/JmkIQT8tC9nJOJgM="
								definition:  "/zEBgDfddLwppR3nylcF01vxb2jQLmYtY3/YBKKrBNc="
							}
							multi_step: {
								hash:       "AQKGK1TMDB6H7DBQCSH6VTRJ71AA7LATF5JKOVI70RGB02MNU5O0===="
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
