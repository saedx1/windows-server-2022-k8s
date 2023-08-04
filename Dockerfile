FROM mcr.microsoft.com/dotnet/sdk:7.0.306-windowsservercore-ltsc2022 AS builder

WORKDIR /app

RUN dotnet new worker -o Worker -n DotNet.ContainerImage

WORKDIR /app/Worker

RUN dotnet publish

FROM mcr.microsoft.com/dotnet/aspnet:7.0.5-windowsservercore-ltsc2022

WORKDIR /app

COPY --from=builder /app/Worker/bin/Debug/net7.0/ /app/

ENTRYPOINT /app/DotNet.ContainerImage
