---
layout: home
title: Command Reference
subtitle: Complete guide to all JUDO CLI commands
hide_hero: true
sections:
  - id: system-commands
    title: "System Commands"
    subtitle: "Environment and project management"
    blocks:
      - heading: "judo doctor"
        text: "Comprehensive system health checks for required tools, port availability, and project status. Auto-installs SDKMAN and development tools.<br><code>judo doctor</code><br><code>judo doctor -v</code> (verbose)"
      - heading: "judo init"
        text: "Initialize a new JUDO project in the current directory with proper structure and configuration files.<br><code>judo init</code>"
      - heading: "judo session"
        text: "Interactive session with command history, tab completion, and contextual help for enhanced development workflow.<br><code>judo session</code>"
  - id: build-commands
    title: "Build Commands"
    subtitle: "Building and development workflows"
    blocks:
      - heading: "judo build"
        text: "Build project components (model, backend, frontend, karaf) with configurable options. Supports parallel builds, component selection, and custom Maven arguments.<br><code>judo build</code><br><code>judo build -q</code> (quick mode)<br><code>judo build -a</code> (backend only)<br><code>judo build -f</code> (frontend only)<br><code>judo build --docker</code> (include Docker images)"
      - heading: "judo reckless"
        text: "Fast build and run mode for development - equivalent to quick build + start. Skips Karaf packaging for speed.<br><code>judo reckless</code>"
  - id: lifecycle-commands
    title: "Application Lifecycle"
    subtitle: "Start, stop, and monitor your applications"
    blocks:
      - heading: "judo start"
        text: "Start your application and all required services.<br><code>judo start</code><br><code>judo start --profile=compose-dev</code>"
      - heading: "judo stop"
        text: "Stop the running application and services.<br><code>judo stop</code>"
      - heading: "judo status"
        text: "Check the status of all services and components.<br><code>judo status</code>"
      - heading: "judo log"
        text: "View application logs with optional filtering.<br><code>judo log</code><br><code>judo log --follow</code><br><code>judo log --service=database</code>"
  - id: database-commands
    title: "Database Operations"
    subtitle: "Backup, restore, and schema management"
    blocks:
      - heading: "judo dump"
        text: "Create a backup of your database.<br><code>judo dump</code><br><code>judo dump --output=backup.sql</code>"
      - heading: "judo import"
        text: "Restore database from a backup file.<br><code>judo import backup.sql</code>"
      - heading: "judo schema-upgrade"
        text: "Perform database schema migration.<br><code>judo schema-upgrade</code>"
  - id: maintenance-commands
    title: "Maintenance Commands"
    subtitle: "Cleanup and updates"
    blocks:
      - heading: "judo clean"
        text: "Clean the development environment and remove temporary files.<br><code>judo clean</code><br><code>judo clean --deep</code>"
      - heading: "judo prune"
        text: "Remove untracked files and cleanup workspace.<br><code>judo prune</code>"
      - heading: "judo update"
        text: "Update project dependencies to latest versions.<br><code>judo update</code>"
      - heading: "judo self-update"
        text: "Update the JUDO CLI tool itself to the latest version.<br><code>judo self-update</code>"
---

## Global Options

Most commands support these global options:

- `-e, --env <environment>` - Use alternate environment profile (default: judo)
- `-h, --help` - Show help for command
- `--verbose` - Enable detailed output
- `--version` - Show version information

## Quick Reference Table

| Command | Description | Key Flags |
|---------|-------------|-----------|
| `judo doctor` | System health check | `-v` (verbose) |
| `judo init` | Initialize project | |
| `judo build` | Build components | `-q` (quick), `-a` (backend), `-f` (frontend) |
| `judo start` | Start application | `--profile=<name>` |
| `judo stop` | Stop services | |
| `judo status` | Check status | |
| `judo session` | Interactive mode | |

## Detailed Command Information

### judo doctor

Performs comprehensive system health checks:

**What it checks:**
- Docker daemon status and availability
- Maven/Maven Daemon (mvnd) installation
- Git availability and configuration
- Java installation (optional)
- Port availability (8080, 8181, 5432)
- JUDO project initialization status

**Auto-installation features:**
- Automatically installs SDKMAN if missing
- Sets up development environment in JUDO projects
- Installs required Java and Maven versions

**Examples:**
```bash
judo doctor          # Basic health check
judo doctor -v       # Verbose with version info
```

### judo build

Builds project components with extensive configuration options:

**Build Components:**
- Model generation (Java classes, database schema)
- Backend compilation (Java, OSGi bundles, REST APIs)
- Frontend compilation (TypeScript/React, asset bundling)
- Karaf packaging (runnable distribution)
- Docker images (with `--docker` flag)
- Schema CLI tool (with `--build-schema-cli` flag)

**Key Flags:**
- `-q, --quick` - Fast build using cache, skip validations
- `-p, --build-parallel` - Parallel Maven build
- `-a, --build-app-module` - Build backend only
- `-f, --build-frontend-module` - Build frontend only
- `--skip-model/backend/frontend/karaf` - Skip specific components
- `-v, --version <version>` - Set custom version
- `-m, --maven-argument <args>` - Add extra Maven arguments

**Build Strategies:**
```bash
# Development workflow
judo build -q              # Quick full build
judo build -f -q           # Quick frontend build
judo build -a              # Backend only

# Production workflow  
judo build -v 1.0.0 --docker --build-schema-cli

# Parallel build
judo build -p              # Faster on multi-core systems
```

## Configuration Files

Commands read configuration from:

- `judo.properties` - Default configuration
- `{profile}.properties` - Profile-specific settings  
- `judo-version.properties` - Version constraints

## Getting Help

For detailed help on any command:

```bash
judo <command> --help      # Command-specific help
judo session               # Interactive help available
help <command>             # Within session mode
```