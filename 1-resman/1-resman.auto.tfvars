global_shared_services = {
  "hub" = {
    display_name = "Hub"
    subscriptions = {
      "global/prd/network" = {
        #alias        = "global-network-prd-0"
        display_name = "sky-global-shared-prd-network-0"
        tags = {
          "department" : "turkiz"
          "accountname" : "gem"
          "costcenter" : "alexandrite"
          "createddate" : "29-04-2025"
          "expirationdate" : "30-11-2025"
          "environment" : "prd"
          "budget" : "500"
          "application" : "shared-poc"
          "owners" : "Yehuda-Samuel"
          "source" : "aladdin"
        }
      }
      "global/dev/network" = {
        #alias        = "global-network-dev-0"
        parent_id = "/providers/Microsoft.Management/managementGroups/sky-dev-shared-services"
        display_name = "sky-global-shared-dev-network-0"
        tags = {
          "department" : "turkiz"
          "accountname" : "gem"
          "costcenter" : "alexandrite"
          "createddate" : "29-04-2025"
          "expirationdate" : "30-11-2025"
          "environment" : "dev"
          "budget" : "500"
          "application" : "shared-poc"
          "owners" : "Yehuda-Samuel"
          "source" : "aladdin"
        }
      }
      "dev/network/trusted" = {
        parent_id = "/providers/Microsoft.Management/managementGroups/sky-dev-shared-services"
        display_name = "sky-trusted-dev-network-0"
        tags = {
          "department" : "turkiz"
          "accountname" : "gem"
          "costcenter" : "alexandrite"
          "createddate" : "29-04-2025"
          "expirationdate" : "30-11-2025"
          "environment" : "dev"
          "budget" : "500"
          "application" : "shared-poc"
          "owners" : "Yehuda-Samuel"
          "source" : "aladdin"
        }
      }
       "dev/network/untrusted" = {
        parent_id = "/providers/Microsoft.Management/managementGroups/sky-dev-shared-services"
        display_name = "sky-untrusted-dev-network-0"
        tags = {
          "department" : "turkiz"
          "accountname" : "gem"
          "costcenter" : "alexandrite"
          "createddate" : "29-04-2025"
          "expirationdate" : "30-11-2025"
          "environment" : "dev"
          "budget" : "500"
          "application" : "shared-poc"
          "owners" : "Yehuda-Samuel"
          "source" : "aladdin"
        }
      }
      "global/prd/on-prem" = {
        #alias        = "global-on-prem-prd-0"
        display_name = "sky-global-shared-on-prem-0"
        tags = {
          "department" : "turkiz"
          "accountname" : "gem"
          "costcenter" : "alexandrite"
          "createddate" : "29-04-2025"
          "expirationdate" : "30-11-2025"
          "environment" : "dev"
          "budget" : "500"
          "application" : "shared-poc"
          "owners" : "Yehuda-Samuel"
          "source" : "aladdin"
        }
      }
    }
  }
  "identity" = {
    display_name = "Identity Platform"
        subscriptions = {
      "global/prd/Identity Platform" = {
        display_name = "sky-global-identity-0"
        tags = {
          "department" : "turkiz"
          "accountname" : "gem"
          "costcenter" : "alexandrite"
          "createddate" : "29-04-2025"
          "expirationdate" : "30-11-2025"
          "environment" : "dev"
          "budget" : "500"
          "application" : "shared-poc"
          "owners" : "Yehuda-Samuel"
          "source" : "aladdin"
        }
      }
    }
  }
  "mgmt" = {
    display_name = "Management"
    subscriptions = {
      "global/prd/management" = {
        #alias        = "global-management-0"
        display_name = "sky-global-shared-management-0"
        tags = {
          "department" : "turkiz"
          "accountname" : "gem"
          "costcenter" : "alexandrite"
          "createddate" : "29-04-2025"
          "expirationdate" : "30-11-2025"
          "environment" : "dev"
          "budget" : "500"
          "application" : "shared-poc"
          "owners" : "Yehuda-Samuel"
          "source" : "aladdin"
        }
      }
    }
  }
  "security" = {
    display_name = "Security"
  }
}
divisions_shared_services = {
  "trusted" = {
    parent = "networking"
  }
  "untrusted" = {
    parent = "networking"
  }
}
