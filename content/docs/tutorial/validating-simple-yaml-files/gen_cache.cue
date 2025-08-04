package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "TRiIZSeCwxCOCYUvvtFm8f+M1z7UL/6Z0l2EOZOlsGA="
								"pets.cue": "2eHgby+2Qcs23DvP8evnd7Y33cjwcN7lhGI7i1mhKOA="
								yamlFixed:  "JpebHvN5e4gGodSWeZojpuFs9Qq5y0FG9Bt2rtj74bw="
								yaml2:      "9YPRnavUDhWIE86uxQYxXGpG0LusvUgh1bV6v7A+840="
							}
							multi_step: {
								hash:       "T9E8M8EG7IEU3MIR7AAA2PJLGJLLIU344FL3MUPFNHRCSVJGUAVG===="
								scriptHash: "1E9PKU732954L3NDO39VSV45AFEOJLKHIDRR2D3QBEIE988955M0===="
								steps: [{
									doc:      ""
									cmd:      "pwd # we start in our home directory, but you do not need to"
									exitCode: 0
									output: """
											/home/runner

											"""
								}, {
									doc:      ""
									cmd:      "mkdir validating-yaml-with-cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd validating-yaml-with-cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c pets.cue charlie.yml"
									exitCode: 1
									output: """
											age: conflicting values "15" and number (mismatched types string and number):
											    ./charlie.yml:5:6
											    ./pets.cue:2:11
											species: 2 errors in empty disjunction:
											species: conflicting values "cat" and "goldfish":
											    ./charlie.yml:4:10
											    ./pets.cue:1:11
											species: conflicting values "dog" and "goldfish":
											    ./charlie.yml:4:10
											    ./pets.cue:1:19

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c pets.cue charlie.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c pets.cue charlie.yml toby.yml"
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
