Simple AWS CloudFormation script to create a Database Instance and EC2 Instance running IIS for a web front end. Based on AWS EC2 and RDS templates and modified from there. JSON format.

Parameters have been utilised to ensure the Cloud Formation script is reusable, and the stack build can be re-used across multiple VPCs as a template for building out preconfigured solutions. 

Parameters for:
  Key Pair
  Resource Group Name
  Instance Type
  SSH Range for access
  DB User
  DB password

Ideally I'd like to add in Multiple AZ's to allow for Autosclaing groups and secondary RDS nodes, and ELB and public access mechanims/security such as Route 53 and WAF.
Further security could also be added between the tiers (Web and DB) to ensure only traffic from the specific resources in the Architecture Diagram are allowed. This script assumes there is already an existing VPC configured (subnets etc), however this could also be added with parameters to ensure a quick build from scratch via template. Refinement around disc on the EC2 instances could also be added, as I haven't included the option to pick storage types.

Also the ability to automate the IIS installation and configuration, Web App deployment and RDS schema and data configuration would be a handy addition to this process. Otherwise, building this into the base AMI might be acceptable and more robust moving forward, while potentially reducing build times.
