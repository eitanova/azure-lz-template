### PURPOSE
This stage focuses on setting up shared services resources that operate at a global level within the landing zone. Its primary objective is to establish foundational services such as networking, identity, monitoring, and other capabilities that can be used across all environments. This stage promotes consistency, simplifies management, and enhances security across the organization’s cloud footprint.

### RESOURCES
This section describe which resources will be created at this stage
- Internet connectivity components (vnets, palo alto firewall, vpn gateway, etc...) for both dev and prd environments
- On-Prem connectivity components (vnets, vpn, etc..) for both dev and prd environments
- Management components with connection to palo alto panorama in other cloud
- Security components (not cross cloud security)
- Trusted / untrusted zones for dev

All data related to division network (subnets and all) 

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