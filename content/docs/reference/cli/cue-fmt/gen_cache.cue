package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-fmt": {
						page: {
							cache: {
								multi_step: {
									hash:       "B1UM439J3R17DP5RGUGACB1SQ9D2ARU60AM6METC2K4CHEQP1AQ0===="
									scriptHash: "4ETHUA5VSV3T2OTUTLKGM2M93ESTRB89TJJFLPNP3FK86Q4Q0D10===="
									steps: [{
										doc:      ""
										cmd:      "cue help fmt"
										exitCode: 0
										output: """
												Fmt formats the given files or the files for the given packages in place

												Usage:
												  cue fmt [-s] [inputs] [flags]

												Flags:
												      --check   exits with non-zero status if any files are not formatted

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
												      --strict       report errors for lossy mappings
												      --trace        trace computation
												  -v, --verbose      print information about progress

												"""
									}]
								}
							}
						}
					}
				}
			}
		}
	}
}
