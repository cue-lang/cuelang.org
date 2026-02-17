package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "mfDd7jAXGQsYwYa6yPwB9NiT5BDtFHARX6panjJeo88="
								"cue_types_gen.go 1":     "bnj76wcOMtHQH+feIc3DBVztSv7qCM0VkTFQUIOJ3QA="
								"example 2":              "p5fjwBQ/XcqEei2+WcJw4HUG/E4yqN592SGVT/IfCDw="
								"cue_types_pet_gen.go 2": "pilhw9AkWhSgaaM96hIgfB7o3EE2rBSQ042Xv8NSy54="
							}
							multi_step: {
								hash:       "COKU3FMM6HNR78462RSRE7GUBMOFE2HLNOTHD2LU8GQ4V7V4M610===="
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
