# The Cloud Squad (Backend & Infra)

The Cloud Squad is a platform designed to help users assess their AWS exam readiness through a quick 30-minute test. This backend repository powers the core functionality of the platform, including test management, user scoring, and integration with AWS services. Additionally, it supports generating detailed performance and analysis reports using an LLM to provide actionable insights for exam takers.

## Features

- **AWS Exam Readiness Test**: Dynamically generates a set of 30 questions from a question bank stored in DynamoDB.
- **User Management**: Tracks user sessions and scores in DynamoDB.
- **Performance Analysis**: Integrates with an LLM to generate detailed test performance and analysis reports.
- **Review System**: Allows users to submit ratings and reviews for the platform.
- **API Gateway Integration**: Provides APIs for the frontend to interact with the backend.
- **Secure Infrastructure**: Implements IAM roles, policies, and S3 bucket configurations to ensure data security.

## Architecture

![alt text](<Architecture Diagram.png>)

The backend is built using Terraform for infrastructure as code and Python for Lambda functions. Here's an overview of the architecture:

1. **DynamoDB**:
   - Stores the question bank, user scores, and reviews.
   - Tables: `SAAQuestionBank`, `Scores`, and `Reviews`.

2. **Lambda Function**:
   - Handles core logic such as fetching questions, submitting tests, and generating reports.
   - Functions are written in Python and deployed using Terraform.

3. **API Gateway**:
   - Acts as the interface between the frontend and backend.
   - Routes include:
     - `POST /create-user`: Registers a new user.
     - `GET /saa-questions`: Fetches a set of random questions.
     - `POST /submit-test`: Submits test answers and calculates scores.
     - `GET /tests-taken`: Retrieves the total number of tests taken.
     - `POST /add-review`: Adds user reviews and ratings.

4. **S3**:
   - Stores Terraform state files securely with versioning and encryption enabled.

5. **LLM Integration**:
   - Generates personalized performance analysis reports based on test results.

## Deployment

The backend is deployed using Terraform. The infrastructure is divided into three environments:
- **Global**: Shared resources like the S3 bucket for Terraform state.
- **Stage**: Staging environment for testing.
- **Prod**: Production environment for live users.

## Frontend Integration

The backend APIs are consumed by the frontend application, which is hosted in a separate repository: [The Cloud Squad Frontend](https://github.com/ravikiranvm/the-cloud-squad-fe).
