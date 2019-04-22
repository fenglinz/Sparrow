#Depending on the operating system of the host machines(s) that will build or run the containers, the image specified in the FROM statement may need to be changed.
#For more information, please see https://aka.ms/containercompat

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-nanoserver-1803 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:2.2-nanoserver-1803 AS build
WORKDIR /src
COPY ["../Goldensoft.Architecture.WebUI/Goldensoft.Architecture.WebUI.csproj", "../Goldensoft.Architecture.WebUI/"]
RUN dotnet restore "../Goldensoft.Architecture.WebUI/Goldensoft.Architecture.WebUI.csproj"
COPY . .
WORKDIR "/src/../Goldensoft.Architecture.WebUI"
RUN dotnet build "Goldensoft.Architecture.WebUI.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Goldensoft.Architecture.WebUI.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Goldensoft.Architecture.WebUI.dll"]