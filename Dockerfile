FROM mcr.microsoft.com/dotnet/aspnet:7.0.5-windowsservercore-ltsc2022

COPY ./Worker/bin/Debug/net7.0/ /app/

ENTRYPOINT /app/DotNet.ContainerImage
