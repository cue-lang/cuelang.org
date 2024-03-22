package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "aVqb/vEUYQTM11qJIWNWXdhD3ob4zvvady8PO03bvLk="
								"initial x.cue":  "itFtfCY97g3pehD6BHCZOic3abaP3RO6BCAq1JgiiK0="
								"another person": "px+sQovHs34JFViiDrFX4ExenoVtL8DBwkmXpD1tjKg="
								"fixed yaml":     "ANLxdyjihqCzc/Xczw61gjprwp/osfOWC1tHPn0+7Ag="
							}
							multi_step: {
								"B81QHK3A3S8N6QP1V00RIF7PJ2L82OGGFOP6FIP7LB4H1L59LBM0====": [{
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
