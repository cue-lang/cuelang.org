package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "mJp9r9mhX92+oZ/5RMOVepvs6Z0qWK/amqqGEp9liSM="
								"data: bryn (broken)":           "X99r3/ubdTkA6swSa2q8dQPqrNncDWg501tYAXkC+/k="
								"data: charlie":                 "525Xv068X2VDOH5hS/ctsDfOGbhlUNQx3zdQltgpJCg="
								"schema: CUE":                   "DAZQXmHy+AljpAK51MmgemefFAVI/ct0ljyJPZfd1ns="
								"data: bryn (fixed)":            "Z/gkGaYfwYHBHkGflCybvtLP651ePW3bFoQDb6cjsi8="
								"data: alex (reminder)":         "wXB2NuSeB2vDZaAKJ6AXIXG7ta0vDhwsGP/2B9YXBak="
								"data: bryn (reminder)":         "qsA2btykMceB54wJfwK0fd2NIWxvjup6a48JblhrjDc="
								"data: charlie (reminder)":      "bgO3EuS3OP9F6iIspupl6s+mznjmf4f1aWzN0lJN5dk="
								"schema: CUE (reminder)":        "zSGha0d2+EE0DnnNPs08YQAr9ESqtV7iL9w+szeprE4="
								"policy: CUE (too restrictive)": "iPEq2Gh+ymXmoClTrTAkv6x9gv6vnxrrTHKzj4eS82g="
								"policy: CUE (correct)":         "ztEhLHoNj2qi8wE9p/CdF4DlQi2Gc0KW4PeMw6fSczU="
								"schema.proto":                  "1kolbJx2VdBjSuN/84m0/jzR3sLUjf/TnwwKk5xNkAk="
								"schema.json":                   "n8fcd+Kc6Zvu80u1VbUF2vwnERV62hcfmrE7hLsURj0="
								"policy.cue":                    "92vsHrOJP/BzIfTE/XaekiGDsUd1iepy1gQCtKlGClw="
								"data.yml (broken)":             "cSwNQcAZETyIcUIn+nmu5dovJWUcx0qEkWw9S/8uKvs="
								"data.yml (fixed)":              "lJgbqjjMugp//VsR6DgOi86a1GFciERn8jsWnVJB+tw="
							}
							code: {
								constraints: "RpOEfMPPmZPsHaHksaOBTd8vj+1aqLr2qJ5i3+TiRwg="
								definition:  "xdMw0b997M22kIvW+hxLy0S5Kt5BNsWiLvtFZkDqQZ8="
							}
							multi_step: {
								hash:       "41DH59HOCCNU348QHCA31D2B1SLUSPHSEVDOV7VOKGVM94SJKUO0===="
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
