---
layout: home
title: Interactive Session
subtitle: Enhanced development workflow with persistent state and intelligent assistance
hide_hero: true
sections:
  - id: session-features
    title: "Session Features"
    subtitle: "Enhanced development capabilities"
    blocks:
      - heading: "Command History"
        text: "Persistent command history with search and navigation using Up/Down arrows and Ctrl+R"
      - heading: "Tab Completion"
        text: "Intelligent auto-completion for commands, options, file paths, and profile names"
      - heading: "Real-time Status"
        text: "Live status indicators showing services, build status, database health, and runtime mode"
      - heading: "Context Awareness"
        text: "Smart defaults, error recovery suggestions, and workflow guidance based on project state"
  - id: session-commands
    title: "Session Commands"
    subtitle: "Special commands available in interactive mode"
    blocks:
      - heading: "help & history"
        text: "Show available commands and manage command history with search and clear options"
      - heading: "watch & set"
        text: "Monitor services with auto-refresh and configure session preferences and profiles"
      - heading: "shortcuts"
        text: "Create and use custom command shortcuts for common workflows and operations"
  - id: advanced-features
    title: "Advanced Features"
    subtitle: "Power user capabilities"
    blocks:
      - heading: "Multi-command Execution"
        text: "Execute command sequences with && and ; operators for complex workflows"
      - heading: "Command Scheduling"
        text: "Schedule commands to run automatically at intervals or specific times"
      - heading: "Session Scripts"
        text: "Record and replay command sequences for repeatable deployment workflows"
      - heading: "Environment Variables"
        text: "Set and use session variables for dynamic command execution"
  - id: session-management
    title: "Session Management"
    subtitle: "Persistence and configuration"
    blocks:
      - heading: "Session Persistence"
        text: "Automatic saving of command history, environment variables, shortcuts, and preferences"
      - heading: "Multiple Sessions"
        text: "Run simultaneous named sessions for development, testing, and different environments"
      - heading: "Session Recovery"
        text: "Restore interrupted sessions and recover from corrupted state"
---

## Starting a Session

Launch an interactive session:

```bash
judo session
```

You'll enter a dedicated JUDO shell with enhanced capabilities:

```
JUDO Interactive Session v1.0.0
Type 'help' for commands, 'exit' to quit

judo> 
```

## Session Commands

### Basic Commands

All standard JUDO commands work within the session:

```bash
judo> init
judo> build
judo> start
judo> status
```

### Session-Specific Commands

#### `help`
Show available commands and session features:

```bash
judo> help
judo> help build  # Show help for specific command
```

#### `history`
View and manage command history:

```bash
judo> history          # Show recent commands
judo> history 10       # Show last 10 commands
judo> history clear    # Clear history
```

#### `status`
Enhanced status display with detailed information:

```bash
judo> status
Services:
  ✓ PostgreSQL    (port 5432)
  ✓ Keycloak      (port 8080) 
  ✓ Application   (port 9080)

Build: Last built 2 minutes ago (SUCCESS)
Runtime: Karaf mode (profile: default)
Database: Connected (3 tables)
```

#### `watch`
Monitor services and auto-refresh status:

```bash
judo> watch status    # Auto-refresh every 2 seconds
judo> watch log       # Follow logs in real-time
```

#### `set`
Configure session preferences:

```bash
judo> set profile compose-dev    # Switch profile
judo> set verbose true           # Enable verbose output
judo> set refresh-interval 5s    # Set status refresh rate
```

#### `shortcuts`
Create and use command shortcuts:

```bash
judo> shortcuts add bd "build --clean"
judo> shortcuts add restart "stop && start"
judo> bd                         # Runs build --clean
judo> restart                    # Runs stop && start
```

## Configuration

### Session Preferences

Configure session behavior in `~/.judo/session.properties`:

```properties
# History settings
history.max-entries=1000
history.auto-save=true

# Display settings
prompt.show-status=true
prompt.show-time=false
completion.auto-suggest=true

# Refresh intervals
status.refresh-interval=30s
log.tail-lines=50
```

### Custom Prompts

Customize the session prompt:

```bash
judo> set prompt "[%status%] %profile% > "
judo> set prompt-colors true
```

## Tips and Best Practices

### Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Ctrl+C` | Cancel current command |
| `Ctrl+D` | Exit session |
| `Ctrl+L` | Clear screen |
| `Ctrl+R` | Search history |
| `Tab` | Auto-complete |
| `↑↓` | Navigate history |

### Efficient Workflow

1. **Start with session**: Use `judo session` for all development work
2. **Use shortcuts**: Create shortcuts for common command sequences
3. **Monitor actively**: Keep `watch status` running in background
4. **Save configurations**: Export successful configurations as profiles

## Exiting the Session

To exit the interactive session:

```bash
judo> exit
# or
judo> quit
# or press Ctrl+D
```

Your session state is automatically saved and will be restored next time you start a session.