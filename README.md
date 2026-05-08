# MyJenkinsProject

A comprehensive Jenkins CI/CD pipeline project demonstrating automated building, testing, and deployment of a Python application using Docker and DockerHub.

## Overview

This project showcases a complete CI/CD workflow using Jenkins to:
- Verify Python environment
- Execute Python applications
- Build Docker images
- Authenticate with DockerHub
- Push images to Docker registry
- Deploy containerized applications
- Send build notifications

The pipeline is triggered automatically via Git integration and uses Jenkins Declarative Pipeline syntax with Docker for containerization.

## Project Structure

```
MyJenkinsProject/
├── Jenkinsfile          # Jenkins pipeline definition (CI/CD configuration)
├── Dockerfile           # Docker image configuration
├── helloworld.py        # Python application source code
├── README.md            # Project documentation (this file)
├── LICENSE              # MIT License
└── .git/                # Git repository
```

## File Descriptions

### Jenkinsfile
The Jenkins pipeline definition file that orchestrates the entire CI/CD workflow. It includes:
- **Pipeline Agent**: Runs on any available Jenkins agent
- **6 Pipeline Stages**:
  1. Check Python Version - Verifies Python 3 is installed and accessible
  2. Running Python Script - Executes the helloworld.py application
  3. Building Docker Image - Constructs Docker image from Dockerfile
  4. Docker Login - Authenticates with DockerHub using stored credentials
  5. Pushing Docker Image - Pushes the built image to DockerHub registry
  6. Container Deployment - Runs the Docker container in detached mode
- **Post Build Actions**: Success and failure notifications

**Docker Credentials Required**: Configure Jenkins credential ID `dockerhub-cred` with DockerHub username and password/token.

### Dockerfile
Lightweight Docker container configuration:
- **Base Image**: `python:3.8-slim` (minimal Python 3.8 environment)
- **Working Directory**: `/app`
- **Application**: Copies `helloworld.py` into the container
- **Execution**: Runs Python 3 with the helloworld.py script as entry point
- **Registry**: Pushes to `docker.io/umahalle/helloworld:latest`

### helloworld.py
Simple Python application that prints a greeting message:
```python
print ("Hi Umakant Welcome to jenkins")
```

This demonstrates the Python script execution stage in the Jenkins pipeline.

### LICENSE
MIT License - Permits free use, modification, and distribution with attribution.

## Prerequisites

### Local Development
- Python 3.8 or higher
- Docker installed and running
- Git for version control

### Jenkins Environment
- Jenkins server with Pipeline plugin
- Docker support on Jenkins agent(s)
- DockerHub account and valid credentials
- Git integration configured

## Features

✅ **Automated Python Verification** - Checks Python version compatibility
✅ **Python Execution** - Runs and tests Python applications
✅ **Docker Containerization** - Builds production-ready Docker images
✅ **Registry Integration** - Automated DockerHub authentication and image push
✅ **Automated Deployment** - Deploys containers in production environment
✅ **Pipeline Notifications** - Success/failure status notifications
✅ **Version Control Integration** - Git-based trigger for continuous integration
✅ **Credential Management** - Secure DockerHub credential handling

## Getting Started

### 1. Clone the Repository
```bash
git clone <repository-url>
cd MyJenkinsProject
```

### 2. Local Testing (Optional)
```bash
# Test the Python application locally
python3 helloworld.py

# Build Docker image locally
docker build -t helloworld:latest .

# Run the container
docker run -d --name HelloWorldMsg helloworld:latest
```

### 3. Configure Jenkins

#### Step 1: Add DockerHub Credentials
1. Go to Jenkins Dashboard → Manage Jenkins → Manage Credentials
2. Create new credentials:
   - **Kind**: Username with password
   - **Username**: Your DockerHub username
   - **Password**: Your DockerHub password or access token
   - **ID**: `dockerhub-cred` (must match Jenkinsfile)

#### Step 2: Create Jenkins Pipeline Job
1. New Item → Pipeline
2. Configure Pipeline Script from SCM:
   - **SCM**: Git
   - **Repository URL**: URL of this repository
   - **Branch**: `*/main` or your branch name
   - **Script Path**: `Jenkinsfile`

#### Step 3: Trigger Pipeline
- Manual: Click "Build Now" on the job page
- Automatic: Configure Git webhook for automatic triggers on push

## Jenkins Pipeline Workflow

```
Pipeline Start
    ↓
Check Python Version → Verify python3 --version
    ↓
Run Python Script → Execute helloworld.py
    ↓
Build Docker Image → docker build -t docker.io/umahalle/helloworld:latest .
    ↓
Docker Login → Authenticate with DockerHub (stored credentials)
    ↓
Push Docker Image → Push to docker.io/umahalle/helloworld:latest
    ↓
Deploy Container → docker run -d docker.io/umahalle/helloworld:latest
    ↓
Post Actions → Success/Failure Notification
```

## Configuration Details

### Docker Registry
- **Registry URL**: docker.io
- **Username**: umahalle (DockerHub account)
- **Image Name**: helloworld
- **Tag**: latest

### Jenkins Configuration
- **Agent**: any (runs on any available agent)
- **Credential ID**: dockerhub-cred
- **Post Actions**: 
  - **Success**: Echoes "Build and deployment successful!"
  - **Failure**: Echoes "Build or deployment failed."

## Common Issues & Troubleshooting

| Issue | Solution |
|-------|----------|
| Credential not found | Ensure `dockerhub-cred` is configured in Jenkins with correct ID |
| Docker login fails | Verify DockerHub credentials and ensure access token (not password) if 2FA enabled |
| Container already running | Remove existing container: `docker rm -f HelloWorldMsg` |
| Python version mismatch | Ensure Python 3.8+ is installed on Jenkins agent |
| Permission denied (docker) | Add Jenkins user to docker group: `usermod -aG docker jenkins` |

## Customization

### Change Docker Image Name
Edit the Jenkinsfile stages:
- Replace `docker.io/umahalle/helloworld:latest` with your image name
- Update `HelloWorldMsg` container name if desired

### Modify Python Script
Edit `helloworld.py` with your Python application code

### Adjust Python Version
Modify Dockerfile:
```dockerfile
FROM python:3.10-slim  # Change version here
```

## Development Workflow

1. **Local Development**: Write code and test locally
2. **Git Commit**: Push changes to repository
3. **Jenkins Trigger**: Pipeline automatically triggers via SCM webhook
4. **Build Stage**: Python and Docker checks execute
5. **Deployment**: Container built, pushed, and deployed
6. **Notification**: Success/failure feedback provided

## Best Practices Applied

- ✅ Infrastructure as Code (Jenkinsfile)
- ✅ Containerization (Docker)
- ✅ Secure credential management
- ✅ Automated testing and deployment
- ✅ Version control integration
- ✅ Build notifications
- ✅ Lightweight base images (python:3.8-slim)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

**Umakant Mahalle** (UmakantMaha1992)
- Created: 2026
- Purpose: Jenkins CI/CD Pipeline Learning & Demonstration

## Support

For issues, questions, or improvements:
1. Check the Troubleshooting section above
2. Review Jenkins logs for detailed error messages
3. Verify all prerequisite tools are installed and configured correctly
4. Ensure DockerHub credentials are valid and properly configured in Jenkins

---

**Last Updated**: May 2026
