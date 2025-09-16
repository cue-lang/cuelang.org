package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "r3e+8yfflmAuaZkZDXoqDa+5C0YtMwgMO9t3fnRbeUY="
								"data: bryn (broken)":           "9mqJE6XEZOQY8Ww2nxYloAf2gD9YkKegK2WPB9ZeWs0="
								"data: charlie":                 "r0tQAOfXbs9Df+FXypipG9F13a//2vp4a3Cy+CraD0o="
								"schema: CUE":                   "2jEiJomlaQARImWfwh6/KLcUWyQOsQ95KDS1QVx4DdI="
								"data: bryn (fixed)":            "NSfLkEgMngpPVg2DNlH9w5/cdvbDyuBnmDsWHuw5V9U="
								"data: alex (reminder)":         "4d0MDqdZXAIyy4FJm9I2LW4qkIQqROJxXsaa78xdtAc="
								"data: bryn (reminder)":         "FddYiGk531bxHDSuZYXEx9Q92jPeieNx17F5DHWrrP4="
								"data: charlie (reminder)":      "jWoFtjTocLl594tIPym5pkAdMXJRkcEN3sptPcQhSzk="
								"schema: CUE (reminder)":        "sBvhIf0ttNpItT0xuK3M4mcasnnszBO21XKguM9RNHs="
								"policy: CUE (too restrictive)": "4COv9YxfpgU0nVRLzj+0nwE22/11eSxVuj1Th0HNhrg="
								"policy: CUE (correct)":         "Y4bCWVBD8QZDHQNsLG9stYuHs2oImito8v8fMRdx6kM="
								"schema.proto":                  "wF+qBvQe5LYploifuSft6BB61rINNa/1CtBJOur0EWM="
								"schema.json":                   "EsnAzcasXHnCJMha2TtNwhzOt++jvCDesvlS3MxT9eE="
								"policy.cue":                    "x0WbZMMbFB0q/n9WlQp/DqMjiEJBDkvX0QUjTbyJHAk="
								"data.yml (broken)":             "36TZ/uRGtLCLf11DuT3C5usL0geCjWDoT37jsnh1Om8="
								"data.yml (fixed)":              "arj5M1lGHPb0wurcUWs7eGFsx9GjfzVf44IJgoRNlWw="
							}
							code: {
								constraints: "emZMgxSo4Xm1tkbcX5/huOe7okbYCU8+VpUlavHeGaI="
								definition:  "aD/2RpepiqSt0cTHiGvQY7rkwhDxXJfNFx/YY3D2ttA="
							}
							multi_step: {
								hash:       "OOJA2EFC5VHODP868BQ9C4MQ018HGR094U4D5PQ816UGT54CE0C0===="
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
