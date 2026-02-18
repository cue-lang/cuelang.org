package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "a8Gvc+bfaN6nMmEZ21VcZX/41kC3hm595os7iDcaxyY="
								"cue_types_gen.go 1":     "gWPiOv6S3W/RiINLbu5kp4YTZBZOWcX+h8aTXzwvj7U="
								"example 2":              "1q8VkjFrU6Sql0MDyEy2K+PyCNKL+TrgRDsNkWdmKHw="
								"cue_types_pet_gen.go 2": "ankd9os2CyyQF6M8cSUtEmf4PGmFsChd6lRHtO8A9FY="
							}
							multi_step: {
								hash:       "DG5NNNFRHFKU99N2D7P00DDNI2308ANEF9EBSLGDAS6TOLNMTBOG===="
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
