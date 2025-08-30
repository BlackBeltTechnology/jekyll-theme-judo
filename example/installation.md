---
layout: home
title: Installation Guide
subtitle: Get JUDO CLI up and running on your system
hide_hero: true
sections:
  - id: system-requirements
    title: "System Requirements"
    subtitle: "Before you begin installation"
    blocks:
      - heading: "Operating System"
        text: "macOS, Linux, or Windows with modern terminal support"
      - heading: "Java Development Kit"
        text: "JDK 11 or higher required for Karaf runtime mode"
      - heading: "Docker"
        text: "Docker Desktop or Docker Engine for containerized services"
      - heading: "Git"
        text: "Version control system for project management and updates"
  - id: installation-methods
    title: "Installation Methods"
    subtitle: "Choose your preferred installation approach"
    blocks:
      - heading: "Quick Install"
        text: "Use our installation tabs below for platform-specific instructions"
      - heading: "Package Managers"
        text: "Homebrew for macOS/Linux, or download from GitHub releases"
      - heading: "Build from Source"
        text: "Clone repository and build with Go for development or custom builds"
  - id: configuration
    title: "Configuration"
    subtitle: "Set up profiles and runtime modes"
    blocks:
      - heading: "Profile Configuration"
        text: "Create judo.properties for default settings and environment-specific profiles"
      - heading: "Karaf Runtime"
        text: "Local development with Apache Karaf server plus Docker services"
      - heading: "Compose Runtime"
        text: "Full containerized environment for consistent deployment"
  - id: maintenance
    title: "Updates & Troubleshooting"
    subtitle: "Keep your installation healthy"
    blocks:
      - heading: "Auto-update"
        text: "Use 'judo self-update' for automatic CLI updates"
      - heading: "System Health"
        text: "Run 'judo doctor' to verify environment and dependencies"
      - heading: "Common Issues"
        text: "PATH configuration, permissions, Docker setup, and Java installation"
---

{% include install-tabs.html %}

## Verify Installation

After installation, verify that JUDO CLI is properly installed:

```bash
judo --version
```

Run a system health check:

```bash
judo doctor
```

This command will verify that all required dependencies are available and properly configured.

## Building from Source

If you prefer to build from source or contribute to development:

### Prerequisites

- **Go**: Version 1.19 or higher
- **Git**: For cloning the repository

### Build Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/BlackBeltTechnology/judo-cli.git
   cd judo-cli
   ```

2. Build the binary:
   ```bash
   go build -o judo ./cmd/judo
   ```

3. Install to your PATH:
   ```bash
   sudo mv judo /usr/local/bin/
   ```

## Initial Setup

After installation, initialize your first project:

```bash
mkdir my-judo-project
cd my-judo-project
judo init
```

## Profile Configuration

JUDO CLI uses profile-based configuration. Create or modify these files:

### Default Profile (`judo.properties`)
```properties
# Application settings
app.name=my-application
app.version=1.0.0

# Database configuration
db.host=localhost
db.port=5432
db.name=myapp
```

### Environment Profiles
Create environment-specific files like `compose-dev.properties`:

```properties
# Development environment settings
runtime.mode=compose
log.level=debug
hot.reload=true
```

### Version Constraints (`judo-version.properties`)
```properties
# Minimum versions
judo.min.version=1.0.0
java.min.version=11
docker.min.version=20.10.0
```

## Runtime Modes

To switch runtime modes, use the `--profile` flag:

```bash
judo start --profile=compose-dev
```

## Updating

### Auto-update (Recommended)

JUDO CLI can update itself:

```bash
judo self-update
```

### Manual Update

#### Homebrew
```bash
brew update
brew upgrade judo
```

#### Manual Installation
Download the latest release and replace your existing binary.

## Troubleshooting

### Common Issues

**Command not found:**
- Ensure the binary is in your PATH
- On macOS, you may need to allow the binary in Security & Privacy settings

**Permission denied:**
- Make sure the binary has execute permissions: `chmod +x judo`
- Use `sudo` if installing to system directories

**Docker issues:**
- Ensure Docker is running: `docker ps`
- Check Docker permissions for your user

**Java not found:**
- Install Java JDK 11 or higher
- Set JAVA_HOME environment variable

### Getting Help

If you encounter issues:

1. Run `judo doctor` to check your environment
2. Check the [GitHub Issues](https://github.com/BlackBeltTechnology/judo-cli/issues)
3. View detailed logs with `judo --verbose <command>`

## Uninstallation

### Homebrew
```bash
brew uninstall judo
```

### Manual Installation
```bash
sudo rm /usr/local/bin/judo
```

### Clean Configuration
Remove configuration files:
```bash
rm -rf ~/.judo
```