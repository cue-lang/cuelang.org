package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "UnirM3B8hIGIAFhFRfk/AVvDHB7J6m7evQTGBjl9QhA="
								"cue_types_gen.go 1":     "DB/wATfooWUHzIBRBFdHXBQ0GW09evmnkLcKQZbwl8A="
								"example 2":              "3uPLy7tOBqP55qkDAb3kZRxPQAx5aVqVNTOMT7/2nXw="
								"cue_types_pet_gen.go 2": "osoKAZngcHCWOLGfziWn5zbsX45sbWlqq5QJx8za/4k="
							}
							multi_step: {
								hash:       "9GVBA92GIDI8RIOF5QCSG43BU113JNFICDN6S4DEVOHDA2JUVBDG===="
								scriptHash: "ENTKF17DD7DNV7030J6UPAS40QU1DIO156V282TQ7OB9E272PPE0===="
								steps: [{
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c # Check we've not encoded anything odd in our CUE."
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
