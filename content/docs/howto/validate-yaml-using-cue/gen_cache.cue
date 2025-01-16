package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "vV08NgvqS75KEnAPf8XnPj2AwZLb+KfK9LZNot6jsOg="
								"initial x.cue":  "9Vfnt6ywOQkr/V5lP9KUTxuMw1VYWEpAiUdb+Xk/vo8="
								"another person": "h8h8YhR6zwEQcRbSSt4ddNGZFS491vRMmQb58grFbHQ="
								"fixed yaml":     "1r0tftfFpjB7SSfhTKJ/fKUsEufQudBzRsYyI3Y2wGc="
							}
							multi_step: {
								hash:       "47QVP2GI8KVQQ6EVRCBSBQCCD25GJACP1NOFUB11NTJ3A9C6IR6G===="
								scriptHash: "7O25FPHJVUHC297BLS0S5A0O6M4E37ITUK3M1O5FHBH097GTHAAG===="
								steps: [{
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
