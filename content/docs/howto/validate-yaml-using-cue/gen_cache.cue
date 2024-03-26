package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "hvPyapYOX63g7qcZub/oFhgdEeoWnzfN+Hm6bGoeQno="
								"initial x.cue":  "nG77n+m9I5aGv7tE0QFBxlap0tYm5D5CDim4CXrP858="
								"another person": "Zr6KErXvD0xVTUlXMf34g8GuyXaPtRTu7Oy+7VU8o4Q="
								"fixed yaml":     "xb6kq82W4QZOlFYhveudcgzz/jdzdK6Xa010i34luR0="
							}
							multi_step: {
								"NS95ODR2UKBSN6A1N7KKFMUQ4TL9P4B8FNMKMURBTHD84UE9UVSG====": [{
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
