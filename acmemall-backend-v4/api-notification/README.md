# mall v4 backend api-admin helm manifest
## 

# prerequisite
`helmfile`을 설치한다.

```bash
brew install helmfile
```

`helm`을 설치한다.

```bash
$ brew install helm
$ helm version
version.BuildInfo{Version:"v3.1.2", GitCommit:"d878d4d45863e42fd5cff6743294a11d28a9abce", GitTreeState:"clean", GoVersion:"go1.14"}
```


# Usage
## For example
helmfile -f helmfile.yaml -e dev apply

```
sync : 선언된 모든 chart 를 재설치 합니다.
apply : 변경된 chart 만 재설치 합니다.
destroy : 모든 chart 를 삭제 합니다.
```

```bash
environments:
  dev:
    kubeContext: mall-dev-1
  stage:
    kubeContext: mall-stage-1
  prod:
    kubeContext: mall-prod-1
---
releases:
  - name: acmemall-backend-v4-api-notification
    namespace: mall
    chart: ./helm
    version: 0.1.0
    values:
      - ./values/{{ .Environment.Name }}.yaml
```

### Ref. https://helmfile.readthedocs.io/en/latest/#getting-started
