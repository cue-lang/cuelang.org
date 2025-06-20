package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "ufpv1cBjNhmRHUtbVvrj8wn4P2mvRP+WTci4q4emq7c="
								"cue_types_gen.go 1":     "PxALF30WTOlnMjhCgkDKtlLb3LV90Exeh/VzIIqFzFk="
								"example 2":              "XCYS7QDKHhlNj8vW5PntuyhsJblsxp4o2UnR/i8+KzM="
								"cue_types_pet_gen.go 2": "irMjaHzXa0rxAaYqbT9ZrkHbtbkfRhbDyCtKLTISTmY="
							}
							multi_step: {
								hash:       "T0Q78LFV4JFOS04U9IB7EC1LJ9QGF6USOE2FPI3TNE80B46QBKG0===="
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
