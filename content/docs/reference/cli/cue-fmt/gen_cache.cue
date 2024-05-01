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
									hash:       "G6EBFJ404ORS71BMO5SGPKDKFFG9DEVMLIO5LRCAFVLGN9GDE0H0===="
									scriptHash: "6UI6HB62IA675IOOR4I0SRJ3CA5SKT5F9KRKTOO3L8JAI9MPJ410===="
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
												  -d, --diff    display diffs instead of rewriting files

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
