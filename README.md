# Create App Service

## Resources

### Choose App Service SKU plan

![App Service SKU](app-service-sku.png)

## HTML Demo

This demo is a sample html page served from nginx server running in a docker container.

### Setup docker container

```bash
# Login to Azure
az login

# Login to container registry
az acr login --name acrlearningazure

# Build image locally
docker build -t acrlearningazure.azurecr.io/nginx-demo:1.0 .

# Finally push image to registry
docker push acrlearningazure.azurecr.io/nginx-demo:1.0
```

Remember to retag image with new version. For now this will be manual process.