package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "a1k0K9WcQPdjs8ZVSm6jNj3mHqkKty5ciylvhyvEDiI="
								"initial x.cue":  "u7FELFRShTekjLnAHHsVFa85/a5vM+oHzKBdRyYoR8w="
								"another person": "wyNnerF9lz2w5+WkPpVS3VZE5k2+StSyiFOLbxlhp5Q="
								"fixed yaml":     "a994dvc+/azxnK+zMj4rdcCOGsvi7TtNi0h7VUjXg3E="
							}
							multi_step: {
								"39BQ196LVGT6J0U96O31TR4CE47CAM5V7RCGBJ4LKC2LHQUSB1E0====": [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
