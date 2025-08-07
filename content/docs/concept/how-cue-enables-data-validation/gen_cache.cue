package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "JfXUgQL0AqPKhAnLsWzjUVpJuQN4jCu/3+kBySd9rEQ="
								"data: bryn (broken)":           "2u+2mdCNTf9eTvJXdtQpo3O7hlTzwGvmSQdF5+VG5Hc="
								"data: charlie":                 "i9n/3lBX44eEvJxo9is9ecvXdEAKH8XhgY+ZtFsExtk="
								"schema: CUE":                   "whhCoBA/y17YzaSniK9YfTlhqGB0/mNLrKwDe+GU5bE="
								"data: bryn (fixed)":            "+mL0TOcM499wADfeFM6np2LaSqrTbStf6xjxlIbgteA="
								"data: alex (reminder)":         "xOzLneyYISJqa/aEgM7FA+zdf/JvfgJOEOn1DbFcAfE="
								"data: bryn (reminder)":         "B47ZRTyluRRZgLc+5Y60/kd35aHoJbA4Byv6ggNCJdU="
								"data: charlie (reminder)":      "9K8y9I7k1aH+odOXx7m30aGGnjcpMLbLubE2Q8dKZl8="
								"schema: CUE (reminder)":        "QmjjwGJ2W7WVAdI7FmA8Tn+IPYqb33YMLucyEIoFkms="
								"policy: CUE (too restrictive)": "+pDOtuO/jUPxhJ3wLl8HL7DliyDhwBTV4/FrFQ33OOg="
								"policy: CUE (correct)":         "oC3Jv++tczkxreyB8cg5sUk9VC/xWIxbU34jbA7yf78="
								"schema.proto":                  "GH3bgt/2c86PSzQI7SAasyO0cqcKoc3BNsGjxljQeH8="
								"schema.json":                   "rt1WuzieeAOafpprj1ikOur9Qhmx5a+UaD/kxXVaRME="
								"policy.cue":                    "FZabYOizevAXiFafiICcU8x2mCFH/mc9SMlAQXO//Ys="
								"data.yml (broken)":             "jF43bzp5O5JWPDU28sxR8I+lB59bfW4bYNkzo9Gp8pU="
								"data.yml (fixed)":              "o0XGZmd68QzdtDNhce91vin1RI2ao7AX+msfKiuBaJs="
							}
							code: {
								constraints: "7tqUwf7jh0ZWxkfx9Bs9UZHgT9lQufFMRjp3+a8lS/8="
								definition:  "2Emo1j01xUmafxxGsyxfrE6vdsQY70BvJURykOMcVgE="
							}
							multi_step: {
								hash:       "SFE6N97N7DQTV7VMAEKT32AVFT6NHCJL3E64CSDQUFS9QCN2H710===="
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
