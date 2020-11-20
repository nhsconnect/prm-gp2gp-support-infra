# PRM GP2GP support infrastructure

This is the minimal, very first setup of terraform backend in S3 and DynamoDB.

The terraform state produced in this repository is pushed to a separate bucket with AWS CLI.

## Setup

These instructions assume you are using:

- [aws-vault](https://github.com/99designs/aws-vault) to validate your AWS credentials.
- [dojo](https://github.com/kudulab/dojo) to provide an execution environment

## Bootstrapping Terraform

1. Enter the container:

`aws-vault exec <profile-name> -- dojo`

2. Invoke terraform locally:

- for common account

```
  NHS_ACCOUNT=common ./tasks pull
  NHS_ACCOUNT=common ./tasks plan
  NHS_ACCOUNT=common ./tasks apply
```

- for dev account

```
  NHS_ACCOUNT=dev ./tasks pull
  NHS_ACCOUNT=dev ./tasks plan
  NHS_ACCOUNT=dev ./tasks apply
```

- for preprod account

```
  NHS_ACCOUNT=preprod ./tasks pull
  NHS_ACCOUNT=preprod ./tasks plan
  NHS_ACCOUNT=preprod ./tasks apply
```

3. Push any state changes:

```
  NHS_ACCOUNT=<account_name> ./tasks push
```
