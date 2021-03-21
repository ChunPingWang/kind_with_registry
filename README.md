---
title: '安裝Kind與設定 local Regitry'
disqus: hackmd
---

安裝Kind與設定 local Regitry 
===
>安裝 Kind
> https://kind.sigs.k8s.io/docs/user/quick-start/#installation

>下載相關執行與設定檔
```gherkin=
git clone https://github.com/ChunPingWang/kind_with_registry.git
```
>切換至kind_with_registry路徑下
```gherkin=
cd kind_with_registry
```
>執行 script
```gherkin=
./fisc-create.sh
```
>下載image
```gherkin=
docker pull gcr.io/google-samples/hello-app:1.0
```
>打上 tag localhost:5000/hello-app:1.0，以便推送到 local registry
```gherkin=
docker tag gcr.io/google-samples/hello-app:1.0 localhost:5000/hello-app:1.0
```
>推送 image 到 local registry
```gherkin=
docker push localhost:5000/hello-app:1.0
```
>從 local registry 部署 image 到Kind
```gherkin=
kubectl create deployment hello-server --image=localhost:5000/hello-app:1.0
```
