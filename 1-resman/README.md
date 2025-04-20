### PURPOSE
This stage is designed to handle the higher levels of the resource management hierarchy. Its main goal is to create a clear separation between the organization’s core structure and the later implementation stages—such as networking and other service layers. By introducing management groups and shared services subscriptions, it helps lay down a scalable and organized foundation. This approach not only promotes better governance and clarity, but also ensures that future stages can operate independently, with fewer dependencies and greater flexibility.

### RESOURCES
This section describe which resources will be created at this stage
- Management groups until the subunit level
- Global Shared services subscriptions
- Division's shared services subscriptions
- Policy assignment on designated management groups
- provider and tfvars for next stages **todo**

### SETUP
authenticate to microsoft using az cli <br>
``` 
az login
 ```

links proper providers and tfvars file using stage_links.sh file.
supply designated environment<br>

```
./stage_links.sh <envrionment>
```