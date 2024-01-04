# AWS S3 + CLOUDFRONT + TERRAFORM + GITHUB ACTIONS + OIDC PROVIDER

![image](https://github.com/Chenwingu/AWS-S3-website/blob/main/aws-s3-architecture.png)

# 𝐈n𝐭r𝐨d𝐮c𝐭i𝐨n 
Secure deployment of static website on AWS S3 + AWS CloudFront using Terraform from GitHub Actions with OpenID Connect. The process leverages the GitOps approach for pipeline automation. Instead of storing AWS API Keys and Secrets Keys in GitHub secrets, we make it more secure by using GitHub OIDC Provider.

# 𝐏r𝐞r𝐞q𝐮i𝐬i𝐭e𝐬📝
Before automating Terraform with GitHub Actions, you need to set up:

𝐎I𝐃C C𝐨n𝐧e𝐜t𝐢o𝐧🚀 In AWS account create OIDC Provider (Trusted Entity)

𝐆i𝐭H𝐮b R𝐞p𝐨s𝐢t𝐨r𝐲📂 Create a private GitHub repository and note your username & repository name.

𝐀W𝐒 𝐈A𝐌 𝐈d𝐞n𝐭i𝐭y P𝐫o𝐯i𝐝e𝐫🔑 Create an IAM Identity Provider (OpenID Connect) in AWS.

**𝐒3 B𝐮c𝐤e𝐭 (B𝐚c𝐤e𝐧d)**🗄️ Create an S3 bucket to store the Terraform states.

𝐀W𝐒 𝐈A𝐌 𝐑o𝐥e a𝐧d P𝐨l𝐢c𝐢e𝐬🛡️ Create a role and policies in AWS IAM. The policies allow the role to access the S3 bucket where the Terraform states will be stored and to create an S3 bucket to host the website files, and CloudFront distribution.

T𝐞r𝐫a𝐟o𝐫m C𝐨d𝐞💻 Upload Terraform code to your GitHub repository.

G𝐢t𝐇u𝐛 𝐒e𝐜r𝐞t𝐬🔒 Create secrets in your GitHub Repository for GitHub Actions to use during the execution of the Terraform code.

# R𝐮n T𝐞r𝐫a𝐟o𝐫m C𝐨m𝐦a𝐧d𝐬

𝐒e𝐭t𝐢n𝐠 𝐔p G𝐢t𝐇u𝐛 𝐀c𝐭i𝐨n𝐬🎬 Create the GitHub Actions by creating a file in your GitHub repository [pipeline.yml](https://github.com/Chenwingu/AWS-S3-website/blob/main/.github/workflows/pipeline.yml)

**🤔 Adding Terraform configuration to GitHub Actions or other CI/CD Pipelines enhances visibility, traceability, repeatability, and simplicity.**

**Triggered the workflow:** Terraform changes will only be applied when there is a push event on the main branch.

**E𝐧h𝐚n𝐜i𝐧g t𝐡e F𝐮n𝐜t𝐢o𝐧a𝐥i𝐭y a𝐧d S𝐞c𝐮r𝐢t𝐲🔐**

The functionality and security of the static website hosted on AWS can be further enhanced with other AWS services including Route 53, AWS Certificate Manager, and WAF.
 
Please checkout project tutorial [link](https://medium.com/@chenwingu/securely-deploy-static-website-on-aws-s3-aws-cloudfront-using-terraform-from-github-actions-with-ac5e2060c33a)

