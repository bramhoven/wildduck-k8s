{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "wildduck.webmail.fullname" -}}
{{- if .Values.webmail.fullnameOverride }}
{{- .Values.webmail.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Values.webmail.name .Values.webmail.nameOverride }}
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
{{- define "wildduck.webmail.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "wildduck.webmail.labels" -}}
helm.sh/chart: {{ include "wildduck.webmail.chart" . }}
{{ include "wildduck.webmail.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "wildduck.webmail.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wildduck.webmail.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "wildduck.webmail.serviceAccountName" -}}
{{- if .Values.serviceAccount.webmail.create }}
{{- default (include "wildduck.webmail.fullname" .) .Values.serviceAccount.webmail.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.webmail.name }}
{{- end }}
{{- end }}
