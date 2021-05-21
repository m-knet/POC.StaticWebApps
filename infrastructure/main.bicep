param repositoryUrl string
param repositoryToken string
param repositoryBranch string = 'main'

param location string = 'westeurope'
param skuName string = 'Free'
param skuTier string = 'Free'

param appName string
param appLocation string = '/frontend'

resource staticWebApp 'Microsoft.Web/staticSites@2020-12-01' = {
  name: appName
  location: location
  sku: {
    name: skuName
    tier: skuTier
  }
  properties: {
    repositoryUrl: repositoryUrl
    repositoryToken: repositoryToken
    branch: repositoryBranch
    buildProperties: {
      appLocation: appLocation
      skipGithubActionWorkflowGeneration: true
      githubActionSecretNameOverride: 'AZURE_STATIC_WEB_APPS_API_TOKEN'
    }
  }
}
