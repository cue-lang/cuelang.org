package site

import (
	community_conduct "github.com/cue-lang/cuelang.org/content/community/conduct:community_conduct"
	community_contribution_guidelines "github.com/cue-lang/cuelang.org/content/community/contribution-guidelines:community_contribution_guidelines"
	docs_howto "github.com/cue-lang/cuelang.org/content/docs/howto:docs_howto"
	docs_introduction "github.com/cue-lang/cuelang.org/content/docs/introduction:docs_introduction"
	docs_language_guide "github.com/cue-lang/cuelang.org/content/docs/language-guide:docs_language_guide"
	docs_howto_best_practices "github.com/cue-lang/cuelang.org/content/docs/howto/best-practices:docs_howto_best_practices"
	docs_howto_cue_command "github.com/cue-lang/cuelang.org/content/docs/howto/cue-command:docs_howto_cue_command"
	docs_howto_ecosystem "github.com/cue-lang/cuelang.org/content/docs/howto/ecosystem:docs_howto_ecosystem"
	docs_howto_encode_json_yaml_with_cue "github.com/cue-lang/cuelang.org/content/docs/howto/encode-json-yaml-with-cue:docs_howto_encode_json_yaml_with_cue"
	docs_howto_ensure_min_max_list "github.com/cue-lang/cuelang.org/content/docs/howto/ensure-min-max-list:docs_howto_ensure_min_max_list"
	docs_howto_go_api "github.com/cue-lang/cuelang.org/content/docs/howto/go-api:docs_howto_go_api"
	docs_howto_language "github.com/cue-lang/cuelang.org/content/docs/howto/language:docs_howto_language"
	docs_howto_list_no_duplicates "github.com/cue-lang/cuelang.org/content/docs/howto/list-no-duplicates:docs_howto_list_no_duplicates"
	docs_howto_use_cue_with_github_actions "github.com/cue-lang/cuelang.org/content/docs/howto/use-cue-with-github-actions:docs_howto_use_cue_with_github_actions"
	docs_howto_use_encodings_in_cue "github.com/cue-lang/cuelang.org/content/docs/howto/use-encodings-in-cue:docs_howto_use_encodings_in_cue"
	docs_howto_validate_yaml_using_cue "github.com/cue-lang/cuelang.org/content/docs/howto/validate-yaml-using-cue:docs_howto_validate_yaml_using_cue"
	docs_introduction_getting_started "github.com/cue-lang/cuelang.org/content/docs/introduction/getting-started:docs_introduction_getting_started"
	docs_introduction_installation "github.com/cue-lang/cuelang.org/content/docs/introduction/installation:docs_introduction_installation"
	docs_introduction_tour "github.com/cue-lang/cuelang.org/content/docs/introduction/tour:docs_introduction_tour"
	docs_introduction_welcome "github.com/cue-lang/cuelang.org/content/docs/introduction/welcome:docs_introduction_welcome"
	docs_introduction_what_is_cue "github.com/cue-lang/cuelang.org/content/docs/introduction/what-is-cue:docs_introduction_what_is_cue"
	docs_language_guide_about "github.com/cue-lang/cuelang.org/content/docs/language-guide/about:docs_language_guide_about"
	docs_language_guide_data "github.com/cue-lang/cuelang.org/content/docs/language-guide/data:docs_language_guide_data"
	docs_language_guide_file_organization "github.com/cue-lang/cuelang.org/content/docs/language-guide/file-organization:docs_language_guide_file_organization"
	docs_language_guide_getting_started "github.com/cue-lang/cuelang.org/content/docs/language-guide/getting-started:docs_language_guide_getting_started"
	docs_language_guide_interoperability "github.com/cue-lang/cuelang.org/content/docs/language-guide/interoperability:docs_language_guide_interoperability"
	docs_language_guide_policy "github.com/cue-lang/cuelang.org/content/docs/language-guide/policy:docs_language_guide_policy"
	docs_language_guide_queries "github.com/cue-lang/cuelang.org/content/docs/language-guide/queries:docs_language_guide_queries"
	docs_language_guide_schemas_and_validation "github.com/cue-lang/cuelang.org/content/docs/language-guide/schemas-and-validation:docs_language_guide_schemas_and_validation"
	docs_language_guide_templating "github.com/cue-lang/cuelang.org/content/docs/language-guide/templating:docs_language_guide_templating"
	examples_basic_block "github.com/cue-lang/cuelang.org/content/examples/basic/block:examples_basic_block"
	examples_basic_code_block "github.com/cue-lang/cuelang.org/content/examples/basic/code-block:examples_basic_code_block"
	examples_basic_front_matter "github.com/cue-lang/cuelang.org/content/examples/basic/front-matter:examples_basic_front_matter"
	examples_basic_images "github.com/cue-lang/cuelang.org/content/examples/basic/images:examples_basic_images"
	examples_basic_text "github.com/cue-lang/cuelang.org/content/examples/basic/text:examples_basic_text"
	examples_sections_logos "github.com/cue-lang/cuelang.org/content/examples/sections/logos:examples_sections_logos"
	examples_shortcodes_buttons "github.com/cue-lang/cuelang.org/content/examples/shortcodes/buttons:examples_shortcodes_buttons"
	examples_shortcodes_carousel "github.com/cue-lang/cuelang.org/content/examples/shortcodes/carousel:examples_shortcodes_carousel"
	examples_shortcodes_code_tabs "github.com/cue-lang/cuelang.org/content/examples/shortcodes/code-tabs:examples_shortcodes_code_tabs"
	examples_shortcodes_columns "github.com/cue-lang/cuelang.org/content/examples/shortcodes/columns:examples_shortcodes_columns"
	examples_shortcodes_cta "github.com/cue-lang/cuelang.org/content/examples/shortcodes/cta:examples_shortcodes_cta"
	examples_shortcodes_diagrams "github.com/cue-lang/cuelang.org/content/examples/shortcodes/diagrams:examples_shortcodes_diagrams"
	examples_shortcodes_info "github.com/cue-lang/cuelang.org/content/examples/shortcodes/info:examples_shortcodes_info"
	examples_shortcodes_param "github.com/cue-lang/cuelang.org/content/examples/shortcodes/param:examples_shortcodes_param"
	examples_shortcodes_quote "github.com/cue-lang/cuelang.org/content/examples/shortcodes/quote:examples_shortcodes_quote"
	examples_shortcodes_ref_relref "github.com/cue-lang/cuelang.org/content/examples/shortcodes/ref-relref:examples_shortcodes_ref_relref"
	examples_shortcodes_sidenote "github.com/cue-lang/cuelang.org/content/examples/shortcodes/sidenote:examples_shortcodes_sidenote"
	examples_shortcodes_spinner "github.com/cue-lang/cuelang.org/content/examples/shortcodes/spinner:examples_shortcodes_spinner"
	examples_shortcodes_table "github.com/cue-lang/cuelang.org/content/examples/shortcodes/table:examples_shortcodes_table"
	examples_shortcodes_tabs "github.com/cue-lang/cuelang.org/content/examples/shortcodes/tabs:examples_shortcodes_tabs"
	examples_shortcodes_todo "github.com/cue-lang/cuelang.org/content/examples/shortcodes/todo:examples_shortcodes_todo"
	examples_shortcodes_youtube "github.com/cue-lang/cuelang.org/content/examples/shortcodes/youtube:examples_shortcodes_youtube"
	docs_introduction_tour_constraints "github.com/cue-lang/cuelang.org/content/docs/introduction/tour/constraints:docs_introduction_tour_constraints"
	docs_introduction_tour_definitions "github.com/cue-lang/cuelang.org/content/docs/introduction/tour/definitions:docs_introduction_tour_definitions"
	docs_introduction_tour_duplicate_fields "github.com/cue-lang/cuelang.org/content/docs/introduction/tour/duplicate-fields:docs_introduction_tour_duplicate_fields"
	docs_introduction_tour_folding_structs "github.com/cue-lang/cuelang.org/content/docs/introduction/tour/folding-structs:docs_introduction_tour_folding_structs"
	docs_introduction_tour_json_superset "github.com/cue-lang/cuelang.org/content/docs/introduction/tour/json-superset:docs_introduction_tour_json_superset"
	docs_introduction_tour_order_irrelevance "github.com/cue-lang/cuelang.org/content/docs/introduction/tour/order-irrelevance:docs_introduction_tour_order_irrelevance"
	docs_introduction_tour_types_are_values "github.com/cue-lang/cuelang.org/content/docs/introduction/tour/types-are-values:docs_introduction_tour_types_are_values"
	docs_introduction_tour_validation "github.com/cue-lang/cuelang.org/content/docs/introduction/tour/validation:docs_introduction_tour_validation"
	docs_language_guide_data_bytes_values "github.com/cue-lang/cuelang.org/content/docs/language-guide/data/bytes-values:docs_language_guide_data_bytes_values"
	docs_language_guide_data_json_superset "github.com/cue-lang/cuelang.org/content/docs/language-guide/data/json-superset:docs_language_guide_data_json_superset"
	docs_language_guide_data_lists "github.com/cue-lang/cuelang.org/content/docs/language-guide/data/lists:docs_language_guide_data_lists"
	docs_language_guide_data_maps_and_fields "github.com/cue-lang/cuelang.org/content/docs/language-guide/data/maps-and-fields:docs_language_guide_data_maps_and_fields"
	docs_language_guide_data_numeric_values "github.com/cue-lang/cuelang.org/content/docs/language-guide/data/numeric-values:docs_language_guide_data_numeric_values"
	docs_language_guide_data_organizing_configuration "github.com/cue-lang/cuelang.org/content/docs/language-guide/data/organizing-configuration:docs_language_guide_data_organizing_configuration"
	docs_language_guide_data_string_values "github.com/cue-lang/cuelang.org/content/docs/language-guide/data/string-values:docs_language_guide_data_string_values"
	docs_language_guide_file_organization_conditional_inclusion "github.com/cue-lang/cuelang.org/content/docs/language-guide/file-organization/conditional-inclusion:docs_language_guide_file_organization_conditional_inclusion"
	docs_language_guide_file_organization_field_types_and_scoping "github.com/cue-lang/cuelang.org/content/docs/language-guide/file-organization/field-types-and-scoping:docs_language_guide_file_organization_field_types_and_scoping"
	docs_language_guide_file_organization_modules "github.com/cue-lang/cuelang.org/content/docs/language-guide/file-organization/modules:docs_language_guide_file_organization_modules"
	docs_language_guide_file_organization_packages "github.com/cue-lang/cuelang.org/content/docs/language-guide/file-organization/packages:docs_language_guide_file_organization_packages"
	docs_language_guide_interoperability_attributes "github.com/cue-lang/cuelang.org/content/docs/language-guide/interoperability/attributes:docs_language_guide_interoperability_attributes"
	docs_language_guide_interoperability_builtins "github.com/cue-lang/cuelang.org/content/docs/language-guide/interoperability/builtins:docs_language_guide_interoperability_builtins"
	docs_language_guide_interoperability_foreign_interface_calls "github.com/cue-lang/cuelang.org/content/docs/language-guide/interoperability/foreign-interface-calls:docs_language_guide_interoperability_foreign_interface_calls"
	docs_language_guide_interoperability_function_signatures "github.com/cue-lang/cuelang.org/content/docs/language-guide/interoperability/function-signatures:docs_language_guide_interoperability_function_signatures"
	docs_language_guide_schemas_and_validation_composite_schemas "github.com/cue-lang/cuelang.org/content/docs/language-guide/schemas-and-validation/composite-schemas:docs_language_guide_schemas_and_validation_composite_schemas"
	docs_language_guide_schemas_and_validation_data_validation "github.com/cue-lang/cuelang.org/content/docs/language-guide/schemas-and-validation/data-validation:docs_language_guide_schemas_and_validation_data_validation"
	docs_language_guide_schemas_and_validation_disjunctions "github.com/cue-lang/cuelang.org/content/docs/language-guide/schemas-and-validation/disjunctions:docs_language_guide_schemas_and_validation_disjunctions"
	docs_language_guide_schemas_and_validation_field_constraints "github.com/cue-lang/cuelang.org/content/docs/language-guide/schemas-and-validation/field-constraints:docs_language_guide_schemas_and_validation_field_constraints"
	docs_language_guide_schemas_and_validation_patterns "github.com/cue-lang/cuelang.org/content/docs/language-guide/schemas-and-validation/patterns:docs_language_guide_schemas_and_validation_patterns"
	docs_language_guide_schemas_and_validation_types "github.com/cue-lang/cuelang.org/content/docs/language-guide/schemas-and-validation/types:docs_language_guide_schemas_and_validation_types"
	docs_language_guide_schemas_and_validation_value_constraints "github.com/cue-lang/cuelang.org/content/docs/language-guide/schemas-and-validation/value-constraints:docs_language_guide_schemas_and_validation_value_constraints"
	docs_language_guide_templating_comprehensions "github.com/cue-lang/cuelang.org/content/docs/language-guide/templating/comprehensions:docs_language_guide_templating_comprehensions"
	docs_language_guide_templating_constructing_maps "github.com/cue-lang/cuelang.org/content/docs/language-guide/templating/constructing-maps:docs_language_guide_templating_constructing_maps"
	docs_language_guide_templating_formulas "github.com/cue-lang/cuelang.org/content/docs/language-guide/templating/formulas:docs_language_guide_templating_formulas"
	docs_language_guide_templating_references "github.com/cue-lang/cuelang.org/content/docs/language-guide/templating/references:docs_language_guide_templating_references"
)

