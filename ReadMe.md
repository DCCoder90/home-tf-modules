Just working on breaking these modules out for now.  Will update the documentation later.

Just a quick note.  When using any of the following modules:

- docker
- docker-service
- docker-network
- docker-stack

The provider configuration has to be set by the caller.  As outlined in the [legacy module documentation](https://developer.hashicorp.com/terraform/language/modules/develop/providers#legacy-shared-modules-with-provider-configurations)