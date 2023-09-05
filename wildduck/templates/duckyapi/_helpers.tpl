{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wildduck.duckyapi.fullname" -}}
{{- if .Values.duckyapi.fullnameOverride }}
{{- .Values.duckyapi.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Values.duckyapi.name .Values.duckyapi.nameOverride }}
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
{{- define "wildduck.duckyapi.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "wildduck.duckyapi.labels" -}}
helm.sh/chart: {{ include "wildduck.duckyapi.chart" . }}
{{ include "wildduck.duckyapi.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "wildduck.duckyapi.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wildduck.duckyapi.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}