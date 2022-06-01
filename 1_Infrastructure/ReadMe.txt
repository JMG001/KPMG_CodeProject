Simple AWS CloudFormation script to create a Database Instance and EC2 Instance running IIS for a web front end.

Started with AWS EC2 and RDS templates, and modified from there. Built up from JSON as I've never used YAML before.

Parameters for:
  Key Pair
  Resource Group Name
  Instance Type
  SSH Range for access
  DB User
  DB password
  
These parameters ensure the environment can be re-used across multiple VPCs as a template for building out preconfigured solutions.

Ideally I'd like to add in Multiple AZ's to allow for Autosclaing groups and secondary RDS nodes, and ELB and public access mechanims/security such as Route 53 and WAF.
Further security could also be added between the tiers (Web and DB) to ensure only traffic from the specific resources in the Architecture Diagram are allowed. This script assumes there is already an existing VPC configured, however this could also be added with parameters to ensure a quick build scratch via template. Refinement around disc on the EC2 instances could also be added, as I haven't included the option to pick storage types.
