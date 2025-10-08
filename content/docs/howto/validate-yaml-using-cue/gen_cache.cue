package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "KhDx3Q7NB0mAJ2McvSeJv0JEUYK7CBaDlutvYHgaSDw="
								"initial x.cue":  "I9tFtziVeJjqI/a0qEw424hGUcgf00hvsLa5PlYJGTQ="
								"another person": "9aIx1WqugbNv+1ntLB3XbEF+XvkOQq92HLws4FR5DDk="
								"fixed yaml":     "8cuPwtV637ZsM/Rrn/WR2NsRkpXlENQJG8jjuteP1OY="
							}
							multi_step: {
								hash:       "CFSC9JP00G5082GB4J5MJL2UAVMAI1P2Q28P7BILIUOG4LACE8CG===="
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
