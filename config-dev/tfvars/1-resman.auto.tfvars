global_shared_services = {
  "hub" = {
    display_name = "Hub"
    subscriptions = {
      "global-network-prd-0" = {
        display_name = "Global Network Production"
        tags = {
          "application" : "Shared"
        }
      }
      "global-network-dev-0" = {
        display_name = "Global Network Development"
        tags = {
          "application" : "Shared"
        }
      }
    }
  }
  "identity" = {
    display_name = "Identity Platform"
  }
  "mgmt" = {
    display_name = "Management"
     subscriptions = {
      "global-management-0" = {
        display_name = "Global Network Production"
        tags = {
          "application" : "Shared"
        }
      }
     }
  }
  "security" = {
    display_name = "Security"
    subscriptions = {
        "global-security-0" = {
        display_name = "Global Security"
        tags = {
          "application" : "Shared"
        }
      }
    }
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