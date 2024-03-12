package site
{
	content: {
		docs: {
			concept: {
				"how-cue-works-with-json-schema": {
					page: {
						cache: {
							upload: {
								"schema.json": "OYkF+r7YcBk4UhMAlUTkm5UAM2CMYjnvu8FFELgUmq4="
								"schema.cue":  "lz7GWKhUy0ur14A/0XmA1Q+XK0LMbzCu2Rg0jSX6ldc="
							}
							multi_step: {
								"2VEPHSHB305B1EL3RACU8BAAHKPRRNVQM0ASSH1E3SDEGILAG790====": [{
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
									cmd:      "echo >>.schema.cue # Add a newline TODO: figure out why it's needed and open an issue"
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
