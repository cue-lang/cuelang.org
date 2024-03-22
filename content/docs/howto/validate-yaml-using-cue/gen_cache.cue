package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "xeZ6Py9njxHpjMSSlGyVyb6zFzicBPmQ/pAEJuXvOis="
								"initial x.cue":  "qu0lIMLT/ArJx5iYHRSbCclKFC6zoAXnFIzHeKWXsQU="
								"another person": "BPEfo+5d3Wl40xTJe3gnRRJ5tnRMbQmNaDz5UNWo8vg="
								"fixed yaml":     "9jUA0lkcgyFhKV1YGHopDpb7/npL9WDAJrOW5EsPoBQ="
							}
							multi_step: {
								"SG3KQD16S7G3L82A9CB6RIIDQFLPSS4DO9NRQV946EH526H7IJAG====": [{
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
