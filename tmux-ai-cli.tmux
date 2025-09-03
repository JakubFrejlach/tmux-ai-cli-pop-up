#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Default key bindings
tmux_ai_claude_key="@tmux_ai_claude_key"
tmux_ai_gemini_key="@tmux_ai_gemini_key"

# Shell configuration
tmux_ai_shell="@tmux_ai_shell"

# Get user-defined key bindings or use defaults
claude_key=$(tmux show-option -gqv "$tmux_ai_claude_key")
gemini_key=$(tmux show-option -gqv "$tmux_ai_gemini_key")
shell_type=$(tmux show-option -gqv "$tmux_ai_shell")

# Set default values if not configured
claude_key=${claude_key:-"u"}
gemini_key=${gemini_key:-"j"}
shell_type=${shell_type:-"zsh"}

# Bind keys to launch AI sessions
tmux bind-key "$claude_key" run-shell "$CURRENT_DIR/scripts/launch_claude_session '#{pane_current_path}' \"$shell_type\""
tmux bind-key "$gemini_key" run-shell "$CURRENT_DIR/scripts/launch_gemini_session '#{pane_current_path}' \"$shell_type\""