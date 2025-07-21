package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":          "JBNvHefYGSibij6OJIqA7eXaveZl/g+84cLiJalONqo="
								"cue_types_gen.go 1": "pDchXjICQyynb+UZioA5urKqjUcqPe63goUMZ+lp21Y="
								"example 2":          "ChOJO6KXYhQnqN5jQFLpQ8qrzfYkCRSiKDNUcdbrgh4="
								"cue_types_gen.go 2": "U+89QGMj14Op/UgsTMUzG5JrcZ7ACK/yNzePBpbuX+c="
							}
							multi_step: {
								hash:       "BM1EPV3PS8S7LSNS5MD06C03O4H53K0ITUDCIS3F855R2MA04K30===="
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
