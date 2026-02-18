package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "qB+hdmQaRMqppglq/tU9vV+nUn1uSZ0JHI8RjDfKoC0="
								"data: bryn (broken)":           "YyCYBVfswmrnVjy92//alEzGhqubczaWH+2k+pyB1aQ="
								"data: charlie":                 "kMPS2qL/SOqrqq5ukDSNRQKWymbzKpVM5avbKJILtx0="
								"schema: CUE":                   "Hgsam2D34HA5X1NLoxZBExCBl7KdadFA2N+b0eswoq8="
								"data: bryn (fixed)":            "HjxgYaHy+6/5E6z7jsIQFn5Au9T9aRnCY5MJvuLTuWM="
								"data: alex (reminder)":         "YkpoYUaoyJBb91e+oMUFHIjjB/PFFKJ38s8U2VEUeQc="
								"data: bryn (reminder)":         "6B/2lg7EqeQW6iExhYawYSzJmCykE6raXGDQFR+8leg="
								"data: charlie (reminder)":      "p+C5qgoRo9aBe0SyawRgQiZLgv6Dx5ZEvxBI/fvPsYE="
								"schema: CUE (reminder)":        "pAFVkdcKgJa1fJ4bxaQjMLXVmcU9YQZpL/qWSl3IKak="
								"policy: CUE (too restrictive)": "OuO4Lny611AKL8my5jHCObNBCBWRPjTyhp2TB4L/yuA="
								"policy: CUE (correct)":         "zYV0ZzNhaYLHpKmgO23NuBIiHYfWptI97qxxzXNPWDo="
								"schema.proto":                  "+WojssRJmBh2EOUMKcMoj570nJj44kvcC7Lm2n8VpII="
								"schema.json":                   "KrYgNlcYLOtZZScsvKBl31o+leCJA2Xg3PXoiK3wfCY="
								"policy.cue":                    "dtXNS+dIz/PeCmj8LqeHTgRzZwoajq0jdXCOdEuerwQ="
								"data.yml (broken)":             "jU8ysXXSQxhnFy4h+iPukCF2LPkU8GjYYP48JBSh7J0="
								"data.yml (fixed)":              "2FVuKgHVfyeOpSUqUxJRx12dEMdHZhMHx2VyH1R/GzQ="
							}
							code: {
								constraints: "pTXINzS280MKogicda1kfmXz9ariZR9p2JvA/n4cL94="
								definition:  "Vp8ZOReLyBHsWyD5smvcXypOpYU2/ErcVjbIXwzDUqI="
							}
							multi_step: {
								hash:       "MI71UJL66A1AJRC5U6HK1AFAFP6R7F474S11GQSJJ1V3IS0HFIPG===="
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
