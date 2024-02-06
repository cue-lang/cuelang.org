package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "3CAaRgDGvxUnoTyD4Q+If6BwiVQ4qAc0f5ZxJJhyznA="
								"initial x.cue":  "Ov+ZIJviOV2OnkY1GOw6gdd1rvTjqmauaWzgxVKa9JE="
								"another person": "asHt5yl3AdaX5dJxxR6ZyWj/xm9SKRqrBbXVmfMM6Go="
								"fixed yaml":     "usBM6y4ox6KXLkzn9oAx7Rk6zN/Vs5ji9fY4J0J6LWg="
							}
							multi_step: {
								"D7M9BR7RPAAV8M7GR3I9HHQEU4VFSLNOA2G9STI1UOBL9ALJP310====": [{
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
