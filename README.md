# Jenkins 


````
aws ecr get-login
````

Take only the token part only: 
````
kubectl create secret docker-registry com.emasphere.dev.ecr --docker-username=AWS --docker-password=[TOKEN] --docker-server=840205991060.dkr.ecr.eu-central-1.amazonaws.com --docker-email=[USER]@emasphere.com
````

````
kubectl port-forward --namespace kube-system $(kubectl get po -n kube-system | grep kube-registry-v0 | \awk '{print $1;}') 5000:5000
````

## Links

* [Available Plugins](https://updates.jenkins.io/download/plugins/role-strategy/)
* [Configuration as Code Plugin](https://github.com/jenkinsci/configuration-as-code-plugin)
* [Security Configuration as Code](https://github.com/jenkinsci/configuration-as-code-plugin/blob/master/demos/credentials/credentials.yaml)
* [Kubernetes Credentials Provider](https://jenkinsci.github.io/kubernetes-credentials-provider-plugin/examples/)
* [SonarQube](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner-for-jenkins/)
* [OAuth Configuration for Local](https://ktor.io/quickstart/guides/oauth.html)


rm -rf ~/.kube/http-cache/*  
minikube config set memory 6000


Attention token sonar à intégrer
