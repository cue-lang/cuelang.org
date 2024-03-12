package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-openapi": {
					page: {
						cache: {
							upload: {
								"schema.cue":   "QVU87lM3eOojucTLJanITHoL01uA7LQg4nsvqYZaTfQ="
								"api.pet.yaml": "sArrYbVr0PXO8h3eZeivfVeAyyYP/egs9rSAQq+ZYiE="
								"api.pet.cue":  "gCImgdTnnzmURr6qkplmd1u+HYH5KKEb1on+u0A6RnU="
							}
							code: {
								"go emit openapi": "6PZhWymLfqv5xNM3Smy3nHXNaFTwKzTbsTJJwf7mkU4="
							}
							multi_step: {
								"MI4ULBB42KKO3SAEB6DL56PQTEFL3LAB9H6D8KVPGO779A5IK970====": [{
									doc:      ""
									cmd:      "cue def schema.cue -o api.pet.yaml --out openapi"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv api.pet.yaml .api.pet.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff api.pet.yaml .api.pet.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm .api.pet.yaml # tidy up"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue import -p api api.pet.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv api.pet.cue .api.pet.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff api.pet.cue .api.pet.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm .api.pet.cue # tidy up"
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
