# AWS Infra provisioning, Jenkins CI/CD Pipeline and Monitoring Setup

1. **Provision AWS Environment with Terraform**:
      Use Terraform to create a VPC with public and private subnets, launch an EC2 instance with a web server, and set up firewall rules. See the `main.tf` file for the configuration.

2. **Set Up Jenkins CI/CD Pipeline**:
   Install Jenkins, configure it with necessary plugins and credentials, create a pipeline job, and use the provided Jenkinsfile to pull, build, test, and deploy the application to an AWS EC2 instance.

3. **Install and Configure CloudWatch Agent**:
   Install the CloudWatch Agent on your EC2 instance, configure it to collect CPU, memory, and disk metrics, and start the agent.

4. **Set Up CloudWatch Alarms**:
   Create a CloudWatch alarm to monitor CPU usage and an SNS topic to send email notifications if CPU usage exceeds 80%.
