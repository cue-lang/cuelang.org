package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "nc69BSqHCqqx2uRy5li5HXkUCX+olZ85YH3qVlALzmo="
								"data: bryn (broken)":           "otcWbXNod9SuHQOhhBqECe7uCUUAhIlciIAdId1t+9s="
								"data: charlie":                 "E+Q1cPkJBlS3ZyeZP6D0YcLuFB+9/tkeP/zBEO52Uro="
								"schema: CUE":                   "aoS6y/eXenmXxknkLyfaYFNKqHHiRGVcdbnFbbia8vA="
								"data: bryn (fixed)":            "tAMVZ6XHYMaLhTtiZwbqjFTcN6lyLBqPpG53P5gKJjw="
								"data: alex (reminder)":         "YRf5qJ32GgzdXX+BkaNB0KeSazd3OMY6iEZRnvfTpzs="
								"data: bryn (reminder)":         "zI0qKQYILpFQSnz9aq1Ga5aHuYJ45Qy2jyZeBOGm6xk="
								"data: charlie (reminder)":      "fiMS9XPaFMI4eVX6RmXjIBVhyjvF1T14jXzEsDKsGz0="
								"schema: CUE (reminder)":        "Qu+RT3P432mLzgzKJl3K64f4Rk0D4QXztNbOrlD3Lfw="
								"policy: CUE (too restrictive)": "W5iW/X4iJm8qCn60YRht4bUKE3/pjefFOeNAEyGEFdY="
								"policy: CUE (correct)":         "RKeBwqSYanWieTUcX46Fp9PxKn1Ivb+Bd9gn1zLp87Y="
								"schema.proto":                  "QuicPFE/cPVjFqnnsqjy89p2q2izc7MXSnM0nBeIzhA="
								"schema.json":                   "i3/Cd22bEFqJG/Ff9YowPPnLBKcVgpbm0RVuazjLnV0="
								"policy.cue":                    "5xooCn0KeuTlYis/waiXNiWB4aciRl67ErsJrTZGZIE="
								"data.yml (broken)":             "+P5OlqD/q64QcUrR7fpmzecjnGWxVAjplb3Luf8JWlQ="
								"data.yml (fixed)":              "Q8S7DBqDrdeCOGSaozfPTo/fpotT1QdmPCwfYygslto="
							}
							code: {
								constraints: "vghhnp52NLKeiX6M3k0HpH8oDdSaDoFvt7sg1j4BMXM="
								definition:  "J9XVgON59Ui+pdW7f1GsRNIU8e22ehP/IeuG+NPafik="
							}
							multi_step: {
								hash:       "UUDIKUAQATKAJLK173FQJURIU13746CJBG2R7I991Q7N7IK63O00===="
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
