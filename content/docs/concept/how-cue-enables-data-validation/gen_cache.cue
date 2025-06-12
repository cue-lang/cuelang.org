package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "OcivxwtDjiluw3eSTu7oPOMa0ibDvQjP02Hjyd0siLs="
								"data: bryn (broken)":           "xbkB3Q9N2Xb0uA3KJPVXw/O14J6Uvp2K5JE9X3zBHDY="
								"data: charlie":                 "Xv5JNeuC1w1hChobZpRSOhdHVizuQi0xkP5AkTniV08="
								"schema: CUE":                   "Vhm0zhLTP8zy4cv0wTjvPYn+C+V1+YCYkkvgfXrGLbc="
								"data: bryn (fixed)":            "VoIZxYvUmbeX860m14bcrFj3yakRa0NvAU1YHsc6uBE="
								"data: alex (reminder)":         "7JYNv1+kSar5a9lfQwxSy4Fp8D5NuclBkFeVGvGWY8Q="
								"data: bryn (reminder)":         "tYFh0RwqNntoBpXe58dzKfs9xA6QsGkbDx/HgQxXbcQ="
								"data: charlie (reminder)":      "fEA+eX+HQx8sVz+l6dbjapjjjonbqAi0E8ni2TN0QCQ="
								"schema: CUE (reminder)":        "jfBg6AbDyUAXtuwxRbmk+AaWr8mnwuTG5OZMh5NKz0A="
								"policy: CUE (too restrictive)": "3d13HOPLhLxqEShGkvFpDmDgLaSuWDhdHjY4QVvHMrc="
								"policy: CUE (correct)":         "2nUSzNDOYFiUWcr0+pprbhuMxfBpc5ces6QpNCbFn7w="
								"schema.proto":                  "0dZGP7pmci/cKuFilH8tnj/zXIoDFzax/yZiS5tWOp0="
								"schema.json":                   "PRkDVFH36FnQGwHZBHSNsELBIkD5kJ3bY27zCs82nGY="
								"policy.cue":                    "S/GkvkVGD+eIsAzD6dxlcPUY3PiRyIwL9godDbtEvhE="
								"data.yml (broken)":             "6eRJLCrzfwD/9qLtFTtb4mJF4VaACCyMNnnXVJzBZuM="
								"data.yml (fixed)":              "i6+2efGVOIYFD+Kyx2MunVNIbKHune0gvHY+oR11Oew="
							}
							code: {
								constraints: "v4+/rXuKGvqkxNLY01I+GyoOxsZJFXR1zThv9WVXIOo="
								definition:  "ek2GQcWjjah9HGfKgrF4PgelDDEmVt5Nx9MuDAqUnc0="
							}
							multi_step: {
								hash:       "336CIKJL3FM51MVP0EBI77AOC1DGR1PTDFF8ODIJ3AA3GIC34580===="
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
