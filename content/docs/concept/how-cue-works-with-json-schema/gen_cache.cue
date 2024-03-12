package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json": "+lBezNsAg0Bepr9fkKlEGVm+uYJXeoVogLYu6233CAw="
								"schema.cue":  "bnHsu8VqVMNHggs9NB1135SJ41pTYKtgKxnQ1Sx+Yo4="
							}
							multi_step: {
								"3G5TVQPQBBU48T6I9JEBNHTVJ0KOFLLEMQTH6RDP3RSGTETU4UJG====": [{
									doc:      ""
									cmd:      "cue import jsonschema: schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff schema.cue .schema.cue"
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
