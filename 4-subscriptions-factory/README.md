### PURPOSE
This stage automates the creation of new subscriptions and applies the necessary RBAC permissions based on organizational policies. It also provisions a protected virtual network with predefined subnets and establishes peering to shared services, ensuring secure and consistent connectivity from the start.
each state is divided for division.

### RESOURCES
This section describe which resources will be created at this stage
- Workload subscription
- RBAC bindings for the subscription
- Protected RG with vnet and subnet
- Peering to proper trusted/untrusted vnet
- user permission on the vnet


### SETUP
authenticate to microsoft using az cli <br>
``` 
az login
 ```

links proper providers and tfvars file using stage_links.sh file.
supply designated environment<br>

```
./stage_links.sh <envrionment> <division>
```