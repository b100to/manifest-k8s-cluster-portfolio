{{/*
Expand the name of the chart.
*/}}
{{- define "acmemall-backend-v4.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "acmemall-backend-v4.fullname" -}}
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
{{- define "acmemall-backend-v4.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "acmemall-backend-v4.labels" -}}
helm.sh/chart: {{ include "acmemall-backend-v4.chart" . }}
tags.datadoghq.com/env: {{ .Values.env }}
tags.datadoghq.com/service: {{ include "acmemall-backend-v4.fullname" . }}
tags.datadoghq.com/version: v4
{{ include "acmemall-backend-v4.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "acmemall-backend-v4.selectorLabels" -}}
app.kubernetes.io/name: {{ include "acmemall-backend-v4.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "acmemall-backend-v4.templateLabels" -}}
tags.datadoghq.com/env: {{ .Values.env }}
tags.datadoghq.com/service: {{ include "acmemall-backend-v4.fullname" . }}
tags.datadoghq.com/version: v4
admission.datadoghq.com/enabled: "true"
{{ include "acmemall-backend-v4.selectorLabels" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "acmemall-backend-v4.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "acmemall-backend-v4.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
