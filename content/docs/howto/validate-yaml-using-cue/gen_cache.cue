package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "zJ7ald4BDAfqtTdY4dX0Gk94xLgRJ+3pt9XzTzIVGYw="
								"initial x.cue":  "2UikpU+IEt5JtgWS8cQA8pijGQpIkhHbBAkA6mgByoA="
								"another person": "SJlF1arMzkZ4EZUkF+ojfLysCSO9f5zLoV+MQgN2wQ8="
								"fixed yaml":     "cRY+L7AxdUyad/WjvFm9Mb9AFTIngw5EcHuFgrb7+is="
							}
							multi_step: {
								hash:       "LGR813R2KIICSM4FTL0IIMF6RG3ET6L1KEU0T8K2H4D0BLC13OG0===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
