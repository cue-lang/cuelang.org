package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "AteF9GPTjxNrR8hJVuy0489dwQRECCul7nM8z4fDOqk="
								"cue_types_gen.go 1":     "QjSmk+597dHsxAczTn5Z3mObm92J8sQJNzrwPps0CMQ="
								"example 2":              "G1aVpJCcCJTf2ecQOyGq6ausPzjZ1eo54KPeqYu6Kmo="
								"cue_types_pet_gen.go 2": "0A91dH/pEy85htpf/MWZkis7rWJxn+SoAGkXB7dXCZs="
							}
							multi_step: {
								hash:       "OO238TGKRFMPBBS17C6SIFCG7KGQC9KASNFEV06CKS4KV0QM41O0===="
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
