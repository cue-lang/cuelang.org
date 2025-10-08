package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-experiments": {
						page: {
							cache: {
								multi_step: {
									hash:       "H4BOLB4AVLP611QL30N6937M3GEKGDNM0SPT517UD1BQ0PMHRS1G===="
									scriptHash: "T48B0MOIQKMSTHER4M99K6RABLGNOBNJ14DR82656BABFTQC0440===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-alpha.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help experiments"
										exitCode: 0
										output: """
												Experimental features that can be enabled in CUE.

												There are two types of experiments:

												1. Per-file experiments: Enabled via @experiment attribute in CUE files
												2. Global experiments: Enabled via the CUE_EXPERIMENT environment variable

												## Per-file Experiments

												Experiments are enabled in CUE files using file-level attributes:

												\t@experiment(structcmp)

												\tpackage mypackage

												\t// experiment is now active for this file

												Multiple experiments can be enabled:

												\t@experiment(structcmp,self)
												\t@experiment(explicitopen)

												Available per-file experiments:

												  structcmp (preview: v0.14.0, stable: v0.15.0)
												    structcmp enables comparison of structs. This also defines the ==
												    operator to be defined on all values. For instance, comparing 1 and
												    "foo" will return false, whereas previously it would return an error.
												    Proposal:      https://cuelang.org/issue/2583
												    Spec change:   https://cuelang.org/cl/1217013
												    Spec change:   https://cuelang.org/cl/1217014

												  explicitopen (preview: v0.15.0)
												    explicitopen enables the postfix ... operator to explicitly open
												    closed structs, allowing additional fields to be added.
												    Proposal:      https://cuelang.org/issue/4032
												    Spec change:   https://cuelang.org/cl/1221642
												    Requires cue fix when upgrading

												  self (preview: v0.15.0)
												    self enables the use of 'self' identifier to refer to the enclosing struct.
												    Proposal:      https://cuelang.org/issue/4014
												    Spec change:   https://cuelang.org/cl/1222377


												## Global Experiments

												Global experiments are enabled via the CUE_EXPERIMENT environment variable:

												\texport CUE_EXPERIMENT=cmdreferencepkg,keepvalidators
												\tcue export myfile.cue

												Available global experiments:

												  cmdreferencepkg (preview: v0.13.0, default: v0.14.0)
												    cmdreferencepkg requires referencing an imported tool package to declare tasks.
												    Otherwise, declaring tasks via "$id" or "kind" string fields is allowed.

												  decodeint64 (preview: v0.11.0, default: v0.12.0, stable: v0.13.0)
												    decodeint64 changes [cuelang.org/go/cue.Value.Decode] to choose
												    'int64' rather than 'int' as the default type for CUE integer values
												    to ensure consistency with 32-bit platforms.

												  embed (preview: v0.10.0, default: v0.12.0, stable: v0.14.0)
												    embed enables support for embedded data files as described in
												    https://cuelang.org/discussion/3264.

												  evalv3 (preview: v0.9.0, default: v0.13.0, stable: v0.15.0)
												    evalv3 enables the new CUE evaluator, addressing performance issues
												    and bringing better algorithms for disjunctions, closedness, and cycles.

												  keepvalidators (preview: v0.14.0, default: v0.14.0, stable: v0.15.0)
												    keepvalidators prevents validators from simplifying into concrete values,
												    even if their concrete value could be derived, such as '>=1 & <=1' to '1'.
												    Proposal:     https://cuelang.org/discussion/3775.
												    Spec change:  https://cuelang.org/cl/1217013
												    Spec change:  https://cuelang.org/cl/1217014

												  modules (preview: v0.8.0, default: v0.9.0, stable: v0.11.0)
												    modules enables support for the modules and package management proposal
												    as described in https://cuelang.org/discussion/2939.

												  toposort (preview: v0.11.0, default: v0.12.0, stable: v0.14.0)
												    toposort enables topological sorting of struct fields.
												    Provide feedback via https://cuelang.org/issue/3558.

												  yamlv3decoder (preview: v0.9.0, default: v0.9.0, stable: v0.11.0)
												    yamlv3decoder swaps the old internal/third_party/yaml decoder with the new
												    decoder implemented in internal/encoding/yaml on top of yaml.v3.

												Experiment lifecycle:
												- preview:   experimental feature that can be enabled
												- default:   experiment enabled by default, can still be disabled
												- stable:    experiment permanently enabled, experiment flag has no effect
												- withdrawn: experiment removed and permanently disabled

												Language experiments may change behavior, syntax, or semantics.
												Use with caution in production code.


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
