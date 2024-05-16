package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "VNX1FCS6EjaecjWMKZpQ7xthMZH+5yT+J6eN19oFdpA="
								"x.cue":        "7lxyhMwPvPfKIiEUxkSHtTH/Xe+RaoRM9ifAcpYkgGU="
								"x.json v2":    "MSMasU4n1ZO9HQsA8n/1iw+y1j4Zx0X/9Wbp1m0Zo/k="
								"fixed x.json": "e+Iv72PaUf42LOUn5IBLTNbrBU3VPgNtbuIqpVz2YEU="
							}
							multi_step: {
								hash:       "0LKH71QIROHLQL0DJQUC40U7R016GTCT93Q6SAPVGV96M0NTK4J0===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
