package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "p25HmyAqmKvLQVy+Rsl+PJIM3ydNZfBMlU36Bz3FvoU="
								"initial x.cue":  "Eji0UTgbRInYvZMu7yvhonImM45Ov4p/ioFEOKE6bDs="
								"another person": "6mlsxdMr8tsir6YK/Dm1wodaQz21cMOiC3biXpf3/l0="
								"fixed yaml":     "BntxIandXuhhNOD870g6KTe9qMH1kOHrh2hIKfhQWGo="
							}
							multi_step: {
								hash:       "V8O08C9776QQNVELVGHSHVUGH0C837I7P8AUIKTM9B4HJ73GV3SG===="
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
