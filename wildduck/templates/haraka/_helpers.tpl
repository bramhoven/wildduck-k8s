{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wildduck.haraka.fullname" -}}
{{- if .Values.haraka.fullnameOverride }}
{{- .Values.haraka.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Values.haraka.name .Values.haraka.nameOverride }}
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
{{- define "wildduck.haraka.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "wildduck.haraka.labels" -}}
helm.sh/chart: {{ include "wildduck.haraka.chart" . }}
{{ include "wildduck.haraka.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "wildduck.haraka.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wildduck.haraka.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}