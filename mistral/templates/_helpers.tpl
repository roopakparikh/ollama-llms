{{/*
Expand the name of the chart.
*/}}
{{- define "ollama-stack.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "ollama-stack.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ollama-stack.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ollama-stack.labels" -}}
helm.sh/chart: {{ include "ollama-stack.chart" . }}
{{ include "ollama-stack.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ollama-stack.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ollama-stack.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Ollama selector labels
*/}}
{{- define "ollama-stack.ollama.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ollama-stack.name" . }}-ollama
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Tiny Ollama UI selector labels
*/}}
{{- define "ollama-stack.tinyOllamaUI.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ollama-stack.name" . }}-ui
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
