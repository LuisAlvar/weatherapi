# Get Base Image (Full .NET Core SDK)
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app 

# Copy csproj into empty container and restore inside the container
COPY *.csproj ./
RUN dotnet restore 

# Copy everything else into the container and build solution 
COPY . ./
RUN dotnet publish -c Release -o out

# Add the runtime image to container 
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app 
EXPOSE 80 
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet","weatherapi.dll"]