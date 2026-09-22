{{/*
Common labels
*/}}
{{- define "acmemall-backend-v4.labels" -}}
tags.datadoghq.com/service: acmemall-backend-v4-batch
tags.datadoghq.com/version: v4
{{- end}}

{{- define "acmemall-backend-v4.templateLabels" -}}
tags.datadoghq.com/service: acmemall-backend-v4-batch
tags.datadoghq.com/version: v4
admission.datadoghq.com/enabled: "true"
{{- end }}

{{- define "acmemall-backend-v4.env" -}}
- name: DD_LOGS_INJECTION
  value: "true"
- name: DD_TRACE_SAMPLE_RATE
  value: "0.1"
- name: DD_TRACE_AGENT_URL
  value: 'unix:///var/run/datadog/apm.socket'
- name: DD_ENV
  valueFrom:
    fieldRef:
      apiVersion: v1
      fieldPath: 'metadata.labels[''tags.datadoghq.com/env'']'
- name: DD_SERVICE
  valueFrom:
    fieldRef:
      apiVersion: v1
      fieldPath: 'metadata.labels[''tags.datadoghq.com/service'']'
{{- end }}

{{- define "acmemall-backend-v4.volumeMounts" -}}
- name: apmsocketpath
  mountPath: /var/run/datadog
{{- end }}

{{- define "acmemall-backend-v4.volumes" -}}
- hostPath:
    path: /var/run/datadog/
    type: ''
  name: apmsocketpath
{{- end }}