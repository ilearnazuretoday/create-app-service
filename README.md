# App Service: Azure PaaS

Azure App Service is a fully managed service for building, deploying, and scaling your web apps, web APIs and other service side workloads. App service is azure PaaS offering, PaaS stands for **Platform as a Service**.

[Heroku](https://www.heroku.com/) was the first company to introduce PaaS-like offering.

## What are the benefits of PaaS?

Modern software infrastructure is pretty complicated, form VMs, to containers. From monolithic applications to serverless, from on-prem to hybrid modes. Everything is more connected, IoT and edge requirements push the boundaries of what is considered possible every day! Technologies like [WASM](https://webassembly.org/), [RISC-V](https://riscv.org/), Kubernetes, Machine Learning & AI, Quantum Computing and many more will completely revolutionize how software is created, delivered and personalized.

This is all great, but how should developers keep up with all the building and deployment options? How to easily monitor and operationalizing all those various workloads? That's there PaaS comes in.

PaaS bridges the gap between underlying hosting platform and running workloads, by providing a **good balance between opinionated defaults and configuration options**.

> In other words a good PaaS offering will be flexible enough to accommodate for different needs and workloads and intelligent enough to hide infrastructure  complexity by providing smart abstraction layer to work with.

### Choose where to host your micro(service)

Azure, like any other major cloud provider, offers a lot of services to choose from. Most often than not, the sheer number of options and services is just plain confusing. Below diagram guides you through the decision process and helps understand where PaaS offering is a good choice.

In general, if you have a workloads that will be consumer facing via http(s), like a web page, web api, etc, Azure App Service is a good choice.

![App Service Hosting](https://docs.microsoft.com/en-us/azure/architecture/guide/technology-choices/images/compute-choices.png)
*source: [Azure docs](https://docs.microsoft.com/en-us/azure/architecture/guide/technology-choices/compute-decision-tree)*

Other than standard hosting options, now it is possible to run App Service on Azure Arc enabled Kubernetes anywhere. This is a pretty interesting feature, because it extends Azure App Service control plane and runs it on top of Kubernetes, meaning that if you have App Services running in Azure already,you could run them for example on-prem on a Kubernetes cluster and still use Azure App Service abstraction as you would in Azure itself.

![App Service Run on Azure Arc](/media/run-anywhere.png)
*please refer to [this blog](https://azure.microsoft.com/en-us/blog/build-cloudnative-applications-that-run-anywhere/#azure-application-services:-run-your-apps-anywhere) for more details*

### Choose App Service SKU plan

Finally, in order to run our App Service, we need to select a SKU (Stock Keeping Unit) plan that will define the capabilities of the underlying infrastructure.

Here we can decide how much CPU and RAM should our infrastructure have, what are the auto-scaling rules and other features, like support for custom certificates or custom domain names etc.

> for full list of available configuration options please refer to [Azure Docs](https://docs.microsoft.com/en-us/azure/app-service/overview-hosting-plans)

Since there is no good graphical representation helping us choose between SKUs (similar to the one helping us choose between hosting options for our service), I have created one:

![App Service SKU](/media/app-service-sku.png)

## HTML Demo

This demo is a sample html page served from nginx server running in a docker container.

## Infrastructure

To setup our testing infrastructure, we will take advantage of the fact that Azure Cloud Shell comes with pre-installed terraform.

You don't need to be familiar with terraform, all commands will be provided, but remember **always check scripts from internet before executing**. All scripts are part of the learning repository here:
TODO: repository link

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

## Resources