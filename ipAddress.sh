docker ps -aq | xargs docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' >./ansible/hosts