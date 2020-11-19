# PRM GP2GP support infrastructure

This is the minimal, very first setup of terraform backend in S3 and DynamoDB.

The terraform state produced in this repository is pushed to a separate bucket with AWS CLI.

## Bootstrapping Terraform

Export your AWS credentials in shell (if you have credentials in `~/.aws/credentials` that will work too):

```
export AWS_ACCESS_KEY_ID=***********
export AWS_SECRET_ACCESS_KEY=**************************
unset AWS_SESSION_TOKEN
```

Enter docker container with terraform and AWS CLI by typing:

```
dojo
```

at the root of this repository.

Assume role with elevated permissions:

```
eval $(aws-cli-assumerole -rmfa <role-arn> <mfa-otp-code>)
```

## Working with common account

```bash
NHS_ACCOUNT=common ./tasks pull
NHS_ACCOUNT=common ./tasks plan
NHS_ACCOUNT=common ./tasks apply
```
