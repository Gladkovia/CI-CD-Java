#!/bin/bash
set -x

tag=$(curl -s  https://github.com/gladkovia/ci-cd-java/pkgs/container/ci-cd-java%2Fci-cd-java | grep ci-cd-java: | awk 'FS="java:"{print$9}' | sed 's/"//' | cut -d ':' -f2)
val=$(cat /var/lib/jenkins/workspace/ci-cd-github-jenkins-k8s/java-deploy-helm/values.yaml | awk 'FS="image: "{print$2}' | tr -s '\n' | tail -1 | cut -d ':' -f2)
#file=$(/var/lib/jenkins/workspace/ci-cd-github-jenkins-k8s/java-deploy-helm/values.yaml)

if [[ $tag == $val ]]; then
  echo "yes"
elif [[ $val != $tag ]]; then 
  echo "No"
#  sed -i 's/$val/$tag/' /var/lib/jenkins/workspace/ci-cd-github-jenkins-k8s/java-deploy-helm/values.yaml
fi