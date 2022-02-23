Commands: 
Project creation: dotnet new webapi -n weatherapi --framework "netcoreapp3.1"
Dockerfile Image creation: docker build -t luisenalvar/weatherapi .
DockerFile Run Container: docker run -p 8080:80 luisenalvar/weatherapi 
Push Image to DockerHun: docker login, docker push luisenalvar/weatherapi