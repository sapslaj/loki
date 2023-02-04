{{/*
read fullname
*/}}
{{- define "loki.readFullname" -}}
{{- $isSingleBinary := eq (include "loki.deployment.isSingleBinary" .) "true" -}}
{{- if $isSingleBinary -}}
{{ include "loki.singleBinaryFullname" . }}
{{- else -}}
{{ include "loki.name" . }}-read
{{- end }}
{{- end }}

{{/*
read common labels
*/}}
{{- define "loki.readLabels" -}}
{{ include "loki.labels" . }}
app.kubernetes.io/component: read
{{- end }}

{{/*
read selector labels
*/}}
{{- define "loki.readSelectorLabels" -}}
{{ include "loki.selectorLabels" . }}
app.kubernetes.io/component: read
{{- end }}

{{/*
read priority class name
*/}}
{{- define "loki.readPriorityClassName" -}}
{{- $pcn := coalesce .Values.global.priorityClassName .Values.read.priorityClassName -}}
{{- if $pcn }}
priorityClassName: {{ $pcn }}
{{- end }}
{{- end }}
