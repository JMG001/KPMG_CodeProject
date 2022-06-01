Simple AWS CloudFormation script to create a Database Instance and EC2 Instance running IIS for a web front end.

Started with AWS EC2 and RDS templates, and modified from there.

Parameters for:
  Key Pair
  Resource Group Name
  Instance Type
  SSH Range for access
  DB User
  DB password
  
These parameters ensure the environment can be re-used across multiple VPCs as a template for building out preconfigured solutions.
