package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "u68C9Xjq5PZUZmHTQbeO2nAplDqHOKn47TB21VeUgVQ="
								"initial x.cue":  "Fpc85zrgoxPv8xwWWIoPDdx8P8uJ6LXdAOI6ckL6RHQ="
								"another person": "CPU3/83MKdX0wGeec0UZF1EZqRUl/ZEiarcMLcZjoBE="
								"fixed yaml":     "GehwFncg3gKJ+roK4/UmDSDMxFRilxJc2y3inQA6KxQ="
							}
							multi_step: {
								hash:       "45V4KFQE69CJ80NUIA0I6V9DS9UH18H6H7HMO3R1V9K1EMG3M710===="
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
