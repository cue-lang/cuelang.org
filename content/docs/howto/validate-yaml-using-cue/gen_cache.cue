package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "gmnSfq6aswtj2bMyUv6xo8/1C3srKTqJA7C81P2XLDQ="
								"initial x.cue":  "dU8NbTZd8cM+HHWd+U7zMXaoJbQVBHeeTOkZgs0tWEc="
								"another person": "Pzd/VTpdDIX8sNtzdyuFn/FEdKFQSVhx5mpmytiryXk="
								"fixed yaml":     "GtVk0//vVWEuO9zY9+S+thbZxskeNcb18x/I7t1K+eA="
							}
							multi_step: {
								hash:       "U4M380GQJ9994SD0FU6U8SEVE8K3UPJ1CPLDACIFQA444OR0DIM0===="
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
