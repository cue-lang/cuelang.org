package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "isz+DVgg5piaVwwhR+7rtFkF8kB1MQExUrQb/6Z0jDQ="
								"data: bryn (broken)":           "tgapi5FsRalKm1Wiwouzom4ecGOjo89oChr7k5SwhS8="
								"data: charlie":                 "uBgJBTgG1cSCXxiQJw45IedWPQVcKhTZStv7urdidus="
								"schema: CUE":                   "KIMErvLm5dqMv9/datsxFIE/5dwq1GvFjoHc9j85zEE="
								"data: bryn (fixed)":            "cXfJMKpGbCcgedIkYW2Q5tV8MWALgHQQ2frhzC2sMs4="
								"data: alex (reminder)":         "UKWbAudHtlsde8/tXrEZ1NPzgJ1MQvMqChmnbs8poao="
								"data: bryn (reminder)":         "9u9IHgcbDOmpHW4uilrq7NlAHz20/BsWF6DTJAPo8G0="
								"data: charlie (reminder)":      "yzrDUAKVHRCrer2Na4QZCWOT0Hu4d61nlhRIsH60x/Y="
								"schema: CUE (reminder)":        "GO3Exc6HEZD2JmkE9XxJ4n8mlLg9IvrXeZbSFt0MJbw="
								"policy: CUE (too restrictive)": "XpQ9n9K5zRe1+qS9bvwn6qXjbhZnniQbG3quz5Hb6j0="
								"policy: CUE (correct)":         "ztbYvF5BA9R1vLoRExHluSr5zYmAAviaxnuIjNo/DQ0="
								"schema.proto":                  "BUUPxEQqtTSUvPQWf+WA6VxLo+B2uEaNC4SxnlytTF0="
								"schema.json":                   "OOgXshk3OVpUV01uMlhnoFGfTPbXPxSVNtm4RA6/4H0="
								"policy.cue":                    "ic28lk0WQnn1707Dt1BbSYb1V5UkqAzXL8Lv8SZU/pg="
								"data.yml (broken)":             "30yQdNMFZLeCXjGrj+s6hH03H46HjRnAZ6nlxEqcrHQ="
								"data.yml (fixed)":              "2qyUUjy2q+MfyBmZrFMm5/qbZe9XYZ/CzQ4c02Awauw="
							}
							code: {
								constraints: "ysguRwg+sj9Eo06Z5hx80p6bw2WI1p57u3skt8eRK4M="
								definition:  "ABLdQS5dMZhFGsHNW+F3FJn05S7XbwHdomtUaGj9Z1g="
							}
							multi_step: {
								hash:       "NE16MQECB1QGOAQ41J1AB2PNE2DQQOE56N6I4183B98RCEQLK6OG===="
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
