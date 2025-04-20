### PURPOSE

This stage sets up shared services at the division level, including core resources like networking and monitoring. It provides a consistent foundation for landing zones within the division level, making it easier to manage and secure environments as they scale. Each division has their own state.

### RESOURCES
This section describe which resources will be created at this stage
- Division trusted zone components
- Division untrusted zone components


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