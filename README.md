

# Jenkins Pipeline: Build & Publish Apache Docker Image to Docker Hub

## Overview

This project demonstrates how to set up a Jenkins Freestyle project that automatically builds and publishes an Apache web server Docker image to Docker Hub. The Dockerfile used for building the image is sourced from a GitHub repository.

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- **Jenkins Server**: Jenkins installed and running.
- **Docker**: Docker installed on the Jenkins server (or agent) that will run the build.
- **GitHub Repository**: A GitHub repository containing the `Dockerfile` and other necessary files (e.g., `index.html`).
- **Docker Hub Account**: Docker Hub account with a repository set up for the image.

## Project Structure

```plaintext
├── Dockerfile
└── index.html
```

- `Dockerfile`: Contains the instructions for building the Apache Docker image.
- `index.html`: A sample HTML file to be served by the Apache server.

## Jenkins Pipeline Setup

### Step 1: Create a Jenkins Freestyle Project

1. **Open Jenkins Dashboard**: Go to your Jenkins dashboard.
2. **Create New Item**: Click on "New Item" and select "Freestyle project" as the project type.
3. **Project Name**: Enter a name for your project, e.g., `Apache-Docker-Build`.
4. **Source Code Management (SCM)**:
   - **Git**: Choose "Git" and provide the URL to your GitHub repository containing the `Dockerfile`.
   - **Credentials**: Add credentials for accessing your GitHub repository if needed.

### Step 2: Configure the Build Steps

1. **Add Build Step**: Click "Add build step" and select "Execute shell".
2. **Shell Command**: Add the following script to build the Docker image:

   ```bash
   docker build -t christ2222/jenkins-apache-image:v1 .
   ```

3. **Add Post-Build Action**: Click "Add post-build action" and select "Run only if build succeeds".

### Step 3: Publish Docker Image to Docker Hub

1. **Add Post-Build Action**:
   - **Add Build Step**: Select "Execute shell" again.
   - **Shell Command**: Add the following script to push the Docker image to Docker Hub:

     ```bash
     docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
     docker push christ2222/jenkins-apache-image:v1
     ```

   - **Credentials**: Make sure that `$DOCKER_USERNAME` and `$DOCKER_PASSWORD` are set up as environment variables in Jenkins (or as secret text credentials).

### Step 4: Add Docker Hub Credentials to Jenkins

1. **Manage Jenkins**: Go to "Manage Jenkins" > "Manage Credentials".
2. **Add Credentials**:
   - Scope: Global
   - Username: Your Docker Hub username (save it as `$DOCKER_USERNAME`)
   - Password: Your Docker Hub password (save it as `$DOCKER_PASSWORD`)
   - ID: You can name these credentials as you see fit.

### Step 5: Run the Pipeline

1. **Build Now**: Go to your Jenkins project and click "Build Now".
2. **Monitor the Build**: Watch the build progress in the Jenkins console output.
3. **Verify on Docker Hub**: After a successful build, check your Docker Hub repository to see the newly published image.

## Conclusion

By following this guide, you've set up a Jenkins Freestyle project that automates the process of building a Docker image for an Apache web server and pushing it to Docker Hub. This setup is ideal for CI/CD workflows where continuous integration and deployment of Docker images are required.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This `README.md` file provides clear instructions for setting up the Jenkins pipeline using a Freestyle project, making it easy to follow and implement.