"community": "conduct":                 community_conduct
"community": "contribution-guidelines": community_contribution_guidelines
"docs": "howto":                        docs_howto
"docs": "introduction":                 docs_introduction
"docs": "language-guide":               docs_language_guide
"docs": "howto": "best-practices":                  docs_howto_best_practices
"docs": "howto": "cue-command":                     docs_howto_cue_command
"docs": "howto": "ecosystem":                       docs_howto_ecosystem
"docs": "howto": "encode-json-yaml-with-cue":       docs_howto_encode_json_yaml_with_cue
"docs": "howto": "ensure-min-max-list":             docs_howto_ensure_min_max_list
"docs": "howto": "go-api":                          docs_howto_go_api
"docs": "howto": "language":                        docs_howto_language
"docs": "howto": "list-no-duplicates":              docs_howto_list_no_duplicates
"docs": "howto": "use-cue-with-github-actions":     docs_howto_use_cue_with_github_actions
"docs": "howto": "use-encodings-in-cue":            docs_howto_use_encodings_in_cue
"docs": "howto": "validate-yaml-using-cue":         docs_howto_validate_yaml_using_cue
"docs": "introduction": "getting-started":          docs_introduction_getting_started
"docs": "introduction": "installation":             docs_introduction_installation
"docs": "introduction": "tour":                     docs_introduction_tour
"docs": "introduction": "welcome":                  docs_introduction_welcome
"docs": "introduction": "what-is-cue":              docs_introduction_what_is_cue
"docs": "language-guide": "about":                  docs_language_guide_about
"docs": "language-guide": "data":                   docs_language_guide_data
"docs": "language-guide": "file-organization":      docs_language_guide_file_organization
"docs": "language-guide": "getting-started":        docs_language_guide_getting_started
"docs": "language-guide": "interoperability":       docs_language_guide_interoperability
"docs": "language-guide": "policy":                 docs_language_guide_policy
"docs": "language-guide": "queries":                docs_language_guide_queries
"docs": "language-guide": "schemas-and-validation": docs_language_guide_schemas_and_validation
"docs": "language-guide": "templating":             docs_language_guide_templating
"examples": "basic": "block":                       examples_basic_block
"examples": "basic": "code-block":                  examples_basic_code_block
"examples": "basic": "front-matter":                examples_basic_front_matter
"examples": "basic": "images":                      examples_basic_images
"examples": "basic": "text":                        examples_basic_text
"examples": "sections": "logos":                    examples_sections_logos
"examples": "shortcodes": "buttons":                examples_shortcodes_buttons
"examples": "shortcodes": "carousel":               examples_shortcodes_carousel
"examples": "shortcodes": "code-tabs":              examples_shortcodes_code_tabs
"examples": "shortcodes": "columns":                examples_shortcodes_columns
"examples": "shortcodes": "cta":                    examples_shortcodes_cta
"examples": "shortcodes": "diagrams":               examples_shortcodes_diagrams
"examples": "shortcodes": "info":                   examples_shortcodes_info
"examples": "shortcodes": "param":                  examples_shortcodes_param
"examples": "shortcodes": "quote":                  examples_shortcodes_quote
"examples": "shortcodes": "ref-relref":             examples_shortcodes_ref_relref
"examples": "shortcodes": "sidenote":               examples_shortcodes_sidenote
"examples": "shortcodes": "spinner":                examples_shortcodes_spinner
"examples": "shortcodes": "table":                  examples_shortcodes_table
"examples": "shortcodes": "tabs":                   examples_shortcodes_tabs
"examples": "shortcodes": "todo":                   examples_shortcodes_todo
"examples": "shortcodes": "youtube":                examples_shortcodes_youtube
"docs": "introduction": "tour": "constraints":                            docs_introduction_tour_constraints
"docs": "introduction": "tour": "definitions":                            docs_introduction_tour_definitions
"docs": "introduction": "tour": "duplicate-fields":                       docs_introduction_tour_duplicate_fields
"docs": "introduction": "tour": "folding-structs":                        docs_introduction_tour_folding_structs
"docs": "introduction": "tour": "json-superset":                          docs_introduction_tour_json_superset
"docs": "introduction": "tour": "order-irrelevance":                      docs_introduction_tour_order_irrelevance
"docs": "introduction": "tour": "types-are-values":                       docs_introduction_tour_types_are_values
"docs": "introduction": "tour": "validation":                             docs_introduction_tour_validation
"docs": "language-guide": "data": "bytes-values":                         docs_language_guide_data_bytes_values
"docs": "language-guide": "data": "json-superset":                        docs_language_guide_data_json_superset
"docs": "language-guide": "data": "lists":                                docs_language_guide_data_lists
"docs": "language-guide": "data": "maps-and-fields":                      docs_language_guide_data_maps_and_fields
"docs": "language-guide": "data": "numeric-values":                       docs_language_guide_data_numeric_values
"docs": "language-guide": "data": "organizing-configuration":             docs_language_guide_data_organizing_configuration
"docs": "language-guide": "data": "string-values":                        docs_language_guide_data_string_values
"docs": "language-guide": "file-organization": "conditional-inclusion":   docs_language_guide_file_organization_conditional_inclusion
"docs": "language-guide": "file-organization": "field-types-and-scoping": docs_language_guide_file_organization_field_types_and_scoping
"docs": "language-guide": "file-organization": "modules":                 docs_language_guide_file_organization_modules
"docs": "language-guide": "file-organization": "packages":                docs_language_guide_file_organization_packages
"docs": "language-guide": "interoperability": "attributes":               docs_language_guide_interoperability_attributes
"docs": "language-guide": "interoperability": "builtins":                 docs_language_guide_interoperability_builtins
"docs": "language-guide": "interoperability": "foreign-interface-calls":  docs_language_guide_interoperability_foreign_interface_calls
"docs": "language-guide": "interoperability": "function-signatures":      docs_language_guide_interoperability_function_signatures
"docs": "language-guide": "schemas-and-validation": "composite-schemas":  docs_language_guide_schemas_and_validation_composite_schemas
"docs": "language-guide": "schemas-and-validation": "data-validation":    docs_language_guide_schemas_and_validation_data_validation
"docs": "language-guide": "schemas-and-validation": "disjunctions":       docs_language_guide_schemas_and_validation_disjunctions
"docs": "language-guide": "schemas-and-validation": "field-constraints":  docs_language_guide_schemas_and_validation_field_constraints
"docs": "language-guide": "schemas-and-validation": "patterns":           docs_language_guide_schemas_and_validation_patterns
"docs": "language-guide": "schemas-and-validation": "types":              docs_language_guide_schemas_and_validation_types
"docs": "language-guide": "schemas-and-validation": "value-constraints":  docs_language_guide_schemas_and_validation_value_constraints
"docs": "language-guide": "templating": "comprehensions":                 docs_language_guide_templating_comprehensions
"docs": "language-guide": "templating": "constructing-maps":              docs_language_guide_templating_constructing_maps
"docs": "language-guide": "templating": "formulas":                       docs_language_guide_templating_formulas
"docs": "language-guide": "templating": "references":                     docs_language_guide_templating_references
