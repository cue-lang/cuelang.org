package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "jjaNd60FvqD+u+7gilni6tfxs48kQSuOV+uZSEtYlbs="
								"initial x.cue":  "W//sBRM2cK7oE5JjH5cOu1F2YBht/MlVWnIIwrnuYvs="
								"another person": "voZI7qmqbEUNnvBfbVzEKCxpR9+fZFnhejEmpEaqUGU="
								"fixed yaml":     "4hmlD8j35D82vLSGXa4itsU+oMHOufxmt6bXKM34fk0="
							}
							multi_step: {
								"A07PO0QB546NBADDTGIC0EST634TBJGT280TCS2CL0HEQVFTRPTG====": [{
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
