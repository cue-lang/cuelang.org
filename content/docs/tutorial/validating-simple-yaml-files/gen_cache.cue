package site
{
	content: {
		docs: {
			tutorial: {
				"validating-simple-yaml-files": {
					page: {
						cache: {
							upload: {
								yamlBroken: "2gXWXem/qzTd05BK8Du4xfIRDV6SuUE6uC6d2Zf6Vh4="
								"pets.cue": "iCoD1l6YFdC/S+42aZWnrNuudk0tVphZ/oCilT4BWik="
								yamlFixed:  "tqnYRkb/uTmvD32GELGWA5X8rTgMilk3W9D/phb+glo="
								yaml2:      "WGkU1C5ViDb4nJsxOraPkrzrRGVSzQ4twVu8WlAmFQw="
							}
							multi_step: {
								hash:       "LS25B7UFPK1P09M4PSNLCK3VKTIBSUOQH9S2VCAI8HT5LP4NK360===="
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
