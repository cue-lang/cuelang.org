package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "i6pDR9vmaQ6hx1Kb+3FcfxufNcG7G09a0Ilclsh5dIo="
							}
							upload: {
								"baseline input":   "Nmt7OTP1iyQEAsycuGxTDrdvIlidMM6V0oAInDbsc8E="
								"baseline output":  "W7BcMEBEhvBuFjb6BXUFXgNLOefO2Uplaj7gyOTmIL4="
								schema:             "p0Ird9GzaDZTN/gLKordYlOL5I+6k9NDhdGc4aSdVnY="
								"schema reupload":  "6961RxJPkUU7frVZbiVKImeLgyRr6ewBT0UE75CCtzE="
								"schema output":    "954Mv/27g1dO3/Qqvau7Qc1l5zK36pYR20qdMT6zcIk="
								defaults:           "akuxhkUv95sUa1Veqye4uo9qatmmi1WUuuzxrOOXf6o="
								"defaults output":  "M5wpb1B13Uyka0ZP6Mlk29RKx/var6y6DGnLnmwN888="
								name:               "vgdmGyQ1/Yg3ea2H3R4neZW/xJ4fOFB9rELR416cDKA="
								"name output":      "uR0coKEGmtr4TqoNyHY2UuT9ytCgWuZ5UX2eyOvz9Gk="
								"extra app":        "xaO7wE1rEGvJtXPU1niRsYetVL2/NDizFTTn/wTM+S0="
								"extra app output": "w3FuDG8Yrs86c+Oy7c0yA6q0gbPtGvFBPi0P/91fYhA="
								"pre-trim source":  "Ua9KHeVNX0Ogy1AouV+xOYAVEHUUOJTq0rmiPH/pV20="
								"post-trim alpha":  "sJlF2l2sn0b4zZIP3AqCk/McE+f4LuY933o9kvBX8Lk="
								"post-trim beta":   "pJCZeriodS0nT3UlglxE2JfE7vuqxzNRrp8qMPrt6mQ="
								"post-trim gamma":  "l6nNq+LoJoj4u363dH6obq+deyFdJ3gcr2G2FAVrZH0="
								"post-trim output": "LF6rjwYcZ6ubQ/cuZsxiflVcEThcUZuxJvw+rfYMo60="
							}
							multi_step: {
								hash:       "PSJB70CMBP0SQHINTCSSIN4AI15NNNA01ISPCMIHMMFD2OE4SS40===="
								scriptHash: "KOHOSQ50PPFAKGQVSRD4I3Q7TU957F05QL50M7RAI9OC7ASE4J9G===="
								steps: [{
									doc:      ""
									cmd:      "cue export -o configuration.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 1
									output: """
											app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
											    ./a.cue:3:13
											    ./a.cue:6:12
											    ./schema.cue:6:13

											"""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
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
