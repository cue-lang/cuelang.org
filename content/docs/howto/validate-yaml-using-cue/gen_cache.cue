package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "M2TuJYQY7GE/LjarRsttoxE41n527E+eEp+NxXGlh6A="
								"initial x.cue":  "rwQH+E7qrZf8oF5E4WI57Hn4bEpFes9vOWkwWDgznmM="
								"another person": "r+/HJXhZ5GLMdBcczUNtOS3MLvr8ZQJ8lUT+XdrxE9g="
								"fixed yaml":     "zZoQ2MIokTcijtQhSX3WJrT0fC44iJnXhZ7ALVJ99c4="
							}
							multi_step: {
								"S2KNO4U8098VNKGF9MT8OC70UJS6MIH0LLFO2G7SVJ26KK8PJBF0====": [{
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
