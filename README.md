# Understanding Project
This is a simple .NET Core 3.1 webapi template solution. The point of this repo is to learn about the following technologies: Docker, Terraform, Azure CLI, Azure DevOps, and Azure Portal services.

## Main Project Solution
A webapi template solution in which we can create with the following command using [.NETCore](https://dotnet.microsoft.com/en-us/download).
```bash 
dotnet new webapi -n weatherapi --framework "netcoreapp3.1"
```
Once, the solution is setup on your root folder, perform a quick solution **build** 
and solution **run** to ensure the solution is properly working. 

### Docker Image 
Next, we will create a docker image of this .NET Core solution. We stick only to the basics on 
creating this docker image. 
```bash 
// How to create your docker image
docker built -t [dockerhubuser]/[appname]
```
```bash 
// How to create and run your docker container
docker run -p 8080:80 [dockerhubuser]/[appname] .
```
Once, your container is running in the background or attached to a terminal. 
Then, proceed to open the browser to localhost:8080/WeatherForecast to view your api controller data. 
Now, we need to push our docker image to [DockerHub](https://hub.docker.com/). Make sure you signin to docker within your terminal. 
If its your first-time signing-in, then perform the following on your terminal and follow the instructions. 
```bash
docker login 
```
At this point, we can push our docker image to DockerHub with the following command. 
```bash 
docker push [dockerhubuser]/[appname]
```

### Terraform Setup 
Go to the [Terraform](https://www.terraform.io/downloads) download site and get your binary download for your system.
For Windows running on an AMD machine, download the Amd64 binary download zip file. Create a folder and move the exe appliction to the create folder; for example, C:\Terraform\terraform.exe. Next, you will need to edit your system PATH environment variable to include the terraform.exe file. Window search for **Edit the system environment variables** > Click on **Environment Variables** > Under **System variable** scroll down until you find Path or PATH select and make sure its highlighted and then > Click on **Edit** > Click on **New** > Enter C:\Terraform > Click on **Okay** twice and then click on **Appy**. You restart all of your terminal or do a quick system restart. 

At this point your should be able to run the following terraform command, otherwise seek help on the web.
```bash 
terraform --version 
```
For this project we simple to use Terraform to create a Azure Resource Group and Azure Container Instance. 