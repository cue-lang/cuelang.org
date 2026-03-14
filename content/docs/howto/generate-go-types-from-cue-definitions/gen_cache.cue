package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "r+1ZKwyITErgNYmNJfLROIgHCGqgv3ivNdwvbuRl0dk="
								"cue_types_gen.go 1":     "P0IxbEwHWxDajpCKM1TNZsHwbZGH7FN96/hbameNcUY="
								"example 2":              "cMzqwf1PDsefjZAuzPMUYEEIsbQWOhu6cppbeH8w1gY="
								"cue_types_pet_gen.go 2": "iueWXYdlMJ8+2NuOi2+6w/NmBvDf9Mpm7KmSgtTL0UE="
							}
							multi_step: {
								hash:       "MPA1GM1AO67N34526CTFR993HMSFAAF43PRCECI9V7RFCVK7HHPG===="
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
