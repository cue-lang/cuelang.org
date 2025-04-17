package aliases

[
{{- range $p := .Site.Pages -}}
{{- range .Aliases }}
  { from: {{ . | jsonify }}, to: {{ $p.RelPermalink | jsonify }} },
{{- end -}}
{{- end -}}
]
