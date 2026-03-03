package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "6AOx8gIIHmvROaq+UhggxAtHdG15RdtjgxBx96Bley0="
								"schema.cue":         "hLz9QVG2znquw4MncjuStMFTd/UeceLuDYhIDEYo8MY="
								"split_pea.yml":      "FiGaGcnrHV3fKCYhPifqobCfhPQ+KzSB8MbAH90TOSs="
								"pomodoro.yml":       "mCuS9jRoD0L6EnK47QzteGw6DfsSGgNYxm6mZ6YDltU="
								"pomodoro.yml fixed": "CRRd9ng1ln3WLIknZfM6UE9JWPeNKMv5gjmyL3HdD6s="
							}
							multi_step: {
								hash:       "7F91NS8HS8D7C9RTHC0DM3IFN715BPB86DHIO874MEFCV5RD0HQG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.16.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
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
